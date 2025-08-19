create database furama;
use furama;

create table rental_type(
   id_rental_type int auto_increment,
   name_rental_type varchar(20) not null,
   primary key (id_rental_type)
);

create table service(
   id_service int auto_increment,
   service_code varchar(20)not null ,
   service_name varchar(20) not null,
   usable_area decimal (10,2) not null,
   rental_cost decimal(12,2),
   max_people int,
   id_rental_type int,
   constraint s_usable_area check(usable_area >0),
   constraint s_rental_cost check(rental_cost >0),
   constraint s_max_people check(max_people >0),
   primary key(id_service),
   foreign key (id_rental_type) references rental_type(id_rental_type) 
   on update restrict on delete restrict
);

create table villas(
  id_service int primary key,
  room_standard varchar(30) not null,
  other_description varchar(255),
  pool_area decimal (12,2) not null,
  floors int not null,
  constraint vl_pool_area check (pool_area >0),
  constraint number_floors check (floors > 0),
  constraint fk_villas_service
  foreign key (id_service) references service(id_service)
  on update cascade on delete cascade
);

create table house(
   id_service int primary key,
   room_standard varchar(30) not null,
   other_description varchar(255),
   floors int not null,
   constraint number_floors check(floors > 0),
   constraint fk_house_service
   foreign key (id_service) references service(id_service)
   on update cascade on delete cascade
);

create table room(
   id_service int primary key,
   free_service varchar(255),
   constraint fk_room_service
   foreign key (id_service) references service(id_service)
   on update cascade on delete cascade
);
create table attached_services(
  id_attached_services int auto_increment,
  service_name varchar(100),
  unit varchar(20),
  price decimal(12,2),
  constraint at_price check (price > 0)
);

create table education_levels(
  id_education int auto_increment,
  name_level varchar (50) not null,
  unique key education_name_level (name_level),
  primary key (id_education)
);
create table positions(
  id_positions int auto_increment,
  name_positions varchar (50) not null,
  unique p_name_positions (name_positions),
  primary key (id_positions)
);

create table departments(
  id_departments int auto_increment,
  name_departments varchar(50) not null,
  unique d_name_departments (name_departments),
  primary key(id_departments)
);

create table employee(
 id_employee int auto_increment,
 employee_name varchar(100) not null,
 dob date not null,
 cccd int (12) not null,
 phone_number int (11) not null,
 email varchar(100) not null,
 salary decimal (12,2),
 id_education int,
 id_positions int,
 id_departments int,
 constraint e_salary check (salary > 0),
 foreign key (id_education) references education_levels (id_education),
 foreign key (id_positions) references positions (id_positions),
 foreign key (id_departments) references departments (id_departments)
);

create table customer_types(
 id_customer_types int auto_increment,
 name_customer_types varchar(50) not null,
 primary key (id_customer_types) ,
 unique c_name_customer (name_customer_types)
);
create table customers(
  id_customers int auto_increment,
  name_customers varchar (50) not null,
  dob date,
  gender enum('Male','Female','Other'),
  id_card_number varchar(20),
  phone varchar (20),
  email varchar(50),
  address varchar(200),
  id_customer_types int,
  unique uk_id_card_number(id_card_number),
  unique uk_phone(phone),
  unique uk_email(email),
  constraint fk_id_customer_types
  foreign key (id_customer_types) references customer_types(id_customer_types)
  
);

create table bookings(
 id_bookings int auto_increment,
 id_customers int not null,
 id_service int,
 checkin_date date not null,
 checkout_date date not null,
 status enum ('Pending','Confirm','Checkin','Checkout','Cancel') default('Pending'),
 foreign key (id_customers) references customers(id_customers),
 foreign key (id_service) references service(id_service)
 
);
create table contracts(
  id_contracts int auto_increment,
  

);
