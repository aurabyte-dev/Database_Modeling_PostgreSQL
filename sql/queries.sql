
-- ==============================================================
-- PART 1: INSERT VALIDATION (test database constrains)
-- ==============================================================


-- TEST 1: STUDENT TABLE
-- Testing: PRIMARY KEY, FOREIGN KEY, NOT NULL
-- ============================================

-- SUCCESSFUL INSERTS

INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") VALUES
(121, 1, 'Anna', 'Andersson'),
(122, 1, 'Björn', 'Borg'),
(123, 1, 'Calle', 'Carlqvist');


-- FAILING INSERTS

-- Fail 1: Duplicate PRIMARY KEY
-- Will fail because student_id 121 already exists (inserted above)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") VALUES
(121, 1, 'Anna', 'Andersson');


-- Fail 2: FOREIGN KEY violation
-- This will fail because class_id 300 does not exist in Class table
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") VALUES
(124, 300, 'Invalid', 'Class');


-- Fail 3: NOT NULL violation
-- This will fail because first_name is required (NOT NULL)
INSERT INTO "Student" ("student_id", "class_id", "first_name", "last_name") VALUES
(125, 1, NULL, 'Dalqvist');



-- TEST 2: TEACHER TABLE
-- Testing: PRIMARY KEY, CHECK constraint, NOT NULL
-- ============================================

-- SUCCESSFUL INSERTS

INSERT INTO "Teacher" ("teacher_id", "first_name", "last_name", "contract_type", "hire_date") VALUES
(8, 'Elin', 'Ericsson', 'consultant', '2023-01-15'),
(9, 'Felix', 'Farm', 'permanent_hire', '2024-02-10'),
(10, 'Gustav', 'Gunnarsson', 'consultant', '2024-05-10');


-- FAILING INSERTS

-- Fail 1: CHECK constraint violation
-- This will fail because 'freelancer' is not a valid contract_type
INSERT INTO "Teacher" ("teacher_id", "first_name", "last_name", "contract_type", "hire_date") VALUES
(11, 'Hilma', 'Haus', 'freelancer', '2024-04-01');


-- Fail 2: CHECK constraint violation
-- This will fail because 'full-time' is not valid (must be 'permanent_hire')
INSERT INTO "Teacher" ("teacher_id", "first_name", "last_name", "contract_type", "hire_date") VALUES
(12, 'Ingvar', 'Illander', 'full-time', '2025-05-01');


-- Fail 3: NOT NULL violation
-- This will fail because contract_type is required (NOT NULL)
INSERT INTO "Teacher" ("teacher_id", "first_name", "last_name", "contract_type", "hire_date") VALUES
(13, 'Jan', 'Jansson', NULL, '2023-06-01');




-- TEST 3: COURSESTUDENT TABLE (bridge Table)
-- Testing: PRIMARY KEY, FOREIGN KEY (multiple), UNIQUE composite
-- ============================================

-- SUCCESSFUL INSERTS

INSERT INTO "CourseStudent" ("course_student_id", "student_id", "course_id", "reg_date") VALUES
(11, 1, 22, '2024-09-20'), 
(12, 2, 23, '2024-09-21'),  
(13, 3, 24, '2024-09-22');  


-- FAILING INSERTS

-- Fail 1: FOREIGN KEY violation (invalid student_id)
-- This will fail because student_id 920 does not exist
INSERT INTO "CourseStudent" ("course_student_id", "student_id", "course_id", "reg_date") VALUES
(14, 920, 21, '2024-09-23');


-- Fail 2: FOREIGN KEY violation (invalid course_id)
-- This will fail because course_id 450 does not exist
INSERT INTO "CourseStudent" ("course_student_id", "student_id", "course_id", "reg_date") VALUES
(15, 4, 450, '2024-09-24');


-- Fail 3: UNIQUE constraint violation (composite)
-- This will fail because student 1 is already registered for course 22 (row 11 above). The UNIQUE constraint on (student_id, course_id) prevents duplicate registrations.
INSERT INTO "CourseStudent" ("course_student_id", "student_id", "course_id", "reg_date") VALUES
(16, 1, 22, '2024-09-25');



-- ============================================
-- PART 2: JOIN OPERATIONS (to demonstrate that table relationships work correctly)
-- ============================================



-- QUERY 1: CLASS INFORMATION (JOINs across 6 tables)
-- ===================================================
-- Question: For a specific class (DE24-1), show the following:
-- - Class details (name, year, cohort)
-- - School (location)
-- - Which program it belongs to
-- - The Educational Leader
-- - The courses that are in the program


SELECT 
    -- Class 
    c.name AS class_name,
    c.start_year,
    c.cohort,
    
    -- School 
    s.name AS school_name,
    s.address AS school_address,
    
    -- Program 
    p.name AS program_name,
    p.code AS program_code,
    
    -- Educational Leader 
    t.first_name AS edulead_first_name,
    t.last_name AS edulead_last_name,
    
    -- Count of courses in program
    COUNT(DISTINCT co.course_id) AS total_courses_in_program

FROM "Class" c
    -- Join to get school info
    JOIN "School" s ON c.school_id = s.school_id
    
    -- Join to get program info
    JOIN "Program" p ON c.program_id = p.program_id
    
    -- Join to get educational leader info
    JOIN "EduLead" el ON p.edulead_id = el.edulead_id
    JOIN "Teacher" t ON el.teacher_id = t.teacher_id
    
    -- Join to get courses in the program
    LEFT JOIN "CourseProgram" cp ON p.program_id = cp.program_id
    LEFT JOIN "Course" co ON cp.course_id = co.course_id

WHERE c.name = 'DE24'  -- Looking at Data Engineering 2024

GROUP BY 
    c.class_id, c.name, c.start_year, c.cohort,
    s.school_id, s.name, s.address,
    p.program_id, p.name, p.code,
    t.teacher_id, t.first_name, t.last_name;




-- QUERY 2: CONSULTANT TEACHERS (JOINs across 4 tables)
-- =====================================================
-- Question: Show the following for all consultant teachers:
-- which company they work for
-- their hourly rate
-- what courses they teach


SELECT 
    -- Teacher information
    t.first_name,
    t.last_name,
    t.hire_date,
    
    -- Consultant contract details
    con.hourly_rate,
    
    -- Company information
    comp.name AS company_name,
    comp.org_nr AS company_org_number,
    
    -- Course information
    c.name AS course_name,
    c.code AS course_code,
    c.points AS course_points

FROM "Teacher" t
    -- Join to get consultant contract info
    JOIN "Consultant" con ON t.teacher_id = con.teacher_id
    
    -- Join to get company info
    JOIN "Company" comp ON con.company_id = comp.company_id
    
    -- Join to get courses taught by this teacher
    LEFT JOIN "Course" c ON t.teacher_id = c.teacher_id

WHERE t.contract_type = 'consultant'  -- Only consultant teachers

ORDER BY 
    t.last_name, 
    t.first_name, 
    c.name;