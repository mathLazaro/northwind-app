ALTER TABLE northwind.orders
ADD CONSTRAINT customer_fk
FOREIGN KEY (customerid)
REFERENCES northwind.customers(customerid);

ALTER TABLE northwind.orders
ADD CONSTRAINT employee_fk
FOREIGN KEY (employeeid)
REFERENCES northwind.employees(employeeid);