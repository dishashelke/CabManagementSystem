insert into CabMaster values('MH-12 AB7890','Indica V2',0,'2010-10-10','2011-02-22','');
insert into CabMaster values('MH-12 AB2311','Indica V2',0,'2009-04-18','2010-04-19','');
insert into CabMaster values('MH-12 AB6575','Indica V2',0,'2009-10-05','2010-10-06','');
insert into CabMaster values('MH-12 AB6576','Indica V2',0,'2010-04-05','2010-05-06','');
insert into CabMaster values('MH-12 AB6545','Indica V2',0,'2010-04-05','2010-05-06','');

insert into RouteMaster values('r100','University','Katraj','00:45:00',16);
insert into RouteMaster values('r101','Katraj','University','00:30:00',16);
insert into RouteMaster values('r102','University','Hadapsar','00:55:00',27);

insert into CabRoute values('MH-12 AB6575','r100');
insert into CabRoute values('MH-12 AB7890','r101');
insert into CabRoute values('MH-12 AB2311','r101');


insert into StopMaster values('s100','Shivaji Nagar','12:12:12');
insert into StopMaster values('s101','Swargate','13:13:13');
insert into StopMaster values('s102','ABC','11:11:11');

insert into RouteStop values('r100','s100');
insert into RouteStop values('r100','s101');
insert into RouteStop values('r101','s101');

insert into DriverMaster values('d100','abc','ABC Pune',9823456790,'M','2010-10-11','OK','abc');
insert into DriverMaster values('d101','abcd','ABC Pune',9823456330,'E','2010-10-11','OK','abcd');
insert into DriverMaster values('d102','xyz','ABC Pune',9823456330,'E','2010-10-11','OK','xyz');

insert into DriverLog values(current_date,'d101','10:10:00','17:00:00','r100');
insert into DriverLog values(current_date,'d100','10:10:00','17:00:00','r101');

insert into EmployeeMaster values('e100','Disha Shelke','Sahakar Nagar',9877578865,'disha@yahoo.com','M','F','e100');
insert into EmployeeMaster values('e101','Sidharam Teli','Hadapsar',9734568625,'sidha@yahoo.com','M','M','e101');

insert into TempEmployee values('e101','Sidharam Teli','Hadapsar',9734568625,'sidha@yahoo.com','M','M','e101');

insert into EmployeeStop values('e100','s100','s100');
insert into EmployeeStop values('e101','s101','s101');

insert into Execution values('mh12 ab 3322','r100','d100','e100','','admin','2010-12-10 11:11:11','Fine',0);
insert into Execution values('MH-12 AB7890','r101','d100','e101','','admin','2010-12-11 12:12:12','Fine',0);
insert into Execution values('MH-12 AB2311','r101','d101','e100','','admin','2010-12-10 11:11:11','Fine',0);
insert into Execution values('MH-12 AB7890','r100','d101','e100','','admin','2010-12-11 12:12:12','Fine',0);


insert into Exception values(101,'Desc','2010-12-11 09:30:00','sss','loc','00:11:00','MH-12 AB6575',0);
insert into Exception values(103,'Desc1','2010-12-10 09:30:00','sss','loc','00:06:00','MH-12 AB6575',0);
insert into Exception values(102,'Desc2','2010-12-11 09:30:00','sss','loc','00:15:00','MH-12 AB6575',0);
insert into Exception values(104,'Desc3','2010-12-10 09:30:00','sss','loc','00:15:00','MH-12 AB6575',0);

insert into CurrentCabProgress values(current_timestamp,'mh12 ab 3322','abc','r101','s101',10000,0,0);


insert into Maintainance values('m101','Accident','2010-08-23','2010-09-1','Denting & Painting','MH-12 AB2311');
insert into Maintainance values('m102','Accident','2010-12-11','2010-12-20','Denting & Painting','MH-12 AB7890');

//guardmaster

insert into Breakdown values('MH-12 AB9445','d100','MH-12 AB9345','d101','2010:12:12 02:33:22',2);
insert into Breakdown values('MH-12 AB9145','d102','MH-12 AB9245','d101','2010:12:13 22:33:22',1);
insert into Breakdown values('MH-12 AB9145','d102','MH-12 AB9245','d101','2009:12:13 22:33:22',3);
//feedback
//alert
//admin
