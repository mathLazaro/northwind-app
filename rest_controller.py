from datetime import datetime
from flask import request, abort, jsonify

from app import app, engine
from dao import *

driver = DaoDriver()
driver_injection = DaoDriverInjecion()


@app.get('/customers')
def get_all_customers():
    try:
        return driver.select_all('customers')
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/employees')
def get_all_employees():
    try:
        return driver.select_all('employees')
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/shippers')
def get_all_shippers():
    try:
        return driver.select_all('shippers')
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/products')
def get_all_products():
    try:
        return driver.select_all('products')
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/products/<int:product_id>')
def get_product_by_id(product_id):
    dao_selector = request.args.get('dao')

    try:
        data = []

        # usa o dao driver
        if dao_selector == 'dao-driver' or dao_selector is None:
            response = driver.select_by_id(
                'products',
                'productid',
                product_id
            )
            data = response if response is not None else data

        # usa o dao driver com injection
        elif dao_selector == 'dao-driver-injection':
            response = driver_injection.select_by_id(
                'products',
                'productid',
                product_id
            )
            data = response if response is not None else data

        # usa o dao orm
        elif dao_selector == 'dao-orm':
            with Session(engine) as session:
                response = dao_orm.get_product_by_id(session, product_id)
                data = jsonify(response.to_dict()) if response else data

        return data
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/categories/<int:category_id>')
def get_category_by_id(category_id):
    dao_selector = request.args.get('dao')

    try:
        data = []

        # usa o dao driver
        if dao_selector == 'dao-driver' or dao_selector is None:
            response = driver.select_by_id(
                'categories',
                'categoryid',
                category_id
            )
            data = response if response is not None else data

        # usa o dao driver com injection
        elif dao_selector == 'dao-driver-injection':
            response = driver_injection.select_by_id(
                'categories',
                'categoryid',
                category_id
            )
            data = response if response is not None else data

        # usa o dao orm
        elif dao_selector == 'dao-orm':
            with Session(bind=engine) as session:
                response = dao_orm.get_category_by_id(session, category_id)
                data = jsonify(response.to_dict()) if response else data

        return data
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/order_details')
def get_order_details_by_id():
    order_id = request.args.get('orderid')
    product_id = request.args.get('productid')
    dao_selector = request.args.get('dao')

    if not order_id or not product_id:
        abort(400, description="Parâmetros 'orderid' e 'productid' são obrigatórios.")

    try:
        data = []

        # usa o dao driver
        if dao_selector == 'dao-driver' or dao_selector is None:
            response = driver.select_by(
                'order_details',
                {
                    'orderid': order_id,
                    'productid': product_id
                }
            )

            data = response if response is not None else data

        # usa o dao driver com injection
        elif dao_selector == 'dao-driver-injection':
            response = driver_injection.select_by(
                'order_details',
                {
                    'orderid': order_id,
                    'productid': product_id
                }
            )

            data = response if response is not None else data

        # usa o dao orm
        elif dao_selector == 'dao-orm':
            with Session(bind=engine) as session:
                response = dao_orm.get_order_details_by_id(
                    session, int(order_id), int(product_id))
                data = jsonify(response.to_dict()) if response else data

        return data
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.post('/orders')
def add_new_order():
    try:
        body: dict = request.get_json()
        dao_selector = request.args.get('dao')
        
        # usa o dao driver
        if dao_selector == 'dao-driver' or dao_selector is None:
            _handle_input(body, driver)
        # usa o dao driver com injection
        elif dao_selector == 'dao-driver-injection':
            _handle_input(body, driver_injection)
        # usa o dao orm
        elif dao_selector == 'dao-orm':
            with Session(engine) as session:
                dao_orm.insert_order(
                    session=session,
                    customer_id=body.get('customerid'),
                    employee_id=body.get('employeeid'),
                    order_date=datetime.datetime.now(),
                    required_date=body.get('requireddate'),
                    shipped_date=body.get('shippeddate'),
                    shipper_id=body.get('shipperid'),
                    freight=0 if body.get('freight') == "" else body.get('freight'),
                    ship_name=body.get('shipname'),
                    ship_address=body.get('shipaddress'),
                    ship_city=body.get('shipcity'),
                    ship_region=body.get('shipregion'),
                    ship_postal_code=body.get('shippostalcode'),
                    ship_country=body.get('shipcountry'),
                    items=body.get('items')
                )

        return "", 201
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


def _handle_input(body: dict, dao: DaoDriverGeneric):
    try:
        # adiciona order no banco
        order_id = dao.generate_id('orders', 'orderid')
        fields = ['customerid', 'employeeid', 'requireddate', 'shippeddate', 'freight', 'shipname',
                  'shipaddress', 'shipcity', 'shipregion', 'shippostalcode', 'shipcountry', 'shipperid']
        order_input = {key: body.get(key) for key in fields}

        order_input['orderdate'] = datetime.datetime.now()
        order_input['orderid'] = order_id
        order_input['freight'] = 0 if order_input['freight'] == "" else order_input['freight']

        dao.insert('orders', order_input)

        # adiciona os itens
        items = body['items']
        for item in items:
            item_input = item
            item_input['orderid'] = order_id
            dao.insert('order_details', item_input)
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get("/relatorios/pedido/<int:order_id>")
def get_relatorio_detalhes_pedido(order_id):
    try:
        with Session(engine) as session:
            resultado = dao_orm.relatorio_detalhes_pedido(session, order_id)
            return jsonify([
                {
                    "order_id": r.order_id,
                    "order_date": r.order_date,
                    "cliente": r.cliente,
                    "vendedor": r.vendedor,
                    "produto": r.product_name,
                    "quantidade": r.quantity,
                    "preco_unitario": float(r.unit_price)
                }
                for r in resultado
            ])
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get("/relatorios/ranking")
def get_relatorio_ranking():
    try:
        data_inicio = request.args.get("inicio")
        data_fim = request.args.get("fim")

        if not data_inicio or not data_fim:
            abort(400, "Parâmetros 'inicio' e 'fim' são obrigatórios.")

        data_inicio = datetime.strptime(data_inicio, "%Y-%m-%d").date()
        data_fim = datetime.strptime(data_fim, "%Y-%m-%d").date()

        with Session(engine) as session:
            resultado = dao_orm.relatorio_ranking_funcionarios(session, data_inicio, data_fim)
            return jsonify([
                {
                    "funcionario": r.funcionario,
                    "total_pedidos": r.total_pedidos,
                    "total_vendido": float(r.total_vendido)
                }
                for r in resultado
            ])
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)