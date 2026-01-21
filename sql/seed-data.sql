-- ============================================
-- SEED DATA FOR MYH DATABASE
-- ============================================

-- ============================================
-- 1. SCHOOLS (2)
-- ============================================
INSERT INTO "School" ("school_id", "name", "address") 
VALUES
(1, 'Stockholm', 'Kungsgatan 12, 111 43 Stockholm'),
(2, 'Göteborg', 'Avenyn 45, 411 36 Göteborg');

-- ============================================
-- 2. COMPANIES (6)
-- ============================================
INSERT INTO "Company" ("company_id", "name", "org_nr", "address", "f_tax") 
VALUES
(1, 'TechConsult AB', '556123-4567', 'Storgatan 1, Stockholm', TRUE),
(2, 'Nordic IT Solutions', '556234-5678', 'Hamngatan 5, Göteborg', TRUE),
(3, 'CodeCraft Consulting', '556345-6789', 'Vasagatan 10, Stockholm', TRUE),
(4, 'CloudExperts Sweden', '556456-7890', 'Kungsgatan 20, Göteborg', TRUE),
(5, 'SecureNet Advisory', '556567-8901', 'Drottninggatan 15, Stockholm', TRUE),
(6, 'DataMinds Consulting', '556678-9012', 'Avenyn 30, Göteborg', TRUE);

-- ============================================
-- 3. TEACHERS (7)
-- ============================================
INSERT INTO "Teacher" ("teacher_id", "first_name", "last_name", "contract_type", "hire_date") 
VALUES
(1, 'Erik', 'Andersson', 'permanent_hire', '2022-01-15'),
(2, 'Maria', 'Bergström', 'consultant', '2023-08-01'),
(3, 'Johan', 'Carlsson', 'consultant', '2023-09-01'),
(4, 'Anna', 'Danielsson', 'consultant', '2024-01-10'),
(5, 'Per', 'Eriksson', 'consultant', '2023-06-15'),
(6, 'Linda', 'Fransson', 'consultant', '2024-02-01'),
(7, 'Magnus', 'Gustafsson', 'consultant', '2023-11-20');

-- ============================================
-- 4. TEACHER INFO (7)
-- ============================================
INSERT INTO "TeacherInfo" ("teacher_info_id", "teacher_id", "social_security_nr", "email") 
VALUES
(1, 1, '198501151234', 'erik.andersson@yrkesco.se'),
(2, 2, '199002201234', 'maria.bergstrom@techconsult.se'),
(3, 3, '198803151234', 'johan.carlsson@nordiit.se'),
(4, 4, '199205101234', 'anna.danielsson@codecraft.se'),
(5, 5, '198707201234', 'per.eriksson@cloudexperts.se'),
(6, 6, '199109051234', 'linda.fransson@securenet.se'),
(7, 7, '198612151234', 'magnus.gustafsson@dataminds.se');

-- ============================================
-- 5. PERMANENT HIRE (1)
-- ============================================
INSERT INTO "PermanentHire" ("permanent_hire_id", "teacher_id", "monthly_salary") 
VALUES
(1, 1, 45000.00);

-- ============================================
-- 6. CONSULTANTS (6)
-- ============================================
INSERT INTO "Consultant" ("consultant_id", "teacher_id", "company_id", "hourly_rate") 
VALUES
(1, 2, 1, 850.00),
(2, 3, 2, 900.00),
(3, 4, 3, 875.00),
(4, 5, 4, 920.00),
(5, 6, 5, 890.00),
(6, 7, 6, 910.00);

-- ============================================
-- 7. EDUCATIONAL LEADERS (4)
-- ============================================
INSERT INTO "EduLead" ("edulead_id", "teacher_id", "start_date") 
VALUES
(1, 1, '2022-01-15'),
(2, 2, '2023-08-01'),
(3, 3, '2023-09-01'),
(4, 4, '2024-01-10');

-- ============================================
-- 8. PROGRAMS (4)
-- ============================================
INSERT INTO "Program" ("program_id", "edulead_id", "name", "code") 
VALUES
(1, 1, 'Data Engineering', 'DE'),
(2, 2, 'Software Development', 'SD'),
(3, 3, 'Cybersecurity', 'CS'),
(4, 4, 'Cloud Infrastructure', 'CI');

