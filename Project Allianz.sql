use amc;
create table Branch(
Branch_ID int,
Branch_name varchar (20) not null,
Branch_address varchar (20) not null,
Contact_information varchar (20) not null,
primary key(branch_id)
);
create table staff(
Staff_ID int,
Firstname varchar (20) not null,
Lastname varchar (20) not null,
Staff_role varchar (20) not null,
Contact_information varchar (20) not null,
primary key(staff_id)
);
create table Patients(
Patient_ID int,
Firstname varchar (20) not null,
Lastname varchar (20) not null,
DateofBirth date not null,
Gender varchar (9) not null,
Contact_Information varchar (20) not null,
primary key(patient_id)
);
create table admission
(
Admission_ID int,
AdmissionDate date not null,
DischargeDate date not null,
Roomnumber varchar (20),
branch_id int,
patient_id int,
primary key(admission_id),
foreign key(branch_id) references branch(branch_id),
foreign key(patient_ID) references patients(patient_ID)
);
create table Diagnosis
(
Diagnosis_ID int,
Diagnosisname varchar (30)not null,
Description varchar (50) not null,
primary key(Diagnosis_ID)
);
create table medication
(
Medication_ID int,
Medicationname varchar (20) not null,
Dosage varchar (20) not null,
Drug_Description varchar (50) not null,
Branch_id int,
primary key(medication_id),
foreign key(branch_id) references branch(branch_id)
);
create table Death
(
Death_ID int,
DateofDeath date not null,
CauseofDeath date not null,
patient_id int,
primary key(death_id),
foreign key(patient_id) references patients(patient_id)
);
create table Treatment
(
Treatment_ID int,
Patient_ID int,
Staff_ID int,
Diagnosis_ID int,
Medication_ID int,
Branch_ID int,
Admission_ID int,
TreatmentDate date not null,
Cost int,
Duration int,
primary key(treatment_id),
foreign key(patient_id) references patients(patient_id),
foreign key(staff_id) references staff(staff_id),
foreign key(diagnosis_id) references diagnosis(diagnosis_id),
foreign key(medication_id) references medication(medication_id),
foreign key(branch_id) references branch(branch_id),
foreign key(admission_id) references admission(admission_id)
);