from sqlalchemy import create_engine, Column, Integer, String, Date, Float, ForeignKey, func
from sqlalchemy.orm import sessionmaker, relationship
from sqlalchemy.ext.declarative import declarative_base

engine = create_engine('postgresql://postgres:postgres@localhost/northwind') 
Base = declarative_base()
Session = sessionmaker(bind=engine)

class Category(Base):
    __tablename__ = 'categories'
    categoryid = Column(Integer, primary_key=True)
    categoryname = Column(String)
    description = Column(String)
    products = relationship("Product", backref="category")

class Customer(Base):
    __tablename__ = 'customers'
    customerid = Column(String, primary_key=True)
    companyname = Column(String)
    contactname = Column(String)
    contacttitle = Column(String)
    address = Column(String)
    city = Column(String)
    region = Column(String)
    postalcode = Column(String)
    country = Column(String)
    phone = Column(String)
    fax = Column(String)
    orders = relationship("Order", backref="customer")

class Employee(Base):
    __tablename__ = 'employees'
    employeeid = Column(Integer, primary_key=True)
    lastname = Column(String)
    firstname = Column(String)
    title = Column(String)
    titleofcourtesy = Column(String)
    birthdate = Column(Date)
    hiredate = Column(Date)
    address = Column(String)
    city = Column(String)
    region = Column(String)
    postalcode = Column(String)
    country = Column(String)
    homephone = Column(String)
    extension = Column(String)
    reportsto = Column(Integer, ForeignKey('employees.employeeid'))
    notes = Column(String)
    orders = relationship("Order", backref="employee")

class Order(Base):
    __tablename__ = 'orders'
    orderid = Column(Integer, primary_key=True, autoincrement=True)
    customerid = Column(String, ForeignKey('customers.customerid'))
    employeeid = Column(Integer, ForeignKey('employees.employeeid'))
    orderdate = Column(Date)
    requireddate = Column(Date)
    shippeddate = Column(Date)
    freight = Float
    shipname = Column(String)
    shipaddress = Column(String)
    shipcity = Column(String)
    shipregion = Column(String)
    shippostalcode = Column(String)
    shipcountry = Column(String)
    shipperid = Column(Integer, ForeignKey('shippers.shipperid'))
    order_details = relationship("OrderDetail", backref="order")

class OrderDetail(Base):
    __tablename__ = 'order_details'
    orderid = Column(Integer, ForeignKey('orders.orderid'), primary_key=True)
    productid = Column(Integer, ForeignKey('products.productid'), primary_key=True)
    unitprice = Column(Float)
    quantity = Column(Integer)
    discount = Float
    product = relationship("Product", backref="order_details")

class Product(Base):
    __tablename__ = 'products'
    productid = Column(Integer, primary_key=True)
    productname = Column(String)
    supplierid = Column(Integer, ForeignKey('suppliers.supplierid'))
    categoryid = Column(Integer, ForeignKey('categories.categoryid'))
    quantityperunit = Column(String)
    unitprice = Float
    unitsinstock = Column(Integer)
    unitsonorder = Column(Integer)
    reorderlevel = Column(Integer)
    discontinued = Column(Integer)

class Shipper(Base):
    __tablename__ = 'shippers'
    shipperid = Column(Integer, primary_key=True)
    companyname = Column(String)
    phone = Column(String)
    orders = relationship("Order", backref="shipper")

class Supplier(Base):
    __tablename__ = 'suppliers'
    supplierid = Column(Integer, primary_key=True)
    companyname = Column(String)
    contactname = Column(String)
    contacttitle = Column(String)
    address = Column(String)
    city = Column(String)
    region = Column(String)
    postalcode = Column(String)
    country = Column(String)
    phone = Column(String)
    fax = Column(String)
    homepage = Column(String)
    products = relationship("Product", backref="supplier")

def insert_order(customer_id, employee_id, order_date, required_date, ship_via, freight, ship_name, ship_address,
                 ship_city, ship_region, ship_postal_code, ship_country, order_details):
    session = Session()
    try:
        new_order = Order(
            customerid=customer_id,
            employeeid=employee_id,
            orderdate=order_date,
            requireddate=required_date,
            ship_via=ship_via,
            freight=freight,
            shipname=ship_name,
            shipaddress=ship_address,
            shipcity=ship_city,
            shipregion=ship_region,
            shippostalcode=ship_postal_code,
            shipcountry=ship_country
        )
        session.add(new_order)
        session.commit()

        for detail in order_details:
            new_order_detail = OrderDetail(
                orderid=new_order.orderid,
                productid=detail['productid'],
                unitprice=detail['unitprice'],
                quantity=detail['quantity'],
                discount=detail['discount']
            )
            session.add(new_order_detail)

        session.commit()
        return new_order.orderid
    except Exception as e:
        session.rollback()
        raise e
    finally:
        session.close()

def get_order_details(order_id):
    session = Session()
    try:
        order = session.query(Order).filter_by(orderid=order_id).first()
        if order:
            return {
                'order_id': order.orderid,
                'order_date': order.orderdate,
                'customer_name': order.customer.companyname,
                'employee_name': order.employee.firstname + " " + order.employee.lastname,
                'order_details': [{
                    'product_name': od.product.productname,
                    'quantity': od.quantity,
                    'unit_price': od.unitprice
                } for od in order.order_details]
            }
        return None
    except Exception as e:
        raise e
    finally:
        session.close()

def get_employee_ranking(start_date, end_date):
    session = Session()
    try:
        ranking = session.query(
            Employee.firstname + " " + Employee.lastname,
            func.count(Order.orderid),
            func.sum(OrderDetail.quantity * OrderDetail.unitprice)
        ).join(Order).join(OrderDetail).filter(
            Order.orderdate.between(start_date, end_date)
        ).group_by(Employee.employeeid).order_by(func.sum(OrderDetail.quantity * OrderDetail.unitprice).desc()).all()

        return [{'employee_name': row[0], 'total_orders': row[1], 'total_sales': row[2]} for row in ranking]
    except Exception as e:
        raise e
    finally:
        session.close()