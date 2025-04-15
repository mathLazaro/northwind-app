from typing import List, Optional
from sqlalchemy.orm import Session
from sqlalchemy import func
from model import Orders, OrderDetails, Categories, Employees, Products
import datetime
import decimal

#inserir novo pedido
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
            customerid=customer_id,
            employeeid=employee_id,
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
    
#busca sobre pedidos
def get_product_by_id(session: Session, product_id: int) -> Optional[dict]:
    product = session.query(Products).filter_by(productid=product_id).first()
    if not product:
        return None
    return {
        'productid': product.productid,
        'productname': product.productname,
        'unitprice': float(product.unitprice),
        'unitsinstock': product.unitsinstock
    }

#busca detalhes de um único produto dentro de um pedido específico
def get_order_details_by_id(session: Session, order_id: int, product_id: int) -> Optional[dict]:
    detail = session.query(OrderDetails).filter_by(orderid=order_id, productid=product_id).first()
    if not detail:
        return None
    return {
        'orderid': detail.orderid,
        'productid': detail.productid,
        'quantity': detail.quantity,
        'unitprice': float(detail.unitprice),
        'discount': float(detail.discount)
    }
    
#busca informações de uma categoria de produtos pelo id
def get_category_by_id(session: Session, category_id: int) -> Optional[dict]:
    category = session.query(Categories).filter_by(categoryid=category_id).first()
    if not category:
        return None
    return {
        'categoryid': category.categoryid,
        'categoryname': category.categoryname,
        'description': category.description
    }

#relatório de todos os itens de um pedido
def get_order_details(session: Session, order_id: int) -> Optional[dict]:
    order = session.query(Orders).filter_by(orderid=order_id).first()

    if not order:
        return None

    return {
        'order_id': order.orderid,
        'order_date': order.orderdate,
        'customer_name': order.customers.companyname if order.customers else None,
        'employee_name': f"{order.employees.firstname} {order.employees.lastname}" if order.employees else None,
        'items': [
            {
                'product_id': detail.productid,
                'quantity': detail.quantity,
                'unit_price': float(detail.unitprice),
                'discount': float(detail.discount)
            }
            for detail in session.query(OrderDetails).filter_by(orderid=order_id).all()
        ]
    }
    
#relatório de ranking de funcionários
def get_employee_ranking(session: Session, start_date: datetime.datetime, end_date: datetime.datetime) -> List[dict]:
    result = session.query(
        Employees.firstname,
        Employees.lastname,
        func.count(Orders.orderid).label('total_orders'),
        func.sum(OrderDetails.quantity * OrderDetails.unitprice).label('total_sales')
    ).join(Orders, Employees.employeeid == Orders.employeeid)\
     .join(OrderDetails, Orders.orderid == OrderDetails.orderid)\
     .filter(Orders.orderdate.between(start_date, end_date))\
     .group_by(Employees.employeeid)\
     .order_by(func.sum(OrderDetails.quantity * OrderDetails.unitprice).desc())\
     .all()

    return [
        {
            'employee_name': f"{row.firstname} {row.lastname}",
            'total_orders': row.total_orders,
            'total_sales': float(row.total_sales or 0)
        }
        for row in result
    ]