-- ============================================
-- 9. PROGRAM-SCHOOL RELATIONSHIPS (8)
-- All programs offered at both schools
-- ============================================
INSERT INTO "ProgramSchool" ("program_school_id", "school_id", "program_id") 
VALUES
(1, 1, 1), -- DE at Stockholm
(2, 2, 1), -- DE at Göteborg
(3, 1, 2), -- SD at Stockholm
(4, 2, 2), -- SD at Göteborg
(5, 1, 3), -- CS at Stockholm
(6, 2, 3), -- CS at Göteborg
(7, 1, 4), -- CI at Stockholm
(8, 2, 4); -- CI at Göteborg

-- ============================================
-- 10. COURSES (25)
-- 5 per program (20) + 5 standalone (25 total)
-- ============================================

-- Data Engineering Courses (5)
INSERT INTO "Course" ("course_id", "teacher_id", "name", "code", "points", "description") 
VALUES
(1, 1, 'Python Programming', 'DE101', 30, 'Introduction to Python for data engineering'),
(2, 2, 'Database Design', 'DE102', 20, 'Relational database design and SQL'),
(3, 3, 'Data Warehousing', 'DE103', 25, 'Data warehouse architecture and ETL'),
(4, 4, 'ETL Processes', 'DE104', 20, 'Extract, Transform, Load processes'),
(5, 5, 'Big Data Analytics', 'DE105', 25, 'Working with big data technologies');

-- Software Development Courses (5)
INSERT INTO "Course" ("course_id", "teacher_id", "name", "code", "points", "description") 
VALUES
(6, 2, 'Object-Oriented Programming', 'SD101', 30, 'OOP principles and design patterns'),
(7, 3, 'Web Development', 'SD102', 25, 'Full-stack web development'),
(8, 4, 'Software Testing', 'SD103', 20, 'Testing methodologies and frameworks'),
(9, 5, 'Agile Methods', 'SD104', 15, 'Agile development and Scrum'),
(10, 6, 'DevOps Fundamentals', 'SD105', 20, 'CI/CD and DevOps practices');

-- Cybersecurity Courses (5)
INSERT INTO "Course" ("course_id", "teacher_id", "name", "code", "points", "description") 
VALUES
(11, 3, 'Network Security', 'CS101', 25, 'Securing network infrastructure'),
(12, 4, 'Ethical Hacking', 'CS102', 30, 'Penetration testing and security assessment'),
(13, 5, 'Cryptography', 'CS103', 20, 'Encryption and cryptographic protocols'),
(14, 6, 'Security Operations', 'CS104', 25, 'SOC operations and threat detection'),
(15, 7, 'Incident Response', 'CS105', 20, 'Security incident handling');

-- Cloud Infrastructure Courses (5)
INSERT INTO "Course" ("course_id", "teacher_id", "name", "code", "points", "description") 
VALUES
(16, 4, 'Cloud Architecture', 'CI101', 30, 'Designing cloud-native applications'),
(17, 5, 'Container Orchestration', 'CI102', 25, 'Docker and Kubernetes'),
(18, 6, 'Infrastructure as Code', 'CI103', 20, 'Terraform and automation'),
(19, 7, 'Cloud Security', 'CI104', 25, 'Securing cloud environments'),
(20, 1, 'Monitoring & Logging', 'CI105', 20, 'Cloud observability');

-- Standalone Courses (5)
INSERT INTO "Course" ("course_id", "teacher_id", "name", "code", "points", "description") 
VALUES
(21, 1, 'Project Management', 'GEN101', 15, 'Project management fundamentals'),
(22, 2, 'Business Communication', 'GEN102', 10, 'Professional communication skills'),
(23, 3, 'Mathematics for Tech', 'GEN103', 20, 'Mathematical foundations'),
(24, 4, 'English for IT', 'GEN104', 15, 'Technical English'),
(25, 5, 'Entrepreneurship', 'GEN105', 15, 'Starting a tech business');

-- ============================================
-- 11. COURSE-PROGRAM RELATIONSHIPS (20)
-- Link 5 courses to each program
-- Note: Standalone courses (21-25) are NOT linked
-- ============================================

-- Data Engineering Program Courses
INSERT INTO "CourseProgram" ("course_program_id", "course_id", "program_id") 
VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1), (5, 5, 1);

-- Software Development Program Courses
INSERT INTO "CourseProgram" ("course_program_id", "course_id", "program_id") 
VALUES
(6, 6, 2), (7, 7, 2), (8, 8, 2), (9, 9, 2), (10, 10, 2);

