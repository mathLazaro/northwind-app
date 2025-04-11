from flask import request, jsonify

from app import app
from dao.dao_driver import select_all

@app.get('/customers')
def get_all_customers():
    return select_all('customers')

@app.get('/employees')
def get_all_employees():
    return select_all('employees')


@app.get('/shippers')
def get_all_shippers():
    return select_all('shippers')