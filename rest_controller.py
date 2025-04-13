from datetime import datetime
from flask import request, abort, jsonify

from app import app
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
            pass

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
            pass

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
            pass

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
            pass

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

        order_input['orderdate'] = datetime.now()
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