-- Cybersecurity Program Courses
INSERT INTO "CourseProgram" ("course_program_id", "course_id", "program_id") 
VALUES
(11, 11, 3), (12, 12, 3), (13, 13, 3), (14, 14, 3), (15, 15, 3);

-- Cloud Infrastructure Program Courses
INSERT INTO "CourseProgram" ("course_program_id", "course_id", "program_id") 
VALUES
(16, 16, 4), (17, 17, 4), (18, 18, 4), (19, 19, 4), (20, 20, 4);

-- ============================================
-- 12. CLASSES (12)
-- 3 classes per program (cohorts: 1, 2, 3)
-- ============================================

-- Data Engineering Classes
INSERT INTO "Class" ("class_id", "school_id", "program_id", "name", "start_year", "cohort") VALUES
(1, 1, 1, 'DE24', 2024, 1),
(2, 1, 1, 'DE25', 2025, 2),
(3, 1, 1, 'DE26', 2026, 3);

-- Software Development Classes
INSERT INTO "Class" ("class_id", "school_id", "program_id", "name", "start_year", "cohort") 
VALUES
(4, 2, 2, 'SD24', 2024, 1),
(5, 2, 2, 'SD25', 2025, 2),
(6, 2, 2, 'SD26', 2026, 3);

-- Cybersecurity Classes
INSERT INTO "Class" ("class_id", "school_id", "program_id", "name", "start_year", "cohort") 
VALUES
(7, 1, 3, 'CS24', 2024, 1),
(8, 1, 3, 'CS25', 2025, 2),
(9, 1, 3, 'CS26', 2026, 3);

-- Cloud Infrastructure Classes
INSERT INTO "Class" ("class_id", "school_id", "program_id", "name", "start_year", "cohort") 
VALUES
(10, 2, 4, 'CI24', 2024, 1),
(11, 2, 4, 'CI25', 2025, 2),
(12, 2, 4, 'CI26', 2026, 3);

-- ============================================
-- 13. STUDENTS (120)
-- 10 students per class × 12 classes = 120 students
-- ============================================

-- Class 1: DE24-1 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(1, 1, 'Emma', 'Andersson'),
(2, 1, 'Liam', 'Bergström'),
(3, 1, 'Olivia', 'Carlsson'),
(4, 1, 'Noah', 'Danielsson'),
(5, 1, 'Ava', 'Eriksson'),
(6, 1, 'Lucas', 'Fransson'),
(7, 1, 'Mia', 'Gustafsson'),
(8, 1, 'Oscar', 'Hansson'),
(9, 1, 'Alice', 'Isaksson'),
(10, 1, 'Hugo', 'Johansson');

-- Class 2: DE25-2 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(11, 2, 'Ella', 'Karlsson'),
(12, 2, 'William', 'Larsson'),
(13, 2, 'Maja', 'Magnusson'),
(14, 2, 'Elias', 'Nilsson'),
(15, 2, 'Ebba', 'Olsson'),
(16, 2, 'Alexander', 'Persson'),
(17, 2, 'Wilma', 'Pettersson'),
(18, 2, 'Oliver', 'Svensson'),
(19, 2, 'Alicia', 'Lindberg'),
(20, 2, 'Filip', 'Jakobsson');

-- Class 3: DE26-3 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(21, 3, 'Astrid', 'Axelsson'),
(22, 3, 'Viktor', 'Berg'),
(23, 3, 'Saga', 'Holm'),
(24, 3, 'Ludvig', 'Engström'),
(25, 3, 'Stella', 'Lundgren'),
(26, 3, 'Emil', 'Forsberg'),
(27, 3, 'Nova', 'Lindström'),
(28, 3, 'Leon', 'Sandberg'),
(29, 3, 'Vera', 'Mattsson'),
(30, 3, 'Theo', 'Henriksson');

-- Class 4: SD24-1 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(31, 4, 'Alma', 'Ström'),
(32, 4, 'Max', 'Nyström'),
(33, 4, 'Selma', 'Holmberg'),
(34, 4, 'Adam', 'Lindqvist'),
(35, 4, 'Edith', 'Ekström'),
(36, 4, 'Vincent', 'Söderberg'),
(37, 4, 'Clara', 'Lund'),
(38, 4, 'Anton', 'Blomqvist'),
(39, 4, 'Signe', 'Sjöberg'),
(40, 4, 'Isak', 'Lundberg');

