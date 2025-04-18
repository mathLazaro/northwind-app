from sqlalchemy import func
from model.model_orm import Orders, Customers, Employees, OrderDetails, Products

def relatorio_detalhes_pedido(session, order_id):
    return session.query(
        Orders.order_id,
        Orders.order_date,
        Customers.company_name.label("cliente"),
        (Employees.first_name + ' ' + Employees.last_name).label("vendedor"),
        Products.product_name,
        OrderDetails.quantity,
        OrderDetails.unit_price
    ).join(Customers, Orders.customer_id == Customers.customer_id
    ).join(Employees, Orders.employee_id == Employees.employee_id
    ).join(OrderDetails, Orders.order_id == OrderDetails.order_id
    ).join(Products, OrderDetails.product_id == Products.product_id
    ).filter(Orders.order_id == order_id).all()

def relatorio_ranking_funcionarios(session, data_inicio, data_fim):
    return session.query(
        (Employees.first_name + ' ' + Employees.last_name).label("funcionario"),
        func.count(Orders.order_id.distinct()).label("total_pedidos"),
        func.sum(OrderDetails.quantity * OrderDetails.unit_price).label("total_vendido")
    ).join(Orders, Employees.employee_id == Orders.employee_id
    ).join(OrderDetails, Orders.order_id == OrderDetails.order_id
    ).filter(Orders.order_date.between(data_inicio, data_fim)
    ).group_by("funcionario"
    ).order_by(func.sum(OrderDetails.quantity * OrderDetails.unit_price).desc()
    ).all()