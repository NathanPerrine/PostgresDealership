--People 
--Mechanic Table 
create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

--Salesperson table 
create table salesperson(
	sales_person_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

--Customer Table 
create table customer(
	customer_id SERIAL primary key, 
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

----------------sales side 
--Car info table 
create table car_info(
	car_id serial primary key,
	year_ VARCHAR(4),
	make VARCHAR(50),
	model VARCHAR(50),
	color VARCHAR(50),
	price numeric(7,2)
); 

--Car serial 
create table car_serial(
	car_serial_number serial primary key,
	car_id int not null,
	foreign key(car_id) references car_info(car_id)
);

--Sales Invoice 
create table sales_invoice(
	invoice_id serial primary key, 
	sales_person_id int not null, 
	foreign key(sales_person_id) references salesperson(sales_person_id),
	customer_id int not null,
	foreign key(customer_id) references customer(customer_id),
	car_serial_number int not null, 
	foreign key(car_serial_number) references car_serial(car_serial_number)
);


----------------mechanic side 
--Service Invoice 
create table service_invoice(
	service_invoice_id serial primary key,
	customer_id INT, 
	foreign key(customer_id) references customer(customer_id),
	car_serial_number INT, 
	foreign key(car_serial_number) references car_serial(car_serial_number)
);

--Service Mechanic 
create table service_mechanic(
	service_mechanic_id serial primary key,
	service_invoice_id int not null, 
	foreign key(service_invoice_id) references service_invoice(service_invoice_id),
	mechanic_id int not null, 
	foreign key(mechanic_id) references mechanic(mechanic_id)
);

--Service History 
create table service_history(
	service_history_id serial primary key,
	service_invoice_id int not null, 
	foreign key(service_invoice_id) references service_invoice(service_invoice_id)
);

--Service Order
create table service_order(
	service_order_id serial primary key, 
	service_invoice_id int not null, 
	foreign key(service_invoice_id) references service_order(service_order_id), 
	part_id int, 
	foreign key(part_id) references part(part_id), 
	service_id int, 
	foreign key(service_id) references service(service_id)
);

--Part Table 
create table part(
	part_id SERIAL primary key, 
	part_name VARCHAR(50), 
	price numeric(6,2)
);

--Service Table 
create table service(
	service_id SERIAL primary key,	
	service_name VARCHAR(50),
	price numeric(6,2)
)

--Service Order Table 
create table service_order(
	service_order_id serial primary key, 
	
	part_id int, 
	foreign key(part_id) references part(part_id)
)