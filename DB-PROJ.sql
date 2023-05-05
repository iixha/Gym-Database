create schema GymDB_PRIJECT ; 

create table GymDB_PRIJECT.GymMember
( MemberShipNo int(10) not null ,
  gName varchar(30),
  phoneNumber int(10),
  IDNumber int(10) not null ,
  memberShipDuration date,
  dateOfBirth date ,
  Emile varchar(30),
  Address varchar(200),
constraint GymMember_PK primary key(MemberShipNo,IDNumber) ) ; 

create table GymDB_PRIJECT.EmployeeManagement
(eName varchar(30),
 employeeID int(10) NOT NULL,
 nationality varchar(200),
 ePosition varchar (200),
 dateOfContract date ,
 superEmployeeID int (100),
 constraint GymMember_PK primary key(employeeID),
 constraint EmployeeManagement_FK foreign key(superemployeeID) 
           references EmployeeManagement(employeeID) );
           
           
 
 create table GymDB_PRIJECT.trainer
(tName varchar(30),
 phoneNumber int (10),
 tEmployeeID int(10) NOT NULL ,
 salary decimal (7,2) check(salary between 3000 and 10000 ),
 IDtrainer int(10) ,
 Gu_mem_number int (10),
 Su_ID int (10) ,

constraint trainer_PK   primary key (tEmployeeID),
constraint trainer_FK   foreign key (Gu_mem_number) REFERENCES 
                        GymMember ( MemberShipNo)ON DELETE CASCADE );
                         
                        
create table  GymDB_PRIJECT.Gymclass
( AssimilativeCapacity varchar(30),
  HallNumber int (10),
  cTime   datetime ,
  duration varchar(10) ,
  cName varchar (20) not null ,
  Type_class varchar (100) check (Type_class in ('Aerobic','Aqua') ),
  Tr_EmployeeID int (10)   NOT NULL,
  GmMemberShipNo int (10)  NOT NULL,
constraint GymClassFK     foreign key (Tr_EmployeeID)  references trainer ( tEmployeeID )   ON DELETE CASCADE ,  
constraint GymClassFK1    foreign key (GmMemberShipNo) references gymmember (MemberShipNo ) ON DELETE CASCADE ,
constraint GymClassPK     primary key ( cName ,Tr_EmployeeID ,GmMemberShipNo   ) ) ;
 
 
  
  
 create table GymDB_PRIJECT.HasClass_Member (
 gMemberShipNo int (10) not null , 
 cName varchar(20) not null ,
 Tr_EmployeeID int (10) not null  , 
  constraint HasClass_MemberFK1 foreign key ( gMemberShipNo) references gymmember (MemberShipNo ) ON DELETE CASCADE,
  constraint HasClass_MemberFK2 foreign key  (cName) references GymClass ( cName) ON DELETE CASCADE  , 
  constraint HasClass_MemberFK3 foreign key  (Tr_EmployeeID ) references GymClass (Tr_EmployeeID) ON DELETE CASCADE  ,
  constraint HasClass_MemberPK  primary key ( gMemberShipNo , cName , Tr_EmployeeID ) )  ; 
 
  Create table GymDB_PRIJECT.MANAGE ( 
  gmembership_no int (10) not null ,
  eEmployee_id int (10) not null , 
  constraint MANAGE_PK  primary key ( gmembership_no , eEmployee_id ) , 
  constraint MANAGE_FK1 foreign key (  gmembership_no ) references gymmember ( MemberShipNo) ON DELETE CASCADE , 
  constraint MANAGE_FK2 foreign key (eEmployee_id)references employeemanagement (employeeID) ON DELETE CASCADE  );
  
  Create table GymDB_PRIJECT.ORGANIZE ( 
  eEmployee_id INT (10) NOT NULL, 
  Tr_EmployeeID INT (10) NOT NULL,
  cName varchar(20) not null ,
  gmembership_no int (10) not null , 
  constraint  ORGANIZE_PK primary key  (eEmployee_id  , cName ), 
 constraint  ORGANIZE_FK1 foreign key (eEmployee_id) references employeemanagement (employeeID) on delete cascade,
 constraint  ORGANIZE_FK2 foreign key (Tr_EmployeeID ) references GymClass (Tr_EmployeeID) ON DELETE CASCADE ,
 constraint  ORGANIZE_FK3 foreign key (cName) references GymClass ( cName) on delete cascade , 
 constraint  ORGANIZE_FK4 foreign key ( gmembership_no ) references gymmember ( MemberShipNo) ON DELETE CASCADE ) ;
   
   
  

  Create table  GymDB_PRIJECT.Member_plan (
  Gu_mem_number int (10) not null ,  
  Diet_plan varchar(20) ,
  weight decimal (7,2) ,
  constraint Member_planPK primary key (Gu_mem_number) , 
  constraint Member_planFK foreign key (Gu_mem_number ) references trainer (Gu_mem_number) ON DELETE CASCADE ) ; 
 
  
