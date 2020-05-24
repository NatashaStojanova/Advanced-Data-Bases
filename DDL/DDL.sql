drop table if exists base_hospital cascade;
create table base_hospital(
    id int primary key not null,
    name varchar (50) unique not null ,
    description varchar(250)
);

drop table if exists hospital cascade;
create table hospital(
    id int primary key not null,
    location varchar(50),
    id_base_hospital int,
    constraint FK foreign key (id_base_hospital) references base_hospital(id)
);

drop table if exists department cascade;
create table department(
     id int primary key not null,
     name varchar(50),
     description varchar(255),
     id_hospital int,
    constraint FK foreign key (id_hospital) references hospital(id)
);

drop table if exists doctor cascade;
create table doctor(
    id int primary key not null,
    ssn int unique ,
    name varchar(50),
    surname varchar(50),
    hospital_id int,
    constraint FK foreign key (hospital_id) references hospital(id)
);

drop table if exists medical_specialist cascade;
create table medical_specialist(
     id int primary key not null,
     department_id int,
     constraint FK1 foreign key (id) references doctor(id),
     constraint FK2 foreign key (department_id) references department(id)

) inherits (doctor);

drop table if exists general_practitioner cascade;
create table general_practitioner(
    id int primary key not null,
    constraint FK foreign key (id) references doctor(id)
) inherits (doctor);

drop table if exists patient cascade;
create table patient(
    id int primary key not null,
    ssn int unique,
    name varchar(50),
    surname varchar(50),
    address varchar(50),
    age int,
    id_doctor int,
    constraint FK foreign key (id_doctor) references general_practitioner(id)
);

drop table if exists referral cascade;
create table referral(
    id int primary key not null,
    description varchar(255),
    medical_specialist_id int,
    check_up_id int,
    constraint FK1 foreign key (medical_specialist_id) references medical_specialist(id)
);

drop table if exists check_up cascade;
create table check_up(
    id int primary key not null,
    description varchar(255),
    date date,
    patient_id int,
    refferal_id int,
    doctor_id int,
    constraint FK1 foreign key (patient_id) references patient(id),
    constraint FK2 foreign key (refferal_id) references referral(id),
    constraint FK3 foreign key (doctor_id) references doctor(id)
);

drop table if exists icd_10 cascade;
create table icd_10(
    id int primary key not null,
    name varchar(50) unique,
    code int unique not null
);

drop table if exists check_up_icd cascade;
create table check_up_icd(
    id int primary key not null,
    icd_id int,
    check_up_id int,
    constraint FK1 foreign key (icd_id) references icd_10(id),
    constraint FK2 foreign key (check_up_id) references check_up(id)
);

alter table referral add constraint FK2 foreign key (check_up_id) references check_up(id);

drop sequence if exists main_sequence;
create sequence main_sequence
    start 1
    increment 1;