-- Class 5: SD25-2 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(41, 5, 'Elvira', 'Nordin'),
(42, 5, 'Gabriel', 'Öberg'),
(43, 5, 'Iris', 'Lundqvist'),
(44, 5, 'Adrian', 'Lindholm'),
(45, 5, 'Elsa', 'Bergman'),
(46, 5, 'Leo', 'Eklund'),
(47, 5, 'Freja', 'Holmlund'),
(48, 5, 'Nils', 'Hedlund'),
(49, 5, 'Klara', 'Sjögren'),
(50, 5, 'Axel', 'Sandström');

-- Class 6: SD26-3 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(51, 6, 'Ines', 'Lundkvist'),
(52, 6, 'Noel', 'Dahlberg'),
(53, 6, 'Molly', 'Söderström'),
(54, 6, 'Sam', 'Nordström'),
(55, 6, 'Alma', 'Ek'),
(56, 6, 'Charlie', 'Nyberg'),
(57, 6, 'Juni', 'Håkansson'),
(58, 6, 'Harry', 'Mårtensson'),
(59, 6, 'Sigrid', 'Strömberg'),
(60, 6, 'Frank', 'Åberg');

-- Class 7: CS24-1 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(61, 7, 'Linnea', 'Holmgren'),
(62, 7, 'Jack', 'Wallin'),
(63, 7, 'Maja', 'Åkesson'),
(64, 7, 'Benjamin', 'Johansson'),
(65, 7, 'Lilly', 'Samuelsson'),
(66, 7, 'Felix', 'Vikström'),
(67, 7, 'Elise', 'Ivarsson'),
(68, 7, 'Sebastian', 'Månsson'),
(69, 7, 'Liv', 'Blom'),
(70, 7, 'Jacob', 'Granberg');

-- Class 8: CS25-2 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(71, 8, 'Tuva', 'Melin'),
(72, 8, 'Charlie', 'Öhman'),
(73, 8, 'Ellen', 'Lundén'),
(74, 8, 'Alfred', 'Hallström'),
(75, 8, 'Ida', 'Broberg'),
(76, 8, 'David', 'Fredriksson'),
(77, 8, 'Agnes', 'Gunnarsson'),
(78, 8, 'Melvin', 'Abrahamsson'),
(79, 8, 'Hedda', 'Westin'),
(80, 8, 'Simon', 'Ström');

-- Class 9: CS26-3 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(81, 9, 'Märta', 'Palm'),
(82, 9, 'Gustav', 'Norberg'),
(83, 9, 'Julia', 'Hermansson'),
(84, 9, 'Malte', 'Arvidsson'),
(85, 9, 'Tilde', 'Sundberg'),
(86, 9, 'Otto', 'Edlund'),
(87, 9, 'Svea', 'Falk'),
(88, 9, 'Viggo', 'Ahlström'),
(89, 9, 'Celine', 'Bergqvist'),
(90, 9, 'Albert', 'Martinsson');

-- Class 10: CI24-1 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(91, 10, 'Alva', 'Ericson'),
(92, 10, 'Love', 'Håkansson'),
(93, 10, 'Isabelle', 'Andreasson'),
(94, 10, 'Linus', 'Johnsson'),
(95, 10, 'Thea', 'Jonsson'),
(96, 10, 'Erik', 'Kristiansson'),
(97, 10, 'Tilda', 'Fransson'),
(98, 10, 'Andreas', 'Larsson'),
(99, 10, 'Sara', 'Bengtsson'),
(100, 10, 'Martin', 'Holm');

-- Class 11: CI25-2 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(101, 11, 'Sofia', 'Lundström'),
(102, 11, 'Daniel', 'Mårtensson'),
(103, 11, 'Anna', 'Nilsson'),
(104, 11, 'Karl', 'Eriksson'),
(105, 11, 'Lisa', 'Karlsson'),
(106, 11, 'Peter', 'Olofsson'),
(107, 11, 'Eva', 'Sjöström'),
(108, 11, 'Jonas', 'Persson'),
(109, 11, 'Maria', 'Lindgren'),
(110, 11, 'Johan', 'Andersson');

