--Get car info from car_serial_number
create or replace function car_serial_info(vinnum int)
returns table(
	car_serial_number int, 
	year_ varchar, 
	make varchar, 
	model varchar,
	color varchar, 
	price numeric
)
language plpgsql
as $$ 
begin 
	return query 
	select cs.car_serial_number as vin, ci.year_, ci.make, ci.model, ci.color, ci.price
	from car_serial cs
	join car_info ci
	on cs.car_id = ci.car_id
	where cs.car_serial_number = vinnum;
end
$$

select * from car_serial_info(1)
select * from car_serial_info(2)
select * from car_serial_info(3)


--Add car types 
create or replace procedure add_car_info(
	year_ VARCHAR(4),
	make VARCHAR(50),
	model VARCHAR(50),
	color VARCHAR(50),
	price numeric(7,2)
)
language plpgsql 
as $$ 
begin 
	insert into car_info(year_, make, model, color, price)
					values(year_, make, model, color, price);
end
$$

call add_car_info('2019', 'Hyundai', 'Sonata', 'Red', 7600.00)
call add_car_info('2015', 'Honda', 'TRX300X', 'Gray', 7600.00)

select * from car_info

--Add Sales People 
create or replace procedure add_salesperson(
	first_name VARCHAR(50),
	last_name VARCHAR(50)
)
language plpgsql 
as $$ 
begin 
	insert into salesperson(first_name, last_name) 
					 values(first_name, last_name);
end
$$

call add_salesperson('Jimothy', 'Bimothy')
call add_salesperson('Robert', 'Bobbert')

select * from salesperson