INSERT INTO GymDB_PRIJECT.GymMember
VALUES 
( 55201,'Rana Salman',0503321510 ,1130227081 ,'22/12/1','99/7/13','rana99@gmail.com','Muhammadiyah neighborhood'), 
( 55202,'Sarah Ahmed',0500152892 ,1013449120 ,'23/2/15','97/8/6','sarah.ma@gmail.com','Al Khaldiyeh neighborhood') ,
( 55203,'Noor Sultan',0552183615 ,1120314865 ,'23/4/1','00/1/20','noor22m@gmail.com' ,'Hamra district ' ),
( 55204,'Jana Ibrahim',0506567231 ,1011851334 ,'22/11/30','02/10/2','joojoo12@gmail.com' , ' Nozha District ') ,
( 55205,'Reem Anas', 0562410032 ,1199021554 ,'22/12/25','01/5/5','reem_anas90@gmail.com','Andalusia neighborhood');


 INSERT INTO GymDB_PRIJECT.employeemanagement
VALUES ( 'Arwa Faisal' , 0130 , ' Saudi ' , ' Boss ' , '30/12/30' , null  ) , 
( ' Nada nawaf ' , 0144 , 'Saudi' , ' Administrative ' , '25/1/29 ', 0130 ),
( ' Wedad Salem ' , 0164 , ' Saudi ' , ' Secretary ' ,  '23/12/15' , 0144 ),
( ' Malath Rayan ' , 0115 , ' Saudi ' , ' Clean Worker ' , '26/5/1' , 0144) ,
( ' Hanan Badr ' , 0108 , ' Saudi ' , ' receptionist ' , '24/4/1' , 0130 ) ;

INSERT INTO GymDB_PRIJECT.trainer
VALUES ( ' Laila Hassan ' , 0568143523 , 66231 , 7000 , 1033627100 , 55201 , 0130 ),
( ' Marwa Zeyad ' , 0500576221 , 66721 , 8900 , 1057249201 , 55202 , 0144 ) ,
( ' Maram Hussein' , 0567826110 , 66800 , 6500 , 1010488939 , 55203 ,0144) ,
( ' Daila Fahad ' , 0500053539 , 66209 , 8400 ,  0114563726 , 55204 ,  0144) ,
( ' Jumana Raed ' , 0562489541 , 66881 ,  5500 , 0179892392 , 55205 , 0130 );

INSERT INTO GymDB_PRIJECT.gymclass
VALUES ( '25 trainee' , 2 , ('22/12/1 ,09:30:00'), '30 minutes' ,'Zumba' , ' Aerobic' , 66721 , 55202 ),
( '15 trainee ', 7  ,( '22/12/3 ,12:45:00'), '20 minutes','yoga ' , ' Aerobic' , 66231 ,55202),
( '15 trainee ', 7  ,( '22/12/3 ,12:45:00'), '20 minutes','yoga ' , ' Aerobic' , 66231 ,55205),
( '25 trainee' , 2 , ('22/12/1 ,09:30:00'), '30 minutes' ,'Zumba' , ' Aerobic' , 66721 , 55204 ),
( '25 trainee' , 2 , ('22/12/1 ,09:30:00'), '30 minutes' ,'Zumba' , ' Aerobic' , 66721 , 55205 ),
( '10 trainee' , 5 , ('22/12/2 ,07:30:00'), '15 minutes' ,'Cardio' , ' Aerobic' , 66209 , 55203 ),
( '35 trainee' , 12 , ('22/12/5 ,08:45:00'), '45 minutes', ' Aerobic water ' , ' Aqua ' ,66881, 55205  ),
( '20 trainee ', 9  , ('22/12/6 ,10:45:00'), '1 Hour',' JUMP ' , ' Aerobic ' ,66209 ,55201   ),
( ' 25 trainee' , 3 , ('22/12/2 ,11:35:00'), '45 minutes' ,  ' HYDROKOMBAT ' , ' Aqua ' ,66800 , 55204  ),
( ' 25 trainee' , 3 , ('22/12/8 ,8:35:00'), '45 minutes' ,  ' HYDROKOMBAT ' , ' Aqua ' ,66800 , 55203  );