-- Class 12: CI26-3 (10 students)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") 
VALUES
(111, 12, 'Linda', 'Gustavsson'),
(112, 12, 'Mikael', 'Pettersson'),
(113, 12, 'Karin', 'Jakobsson'),
(114, 12, 'Anders', 'Bergström'),
(115, 12, 'Helena', 'Hansson'),
(116, 12, 'Fredrik', 'Svensson'),
(117, 12, 'Åsa', 'Danielsson'),
(118, 12, 'Lars', 'Johansson'),
(119, 12, 'Annika', 'Karlsson'),
(120, 12, 'Magnus', 'Larsson');

-- ============================================
-- 14. STUDENT INFO (120)
-- One for each student
-- ============================================

-- Class 1: DE24-1
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(1, 1, '200201151234', 'emma.andersson@student.yrkesco.se'),
(2, 2, '200105201234', 'liam.bergstrom@student.yrkesco.se'),
(3, 3, '200203101234', 'olivia.carlsson@student.yrkesco.se'),
(4, 4, '200107151234', 'noah.danielsson@student.yrkesco.se'),
(5, 5, '200209201234', 'ava.eriksson@student.yrkesco.se'),
(6, 6, '200112051234', 'lucas.fransson@student.yrkesco.se'),
(7, 7, '200204251234', 'mia.gustafsson@student.yrkesco.se'),
(8, 8, '200110301234', 'oscar.hansson@student.yrkesco.se'),
(9, 9, '200206151234', 'alice.isaksson@student.yrkesco.se'),
(10, 10, '200111101234', 'hugo.johansson@student.yrkesco.se');

-- Class 2: DE25-2
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") VALUES
(11, 11, '200308201234', 'ella.karlsson@student.yrkesco.se'),
(12, 12, '200212151234', 'william.larsson@student.yrkesco.se'),
(13, 13, '200305101234', 'maja.magnusson@student.yrkesco.se'),
(14, 14, '200209251234', 'elias.nilsson@student.yrkesco.se'),
(15, 15, '200307051234', 'ebba.olsson@student.yrkesco.se'),
(16, 16, '200211201234', 'alexander.persson@student.yrkesco.se'),
(17, 17, '200304151234', 'wilma.pettersson@student.yrkesco.se'),
(18, 18, '200208301234', 'oliver.svensson@student.yrkesco.se'),
(19, 19, '200306101234', 'alicia.lindberg@student.yrkesco.se'),
(20, 20, '200210051234', 'filip.jakobsson@student.yrkesco.se');

-- Class 3: DE26-3
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(21, 21, '200401201234', 'astrid.axelsson@student.yrkesco.se'),
(22, 22, '200405151234', 'viktor.berg@student.yrkesco.se'),
(23, 23, '200403101234', 'saga.holm@student.yrkesco.se'),
(24, 24, '200407251234', 'ludvig.engstrom@student.yrkesco.se'),
(25, 25, '200402051234', 'stella.lundgren@student.yrkesco.se'),
(26, 26, '200406201234', 'emil.forsberg@student.yrkesco.se'),
(27, 27, '200404151234', 'nova.lindstrom@student.yrkesco.se'),
(28, 28, '200408301234', 'leon.sandberg@student.yrkesco.se'),
(29, 29, '200401101234', 'vera.mattsson@student.yrkesco.se'),
(30, 30, '200405051234', 'theo.henriksson@student.yrkesco.se');

-- Class 4: SD24-1
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(31, 31, '200109201234', 'alma.strom@student.yrkesco.se'),
(32, 32, '200113151234', 'max.nystrom@student.yrkesco.se'),
(33, 33, '200111101234', 'selma.holmberg@student.yrkesco.se'),
(34, 34, '200115251234', 'adam.lindqvist@student.yrkesco.se'),
(35, 35, '200110051234', 'edith.ekstrom@student.yrkesco.se'),
(36, 36, '200114201234', 'vincent.soderberg@student.yrkesco.se'),
(37, 37, '200112151234', 'clara.lund@student.yrkesco.se'),
(38, 38, '200116301234', 'anton.blomqvist@student.yrkesco.se'),
(39, 39, '200109101234', 'signe.sjoberg@student.yrkesco.se'),
(40, 40, '200113051234', 'isak.lundberg@student.yrkesco.se');

