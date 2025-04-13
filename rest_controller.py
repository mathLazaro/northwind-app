from datetime import datetime
from flask import request, abort, jsonify

from app import app
from dao.dao_driver import DaoDriver

products_dao = DaoDriver('products', 'productid')
customers_dao = DaoDriver('customers', 'customerid')
employees_dao = DaoDriver('employees', 'employeeid')
shippers_dao = DaoDriver('shippers', 'shipperid')
categories_dao = DaoDriver('categories', 'categoryid')
orders_dao = DaoDriver('orders', 'orderid')
order_details_dao = DaoDriver('order_details', None)


@app.get('/customers')
def get_all_customers():
    try:
        return customers_dao.select_all()
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/employees')
def get_all_employees():
    try:
        return employees_dao.select_all()
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/shippers')
def get_all_shippers():
    try:
        return shippers_dao.select_all()
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/products')
def get_all_products():
    try:
        return products_dao.select_all()
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/products/<int:product_id>')
def get_product_by_id(product_id):
    dao_selector = request.args.get('dao')

    try:
        return _get_by_id(products_dao, product_id, dao_selector)
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.get('/categories/<int:category_id>')
def get_category_by_id(category_id):
    dao_selector = request.args.get('dao')

    try:
        return _get_by_id(categories_dao, category_id, dao_selector)
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
        return order_details_dao.select_by_multiple_ids({
            'orderid': order_id,
            'productid': product_id
        })
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


@app.post('/orders')
def add_new_order():
    try:
        body:dict = request.get_json()
        dao_selector = request.args.get('dao')

        # adiciona order no banco
        order_id = orders_dao.generate_id()
        fields = ['customerid', 'employeeid', 'requireddate', 'shippeddate', 'freight', 'shipname',
                  'shipaddress', 'shipcity', 'shipregion', 'shippostalcode', 'shipcountry', 'shipperid']
        order_input = {key: body.get(key) for key in fields}
        order_input['orderdate'] = datetime.now()
        order_input['orderid'] = order_id
        orders_dao.insert(order_input)

        # adiciona os itens
        items = body['items']
        for item in items:
            item_input = item
            item_input['orderid'] = order_id
            order_details_dao.insert(item_input)

        return "", 201
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)


# controla com qual tipo de dao irá usar e de qual tabela
def _get_by_id(dao: DaoDriver, id, dao_selector):
    try:
        id = int(id)
        data = []
        if id < 0:
            return data
        if dao_selector == 'dao-driver' or dao_selector is None:
            response = dao.select_by_id(id)
            data = response if response is not None else data
        elif dao_selector == 'dao-driver-injection':
            pass
        else:  # orm
            pass
        return data
    except Exception as e:
        print(f"Erro: {e}")
        abort(400)
