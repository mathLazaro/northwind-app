from typing import List, Optional
from sqlalchemy.orm import Session
from sqlalchemy import func, select
from model.model_orm import Orders, OrderDetails, Categories, Employees, Products, Customers, Shippers
import datetime
import decimal


# inserir novo pedido
def insert_order(
    session: Session,
    customer_id: str,
    employee_id: int,
    order_date: datetime.datetime,
    required_date: datetime.datetime,
    shipper_id: int,
    freight: decimal.Decimal,
    ship_name: str,
    ship_address: str,
    ship_city: str,
    ship_region: str,
    ship_postal_code: str,
    ship_country: str,
    items: List[dict]
) -> int:
    try:
        new_order = Orders(
            orderdate=order_date,
            requireddate=required_date,
            shipperid=shipper_id,
            freight=freight,
            shipname=ship_name,
            shipaddress=ship_address,
            shipcity=ship_city,
            shipregion=ship_region,
            shippostalcode=ship_postal_code,
            shipcountry=ship_country
        )
        new_order.orderid = session.execute(
            select(func.max(Orders.orderid))
        ).scalar_one() + 1

        new_order.customers = get_customer_by_id(session, customer_id)
        new_order.employees = get_employee_by_id(session, employee_id)

        session.add(new_order)
        session.flush()

        for item in items:
            detail = OrderDetails(
                orderid=new_order.orderid,
                productid=item['productid'],
                unitprice=item['unitprice'],
                quantity=item['quantity'],
                discount=item['discount']
            )
            session.add(detail)

        session.commit()
        return new_order.orderid

    except Exception as e:
        session.rollback()
        raise e

# busca sobre pedidos
def get_product_by_id(session: Session, product_id: int) -> Optional[Products]:
    product = session.query(Products).filter_by(productid=product_id).first()
    if not product:
        return None
    return product

# busca detalhes de um único produto dentro de um pedido específico
def get_order_details_by_id(session: Session, order_id: int, product_id: int) -> Optional[OrderDetails]:
    detail = session.query(OrderDetails).filter_by(
        orderid=order_id, productid=product_id).first()
    if not detail:
        return None
    return detail

# busca informações de uma categoria de produtos pelo id
def get_category_by_id(session: Session, category_id: int) -> Optional[Categories]:
    category = session.query(Categories).filter_by(
        categoryid=category_id).first()
    if not category:
        return None
    return category


def get_customer_by_id(session: Session, customer_id: str) -> Optional[Categories]:
    customer = session.query(Customers).filter_by(
        customerid=customer_id).first()
    if not customer:
        return None
    return customer


def get_employee_by_id(session: Session, employee_id: int) -> Optional[Categories]:
    employee = session.query(Employees).filter_by(
        employeeid=employee_id).first()
    if not employee:
        return None
    return employee


def get_shipper_by_id(session: Session, shipper_id: int) -> Optional[Categories]:
    shipper = session.query(Shippers).filter_by(shipperid=shipper_id).first()
    if not shipper:
        return None
    return shipper

# relatório de todos os itens de um pedido
def get_order_details(session: Session, order_id: int) -> Optional[List[Categories]]:
    order = session.query(Orders).filter_by(orderid=order_id).first()

    if not order:
        return None

    return order


# relatório de ranking de funcionários
def get_employee_ranking(session: Session, start_date: datetime.datetime, end_date: datetime.datetime) -> List[Employees]:
    result = session.query(
        Employees.firstname,
        Employees.lastname,
        func.count(Orders.orderid).label('total_orders'),
        func.sum(OrderDetails.quantity *
                 OrderDetails.unitprice).label('total_sales')
    ).join(Orders, Employees.employeeid == Orders.employeeid)\
     .join(OrderDetails, Orders.orderid == OrderDetails.orderid)\
     .filter(Orders.orderdate.between(start_date, end_date))\
     .group_by(Employees.employeeid)\
     .order_by(func.sum(OrderDetails.quantity * OrderDetails.unitprice).desc())\
     .all()

    return result