-- Class 5: SD25-2
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(41, 41, '200207201234', 'elvira.nordin@student.yrkesco.se'),
(42, 42, '200211151234', 'gabriel.oberg@student.yrkesco.se'),
(43, 43, '200209101234', 'iris.lundqvist@student.yrkesco.se'),
(44, 44, '200213251234', 'adrian.lindholm@student.yrkesco.se'),
(45, 45, '200206051234', 'elsa.bergman@student.yrkesco.se'),
(46, 46, '200210201234', 'leo.eklund@student.yrkesco.se'),
(47, 47, '200208151234', 'freja.holmlund@student.yrkesco.se'),
(48, 48, '200212301234', 'nils.hedlund@student.yrkesco.se'),
(49, 49, '200207101234', 'klara.sjogren@student.yrkesco.se'),
(50, 50, '200211051234', 'axel.sandstrom@student.yrkesco.se');

-- Class 6: SD26-3
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(51, 51, '200305201234', 'ines.lundkvist@student.yrkesco.se'),
(52, 52, '200309151234', 'noel.dahlberg@student.yrkesco.se'),
(53, 53, '200307101234', 'molly.soderstrom@student.yrkesco.se'),
(54, 54, '200311251234', 'sam.nordstrom@student.yrkesco.se'),
(55, 55, '200304051234', 'alma.ek@student.yrkesco.se'),
(56, 56, '200308201234', 'charlie.nyberg@student.yrkesco.se'),
(57, 57, '200306151234', 'juni.hakansson@student.yrkesco.se'),
(58, 58, '200310301234', 'harry.martensson@student.yrkesco.se'),
(59, 59, '200305101234', 'sigrid.stromberg@student.yrkesco.se'),
(60, 60, '200309051234', 'frank.aberg@student.yrkesco.se');

-- Class 7: CS24-1
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(61, 61, '200201201234', 'linnea.holmgren@student.yrkesco.se'),
(62, 62, '200205151234', 'jack.wallin@student.yrkesco.se'),
(63, 63, '200203101234', 'maja.akesson@student.yrkesco.se'),
(64, 64, '200207251234', 'benjamin.johansson@student.yrkesco.se'),
(65, 65, '200202051234', 'lilly.samuelsson@student.yrkesco.se'),
(66, 66, '200206201234', 'felix.vikstrom@student.yrkesco.se'),
(67, 67, '200204151234', 'elise.ivarsson@student.yrkesco.se'),
(68, 68, '200208301234', 'sebastian.mansson@student.yrkesco.se'),
(69, 69, '200201101234', 'liv.blom@student.yrkesco.se'),
(70, 70, '200205051234', 'jacob.granberg@student.yrkesco.se');

-- Class 8: CS25-2
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(71, 71, '200308201234', 'tuva.melin@student.yrkesco.se'),
(72, 72, '200312151234', 'charlie.ohman@student.yrkesco.se'),
(73, 73, '200310101234', 'ellen.lunden@student.yrkesco.se'),
(74, 74, '200314251234', 'alfred.hallstrom@student.yrkesco.se'),
(75, 75, '200309051234', 'ida.broberg@student.yrkesco.se'),
(76, 76, '200313201234', 'david.fredriksson@student.yrkesco.se'),
(77, 77, '200311151234', 'agnes.gunnarsson@student.yrkesco.se'),
(78, 78, '200315301234', 'melvin.abrahamsson@student.yrkesco.se'),
(79, 79, '200308101234', 'hedda.westin@student.yrkesco.se'),
(80, 80, '200312051234', 'simon.strom@student.yrkesco.se');

-- Class 9: CS26-3
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(81, 81, '200406201234', 'marta.palm@student.yrkesco.se'),
(82, 82, '200410151234', 'gustav.norberg@student.yrkesco.se'),
(83, 83, '200408101234', 'julia.hermansson@student.yrkesco.se'),
(84, 84, '200412251234', 'malte.arvidsson@student.yrkesco.se'),
(85, 85, '200407051234', 'tilde.sundberg@student.yrkesco.se'),
(86, 86, '200411201234', 'otto.edlund@student.yrkesco.se'),
(87, 87, '200409151234', 'svea.falk@student.yrkesco.se'),
(88, 88, '200413301234', 'viggo.ahlstrom@student.yrkesco.se'),
(89, 89, '200406101234', 'celine.bergqvist@student.yrkesco.se'),
(90, 90, '200410051234', 'albert.martinsson@student.yrkesco.se');

