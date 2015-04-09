create table CabMaster (
cab_id varchar(20) primary key,
description varchar(100),
available_status boolean not null,
purchase_date date not null,
servicing_due_date date,
servicing_remark varchar(100)
);


create table RouteMaster(
route_id varchar(10) primary key,
source varchar(20) not null,
destination varchar(20) not null,
required_time time not null,
distance int not null
);


create table CabRoute(
cab_id varchar(20) references CabMaster(cab_id) on delete cascade,
route_id varchar(10) references RouteMaster(route_id) on delete cascade
);

create table StopMaster(
stop_id varchar(10) primary key,
stop_name varchar(20) not null,
reqd_time time not null
);


create table RouteStop(
route_id varchar(10) references RouteMaster(route_id) on delete cascade,
stop_id varchar(10) references StopMaster(stop_id) on delete cascade
);



create table DriverMaster(
driver_license_no varchar(20) primary key,
driver_name varchar(50) not null,
driver_address varchar(100) not null,
driver_contact_no double not null,
driver_shift char(1) not null,
driver_joining_date date not null,
legal_info varchar(300),
driver_password varchar(20) not null
);

CREATE TABLE  DriverLog (
  todays_date date NOT NULL,
  driver_license_no varchar(20) REFERENCES DriverMaster(Driver_license_no) on delete cascade,
  driver_intime time NOT NULL,
  driver_outtime time NOT NULL,
  route_id varchar(10) REFERENCES RouteMaster(Route_no) on delete cascade
);



create table EmployeeMaster(
emp_id varchar(10) primary key,
emp_name varchar(30),
emp_address varchar(100),
emp_contact_no double not null,
emp_email varchar(30),
emp_shift char(1) not null,
emp_gender char(1) not null,
emp_password varchar(20) not null
);

create table TempEmployee(
emp_id varchar(10) primary key,
emp_name varchar(30),
emp_address varchar(100),
emp_contact_no double not null,
emp_email varchar(30),
emp_shift char(1) not null,
emp_gender char(1) not null,
emp_password varchar(20) not null
);

create table EmployeeStop(
emp_id varchar(10) references EmployeeMaster(emp_id) on delete cascade, 
pickup_stop_id varchar(10) references StopMaster(stop_id) on delete cascade,
dropoff_stop_id varchar(10) references StopMaster(stop_id) on delete cascade
);

create table Exception(
exception_id int primary key,
description varchar(100) not null,
exception_time timestamp not null,
action_taken varchar(100),
location varchar(30),
delayed_by time,
cab_id varchar(20) references CabMaster(cab_id) on delete cascade,
exception_status bool
);


create table Maintainance(
maintainance_id varchar(10) primary key,
cause varchar(100),
in_date date not null,
out_date date,
description varchar(100) not null,
cab_id varchar(20)references CabMaster(cab_id) on delete cascade
);


create table GuardMaster(
guard_id varchar(10) primary key,
guard_name varchar(20)not null,
guard_address varchar(20)not null,
guard_contact_no double not null,
guard_shift char(1) not null
);


create table Execution(
cab_id varchar(20)references CabMaster(cab_id) on delete cascade,
route_id varchar(10) references RouteMaster(route_id) on delete cascade,
driver_license_no varchar(10) references DriverMaster(driver_license_no) on delete cascade,
emp_id varchar(10) references EmployeeMaster(employee_id) on delete cascade,
guard_id varchar(10) references GuardMaster(guard_id) on delete cascade,
admin_id varchar(10) references AdminMaster(admin_id) on delete cascade,
alloc_time timestamp not null,
remark varchar(20),
execution_status boolean not null
);

create table CurrentCabProgress(
time_current timestamp not null,
cab_id varchar(20)references CabMaster(cab_id) on delete cascade,
driver_license_no varchar(10) references DriverMaster(driver_license_no) on delete cascade,
route_id varchar(10) references RouteMaster(route_id) on delete cascade,
stop_id varchar(10) references StopMaster(stop_id) on delete cascade,
running double not null,
emp_count int,
breakdown_status boolean not null
);


create table Feedback(
feedback_id integer primary key,
feedback_from varchar(20),
feedback_about varchar(20),
description varchar(100) not null,
action_taken varchar(100),
location varchar(40),
feedback_time timestamp not null
);


create table Alert(
alert_id varchar(10) primary key,
alert_time timestamp not null,
type_id varchar(10) not null,
status boolean not null
);


create table AdminMaster(
admin_id varchar(10) primary key,
admin_password varchar(20) not null
);

create table Breakdown(
old_cab_id varchar(20)references CabMaster(cab_id) on delete cascade,
old_driver_license_no varchar(10) references DriverMaster(driver_license_no) on delete cascade,
new_cab_id varchar(20)references CabMaster(cab_id) on delete cascade,
new_driver_license_no varchar(10) references DriverMaster(driver_license_no) on delete cascade,
breakdown_time timestamp not null,
emp_count int
);

