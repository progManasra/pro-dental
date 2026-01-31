USE prodental;

INSERT INTO users(full_name,email,role,password_hash)
VALUES
('Admin','admin@test.com','ADMIN','$2b$10$dummy'),
('Doctor 1','dr1@test.com','DOCTOR','$2b$10$dummy'),
('Patient 1','p1@test.com','PATIENT','$2b$10$dummy');

INSERT INTO doctors VALUES (2,'General');
INSERT INTO patients VALUES (3,'1990-01-01');

INSERT INTO doctor_weekly_shifts(doctor_id,weekday,start_time,end_time)
VALUES (2,1,'09:00','13:00'),(2,2,'09:00','13:00');

INSERT INTO appointments(doctor_id,patient_id,start_at,status)
VALUES (2,3,NOW(),'BOOKED');