INSERT INTO GymDB_PRIJECT.hasclass_member 
values (55201 ,' JUMP ', 66209 ) ,
       (55203 ,' HYDROKOMBAT ' ,66800),
       (55205, ' Aerobic water ',66881),
       (55202 ,'Zumba',66721),
       (55205,'yoga ',66231);
      

       
       INSERT INTO GymDB_PRIJECT.organize 
       values ( 0130 ,66721 ,'Zumba', 55204 )  ;
       INSERT INTO GymDB_PRIJECT.organize 
       values ( 0130 , 66209 ,'yoga', 55201 )  ;
       INSERT INTO GymDB_PRIJECT.organize
       values (0144 , 66209 , 'Cardio' , 55203) ;  
       INSERT INTO GymDB_PRIJECT.organize 
       values (0144 , 66800, ' HYDROKOMBAT ', 55203 );
       INSERT INTO GymDB_PRIJECT.organize 
       values (0144 , 66881, ' Aerobic water ', 55205 ); 
       
       insert into GymDB_PRIJECT.MANAGE 
       values(55201 , 0144);
       insert into GymDB_PRIJECT.MANAGE 
       values(55201 , 0130);
       insert into GymDB_PRIJECT.MANAGE 
	   values(55203 , 0108);
       insert into GymDB_PRIJECT.MANAGE 
	   values(55205 , 0130);
       insert into GymDB_PRIJECT.MANAGE 
	   values(55204 , 0144);
       
        INSERT INTO GymDB_PRIJECT.Member_plan 
        values ( 55201 , ' increase weight', 52.23 );
        INSERT INTO GymDB_PRIJECT.Member_plan
        values (55202 , 'increase weight' , 43.22); 
        INSERT INTO GymDB_PRIJECT.Member_plan
        values (55203 , 'lose weight' , 88.59);
        INSERT INTO GymDB_PRIJECT.Member_plan
        values ( 55204 , 'build muscle body' , 55.41 ) ; 
        INSERT INTO GymDB_PRIJECT.Member_plan
        values (55205 , 'lose weight', 100.25);
        
-- (update) Increase the salary by 5% for trainer if salary is less than 7000 

update GymDB_PRIJECT.trainer
set Salary = Salary+Salary*0.05
where Salary < 7000;
SELECT * FROM GymDB_PRIJECT.trainer; 

--  delete Member Name  IDNumber is 1011851334 
delete from GymDB_PRIJECT.GymMember
where IDNumber= 1011851334;


-- 1) Show the number of subscribers in each class 
select cName ,count(cName) AS count
FROM GymDB_PRIJECT.gymclass
group by cName ;   

-- 2) Show subscribers whose subscription expires before 1/1/2023
SELECT MemberShipNo , gName  ,memberShipDuration  
from GymDB_PRIJECT.gymmember
where memberShipDuration < '23/1/1' ; 

-- 3) List all details of all gymmember with first in ascending order MemberShipNo , gName  
SELECT * FROM GymDB_PRIJECT.gymmember
ORDER BY MemberShipNo , gName DESC; 

-- 4) Total salaries of trainers under the supervision of the supervisorID ='0144' 
/*by use having*/
SELECT Su_ID,count(tEmployeeID) AS COUNT ,SUM(salary) as sumSalary
from trainer
WHERE Su_ID = 0144 
having count(Su_ID) > 1 ; 

-- 5)  Using join operation, list Tr_EmployeeID ,cTime ,cName , eName , employeeID
--    When the class type is Aqua 
SELECT  
h.Tr_EmployeeID, h.cTime, h.cName,
r.eName, r.employeeID
from 
gymclass h,employeemanagement r, organize x
where 
x.Tr_EmployeeID = h.Tr_EmployeeID
AND x.eEmployee_id = r.employeeID
AND h. Type_class ='Aqua';

-- 6) List of Tr_EmployeeID gMemberShipNo cName in gymclass with first one 
-- descending order Tr_EmployeeID /*by use (order by)*/
select Tr_EmployeeID, gMemberShipNo , cName 
from hasclass_member 
order by 1 desc; 

                       
-- 7 ) List of names trained by the  traine ID =  66721 
/*by use subqueries and */
SELECT gName 
FROM gymmember 
WHERE MemberShipNo IN ( SELECT GmMemberShipNo
                   FROM  gymclass
                   WHERE Tr_EmployeeID = 66721 ) ; 
 
 
 -- 8 ) Select  Aerobic water class and show date and time of it.
      /*by use WHERE */
select   ctime
from gymclass 
where  cName =  ' Aerobic water ' ;
 

-- 9) show number of employee in each position
/*by use group by */
select ePosition, count(employeeID) AS count
from employeemanagement
group by ePosition;

-- 10) Show how many classes are in each type 

SELECT Type_class , count(Type_class) AS COUNT
FROM gymclass
group by Type_class ; 

-- 11) Show the name of the employee who manages on the member ID = 55201 
       -- and the supervisor of his trainer  
select eName  
from employeemanagement
where employeeID in ( select eEmployee_id
                    from manage
                    where gmembership_no  in ( select Gu_mem_number  
                                            from trainer
                                            where Gu_mem_number = 55201))  ; 
