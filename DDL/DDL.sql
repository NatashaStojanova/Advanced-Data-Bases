CREATE TABLE Base_Hospital(
    id int PRIMARY KEY NOT NULL,
    name varchar (50) UNIQUE ,
    description varchar(250)
);
g
CREATE TABLE Hospital(
    id int PRIMARY KEY NOT NULL,
    location varchar(50),
    id_base_hospital int,

    CONSTRAINT FK FOREIGN KEY (id_base_hospital) REFERENCES Base_Hospital(id)
);

CREATE TABLE Department(
    id int PRIMARY KEY NOT NULL,
    name varchar(50),
    id_hospital int,

    CONSTRAINT FK FOREIGN KEY (id_hospital) REFERENCES Hospital(id)
);

CREATE TABLE Doctor(
    id int PRIMARY KEY NOT NULL,
    ssn int UNIQUE,
    name varchar(50),
    surname varchar(50),
    hospital_id int,

    CONSTRAINT FK FOREIGN KEY (hospital_id) REFERENCES Hospital(id)
);

CREATE TABLE Medical_Specialist(
    id int PRIMARY KEY NOT NULL,
    department_id int,

    CONSTRAINT FK1 FOREIGN KEY (id) REFERENCES Doctor(id),
    CONSTRAINT FK2 FOREIGN KEY (department_id) REFERENCES Department(id)

);

CREATE Table General_Practitioner(
    id int PRIMARY KEY NOT NULL,

    CONSTRAINT FK FOREIGN KEY (id) REFERENCES Doctor(id)
);


CREATE TABLE Patient(
    id int PRIMARY KEY NOT NULL,
    ssn int UNIQUE,
    name varchar(50),
    surname varchar(50),
    address varchar(50),
    age int,
    id_doctor int,

    CONSTRAINT FK FOREIGN KEY (id_doctor) REFERENCES General_Practitioner(id)
);

CREATE TABLE Refferal(
    id int PRIMARY KEY NOT NULL,
    description varchar(255),
    medical_specialist_id int,
    check_up_id int,
    CONSTRAINT FK2 FOREIGN KEY (medical_specialist_id) REFERENCES Medical_Specialist(id)
);

CREATE TABLE Check_Up(
    id int PRIMARY KEY NOT NULL,
    description varchar(255),
    date date,
    patient_id int,
    refferal_id int,
    doctor_id int,

    CONSTRAINT FK1 FOREIGN KEY (patient_id) REFERENCES Patient(id),
    CONSTRAINT FK2 FOREIGN KEY (refferal_id) REFERENCES Refferal(id),
    CONSTRAINT FK3 FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);


CREATE TABLE ICD_10(
    id int PRIMARY KEY NOT NULL,
    name varchar(50) unique,
    code int UNIQUE
);

CREATE TABLE Check_Up_ICD(
    id int PRIMARY KEY NOT NULL,
    icd_id int,
    check_up_id int,

    CONSTRAINT FK1 FOREIGN KEY (icd_id) REFERENCES ICD_10(id),
    CONSTRAINT FK2 FOREIGN KEY (check_up_id) REFERENCES Check_Up(id)
);

ALTER TABLE Refferal ADD CONSTRAINT FK1 FOREIGN KEY(check_up_id) REFERENCES Check_Up(id)


