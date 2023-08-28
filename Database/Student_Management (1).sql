create database Student_Management;
use Student_Management;



create table auth (userid varchar(10) primary key ,
        password_field varchar(10) not null,
        name_field varchar(50),
        role_field varchar(7) not null
);


insert into auth values ("admin_1","admin123","Shubham","admin");





create table student_info (
		sr_no int auto_increment , 
        student_id varchar(10) ,
        full_name varchar(50)  , 
        date_of_birth date  ,
        place_of_birth varchar(20)  , 
        age numeric(2)  , 
        adhaar_no numeric(15)  , 
        pan_no varchar(10)  ,
        catagory varchar(10)  , 
        gender char(1) check (gender in ('M','F')), 
        mobile_no numeric(10)  , 
        local_address varchar(95)  , 
        permanent_address varchar(95) ,
        primary key(sr_no),

        foreign key (student_id) references auth(userid)
);

create table parent_info
(
		sr_no int auto_increment , 
        student_id varchar(10) ,
		father_name varchar(50)  , 
        occupation varchar(15)  , 
        father_mobile_no numeric(10)  ,
        father_age numeric(2)  ,
        
        mother_name varchar(50)  , 
        occupation_ varchar(15)  , 
        mother_mobile_no_ numeric(10)  ,
        mother_age numeric(2),
        primary key(sr_no),
	
		foreign key (student_id) references student_info(student_id)

);


create table edu_info
(
	sr_no int auto_increment , 
	student_id varchar(10) ,
	ssc_percentage decimal(4,2)  ,
	ssc_passing_year year  ,
	hsc_percentage decimal(4,2)  ,
	hsc_passing_year year  ,
	cet_percentile decimal(4,2)  ,
	jee_percentile decimal(4,2),  

	primary key(sr_no),
	
	foreign key (student_id) references student_info(student_id)

);

create table current_course_and_payment_info
(
	    sr_no int auto_increment , 
	    student_id varchar(10) ,
        name_of_course varchar(5)  ,
        year_of_study varchar(10)  ,
        previous_year_cgpa numeric(4,2),
        number_of_backlogs numeric(2),
        name_of_backlog_subject varchar(50),

        
        acadmaic_fees numeric(8),
        amount_paid numeric(8),
        
        primary key(sr_no),
	
	   foreign key (student_id) references student_info(student_id)


);


create table teacher_info(

		sr_no int auto_increment , 
	    teacher_id varchar(10) ,
        full_name varchar(50)  , 
        date_of_birth date  ,
        age numeric(2)  , 
        adhaar_no numeric(15)  , 
		gender char(1) check (gender in ('M','F')), 
        mobile_no numeric(10)  , 
        local_address varchar(95)  , 
        permanent_address varchar(95) ,
        subject_you_teach varchar(15),
        department varchar(15),
        
         primary key(sr_no),
	
		foreign key (teacher_id) references auth(userid)
        

);


create table student_marks(


	sr_no int auto_increment , 
	student_id varchar(10) ,

	dbms_theory integer,
    dbms_practical integer,
    
    oop_theory integer,
    oop_practical integer,
    
    cns_theory integer,
    cns_practical integer,
    
    toc_theory integer,
    toc_practical integer,
    
    spm_theory integer,
    spm_practical integer,
    
     primary key(sr_no),
	foreign key (student_id) references student_info(student_id)
    

);






alter table student_marks drop sr_no;


create table teacher_salary(

	teacher_id varchar(10) ,
    teacher_salary varchar(10),
    amount_paid varchar(10),
    salary_payment_status varchar(10),
    
    foreign key (teacher_id) references teacher_info(teacher_id)

);




