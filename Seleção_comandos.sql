select customerName from customers;

select * from customers where country = 'USA' and (city = 'Las Vegas' or city = 'San Francisco');

select * from customers where customerName like "%Corporate%";  #procura parte da palavara Like "%texto%"

select * from customers where country = "France" and creditLimit > 5000;

select * from customers where customerName like "A%"; # %só o que começa com A se o % estiver antes do A é customer name que termina com A`banco`

select * from customers as c
join employees as e on c.salesRepEmployeeNumber = e.employeeNumber
join offices as o on o.officeCode = e.officeCode
join payments as p on p.customerNumber = c.customerNumber
join orders as od on od.customerNumber = c.customerNumber
join orderdetails as odt on odt.orderNumber = od.orderNumber
join products as pr on pr.productCode = odt.productCode
join productlines as pl on pl.productLine = pr.productLine;

select * from orders as o
join orderdetails as od on o.orderNumber = od.orderNumber
join products as p on p.productCode = od.productCode
where p.productCode = 'S12_3891';

select count(*) from customers;
select count(*) from offices;

select country from customers group by country
having country like 'A%' #having usa somente quando usar group by caso contrário usa where que é mais usual
order by country asc; # ordena asc crescente e desc ordena inverso

select c.customerName, count(*) as total #contar quantas ordem por cliente
from customers c 
join orders o on o.customerNumber = c.customerNumber
group by c.customerName
order by total desc;

select c.customerName, count(*) as total #contar quantas ordem por cliente
from customers c 
join orders o on o.customerNumber = c.customerNumber
group by c.customerName having total>1
order by customerName asc;