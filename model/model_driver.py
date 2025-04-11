import datetime
import decimal
from model_driver import Orders


class Categories:
    categoryid: int
    categoryname: str
    description: str


class Customers:
    customerid: str
    companyname: str
    contactname: str
    contacttitle: str
    address: str
    city: str
    region: str
    postalcode: str
    country: str
    phone: str
    fax: str
    orders: Orders


class OrderDetails:
    orderid: int
    productid: int
    unitprice: decimal.Decimal
    quantity: int
    discount: decimal.Decimal


class Products:
    productid: int
    supplierid: int
    categoryid: int
    productname: str
    quantityperunit: str
    unitprice: decimal.Decimal
    unitsinstock: int
    unitsonorder: int
    reorderlevel: int
    discontinued: str


class Shippers:
    shipperid: int
    phone: str


class Suppliers:
    supplierid: int
    companyname: str
    contactname: str
    contacttitle: str
    address: str
    city: str
    region: str
    postalcode: str
    country: str
    phone: str
    fax: str
    homepage: str


class Employees:
    employeeid: int
    lastname: str
    firstname: str
    title: str
    titleofcourtesy: str
    birthdate: datetime.datetime
    hiredate: datetime.datetime
    address: str
    city: str
    region: str
    postalcode: str
    country: str
    homephone: str
    extension: str
    reportsto: int
    notes: str
    orders: list[Orders]

class Orders:
    orderid: int
    customerid: str
    employeeid: int
    orderdate: datetime.datetime
    requireddate: datetime.datetime
    shippeddate: datetime.datetime
    freight: decimal.Decimal
    shipname: str
    shipaddress: str
    shipcity: str
    shipregion: str
    shippostalcode: str
    shipcountry: str
    shipperid: int
    customers: Customers
    employees: Employees
