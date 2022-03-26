--Create people

insert into customer(first_name, last_name)
			values('Nathan', 'Perrine'), 
				  ('Andy', 'Green'), 
				  ('Melvin', 'Shifferbottom')
				  
select * from customer

insert into salesperson(first_name, last_name)
				values('Alphen', 'Banks'), 
					  ('Sherika', 'Lamontte'),
					  ('Calvin', 'Carmicall')
					  
select * from salesperson

insert into mechanic(first_name, last_name) 
				values('Joel', 'Cook'),
					  ('Brian', 'Waterhouse'),
					  ('Nelson', 'Firbanks')
					  
select * from mechanic

----------
--Car Info
----------
insert into car_info(year_, make, model, color, price) 
			  values('2022', 'Honda', 'Civic', 'Blue', 15000.00),
			  		('2008', 'Chevy', 'Lumina', 'Blue', 200.00),
			  		('2021', 'Ford', 'F150', 'Red', 13000.00)
			  		
select * from car_info

insert into car_serial(car_id)
				values(1), (1), (2), (2), (3), (3)
				
select * from car_serial

select cs.car_serial_number as vin, ci.make, ci.model
from car_serial cs
join car_info ci
on cs.car_id = ci.car_id
where cs.car_serial_number = 1

--Sales Invoice 
insert into sales_invoice(sales_person_id, customer_id, car_serial_number)
				   values(1, 1, 3),
				   		 (1, 2, 2), 
				   		 (2, 3, 5);
				   		
select * from sales_invoice

select concat(sp.last_name, ', ', sp.first_name) as sales, concat(c.last_name, ', ', c.first_name) as customer, c.customer_id, cs.car_id
from sales_invoice si
join salesperson sp
on si.sales_person_id = sp.sales_person_id 
join customer c 
on si.customer_id = c.customer_id
join car_serial cs 
on si.car_serial_number = cs.car_serial_number 
join car_info ci
on ci.car_id = cs.car_id
where c.customer_id = 1


--service 
insert into service(service_name, price)
			values('oil change', 20.00),
				  ('tire rotation', 50.00),
				  ('maintenance', 75.00),
				  ('diagnostics', 15.99)
				  
insert into part(part_name, price)
			values('tire', 399.99),
				  ('filter', 10.00),
				  ('johnson rod', 699.99),
				  ('spark plug', 15.99)
				
insert into service_invoice(customer_id, car_serial_number)
					values(1, 2),
						  (3, 3)
						  
insert into service_order(service_invoice_id, part_id, service_id)
					values(1, 2, null),
						  (2, 3, 1),
						  (2, 4, null)
						  
select * from service_order

insert into service_mechanic(service_invoice_id, mechanic_id)
					  values(1, 1),
					        (1, 3), 
					        (2, 2)
					        
insert into service_history(service_invoice_id)
					 values(1), (2)
					 
select * from customer

select* from salesperson

select * from sales_invoice

select * from car_serial

select * from car_info

select * from mechanic

select * from service_mechanic

select * from service_invoice

select * from service_history

select * from service_order

select * from service

select * from part