-- Class 10: CI24-1
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(91, 91, '200112201234', 'alva.ericson@student.yrkesco.se'),
(92, 92, '200116151234', 'love.hakansson@student.yrkesco.se'),
(93, 93, '200114101234', 'isabelle.andreasson@student.yrkesco.se'),
(94, 94, '200118251234', 'linus.johnsson@student.yrkesco.se'),
(95, 95, '200113051234', 'thea.jonsson@student.yrkesco.se'),
(96, 96, '200117201234', 'erik.kristiansson@student.yrkesco.se'),
(97, 97, '200115151234', 'tilda.fransson@student.yrkesco.se'),
(98, 98, '200119301234', 'andreas.larsson@student.yrkesco.se'),
(99, 99, '200112101234', 'sara.bengtsson@student.yrkesco.se'),
(100, 100, '200116051234', 'martin.holm@student.yrkesco.se');

-- Class 11: CI25-2
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(101, 101, '200210201234', 'sofia.lundstrom@student.yrkesco.se'),
(102, 102, '200214151234', 'daniel.martensson@student.yrkesco.se'),
(103, 103, '200212101234', 'anna.nilsson@student.yrkesco.se'),
(104, 104, '200216251234', 'karl.eriksson@student.yrkesco.se'),
(105, 105, '200211051234', 'lisa.karlsson@student.yrkesco.se'),
(106, 106, '200215201234', 'peter.olofsson@student.yrkesco.se'),
(107, 107, '200213151234', 'eva.sjostrom@student.yrkesco.se'),
(108, 108, '200217301234', 'jonas.persson@student.yrkesco.se'),
(109, 109, '200210101234', 'maria.lindgren@student.yrkesco.se'),
(110, 110, '200214051234', 'johan.andersson@student.yrkesco.se');

-- Class 12: CI26-3
INSERT INTO "StudentInfo" ("student_info_id", "student_id", "social_security_nr", "email") 
VALUES
(111, 111, '200308201234', 'linda.gustavsson@student.yrkesco.se'),
(112, 112, '200312151234', 'mikael.pettersson@student.yrkesco.se'),
(113, 113, '200310101234', 'karin.jakobsson@student.yrkesco.se'),
(114, 114, '200314251234', 'anders.bergstrom@student.yrkesco.se'),
(115, 115, '200309051234', 'helena.hansson@student.yrkesco.se'),
(116, 116, '200313201234', 'fredrik.svensson@student.yrkesco.se'),
(117, 117, '200311151234', 'asa.danielsson@student.yrkesco.se'),
(118, 118, '200315301234', 'lars.johansson@student.yrkesco.se'),
(119, 119, '200308101234', 'annika.karlsson@student.yrkesco.se'),
(120, 120, '200312051234', 'magnus.larsson@student.yrkesco.se');

-- ============================================
-- 15. COURSE-STUDENT RELATIONSHIPS
-- Some students registered for standalone courses
-- ============================================
INSERT INTO "CourseStudent" ("course_student_id", "student_id", "course_id", "reg_date") 
VALUES
(1, 1, 21, '2024-08-15'),  -- Emma takes Project Management
(2, 15, 22, '2024-09-01'), -- Ebba takes Business Communication
(3, 31, 23, '2024-08-20'), -- Alma takes Mathematics for Tech
(4, 45, 24, '2024-09-05'), -- Elsa takes English for IT
(5, 61, 25, '2024-08-25'), -- Linnea takes Entrepreneurship
(6, 75, 21, '2024-09-10'), -- Ida takes Project Management
(7, 91, 22, '2024-08-30'), -- Alva takes Business Communication
(8, 105, 23, '2024-09-15'), -- Lisa takes Mathematics for Tech
(9, 11, 24, '2024-08-18'), -- Ella takes English for IT
(10, 31, 25, '2024-09-12'); -- Alma takes Entrepreneurship

-- ============================================
-- END OF SEED DATA
-- ============================================
-- Summary:
-- - 2 Schools
-- - 6 Companies
-- - 7 Teachers (1 permanent, 6 consultants)
-- - 4 Educational Leaders
-- - 4 Programs (DE, SD, CS, CI)
-- - 12 Classes (3 per program)
-- - 25 Courses (5 per program + 5 standalone)
-- - 120 Students (10 per class)
-- - 10 Standalone course registrations
-- ============================================
