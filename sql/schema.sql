CREATE TABLE "StudentInfo" (
  "student_info_id" INTEGER PRIMARY KEY,
  "student_id" INTEGER NOT NULL,
  "social_security_nr" VARCHAR(13),
  "email" VARCHAR(100)
);

CREATE TABLE "Student" (
  "student_id" INTEGER PRIMARY KEY,
  "class_id" INTEGER NOT NULL,
  "first_name" VARCHAR(50) NOT NULL,
  "last_name" VARCHAR(50) NOT NULL
);

CREATE TABLE "Class" (
  "class_id" INTEGER PRIMARY KEY,
  "school_id" INTEGER NOT NULL,
  "program_id" INTEGER NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "start_year" INTEGER NOT NULL,
  "cohort" SMALLINT NOT NULL
);

CREATE TABLE "School" (
  "school_id" INTEGER PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "address" VARCHAR(50) NOT NULL
);

CREATE TABLE "ProgramSchool" (
  "program_school_id" INTEGER PRIMARY KEY,
  "school_id" INTEGER NOT NULL,
  "program_id" INTEGER NOT NULL
);

CREATE TABLE "Program" (
  "program_id" INTEGER PRIMARY KEY,
  "edulead_id" INTEGER NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "code" VARCHAR(10) NOT NULL
);

CREATE TABLE "CourseProgram" (
  "course_program_id" INTEGER PRIMARY KEY,
  "course_id" INTEGER NOT NULL,
  "program_id" INTEGER NOT NULL
);

CREATE TABLE "Course" (
  "course_id" INTEGER PRIMARY KEY,
  "teacher_id" INTEGER NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "code" VARCHAR(10) NOT NULL,
  "points" INTEGER NOT NULL,
  "description" VARCHAR(500) NOT NULL
);

CREATE TABLE "CourseStudent" (
  "course_student_id" INTEGER PRIMARY KEY,
  "student_id" INTEGER NOT NULL,
  "course_id" INTEGER NOT NULL,
  "reg_date" DATE NOT NULL
);

CREATE TABLE "EduLead" (
  "edulead_id" INTEGER PRIMARY KEY,
  "teacher_id" INTEGER NOT NULL,
  "start_date" DATE NOT NULL
);

CREATE TABLE "Teacher" (
  "teacher_id" INTEGER PRIMARY KEY,
  "first_name" VARCHAR(50) NOT NULL,
  "last_name" VARCHAR(50) NOT NULL,
  "contract_type" VARCHAR(50) NOT NULL CHECK (contract_type IN ('consultant', 'permanent_hire')),
  "hire_date" DATE NOT NULL
);

CREATE TABLE "TeacherInfo" (
  "teacher_info_id" INTEGER PRIMARY KEY,
  "teacher_id" INTEGER NOT NULL,
  "social_security_nr" VARCHAR(13),
  "email" VARCHAR(100)
);

CREATE TABLE "Consultant" (
  "consultant_id" INTEGER PRIMARY KEY,
  "teacher_id" INTEGER NOT NULL,
  "company_id" INTEGER NOT NULL,
  "hourly_rate" FLOAT
);

CREATE TABLE "PermanentHire" (
  "permanent_hire_id" INTEGER PRIMARY KEY,
  "teacher_id" INTEGER NOT NULL,
  "monthly_salary" FLOAT
);

CREATE TABLE "Company" (
  "company_id" INTEGER PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "org_nr" VARCHAR(11) NOT NULL,
  "address" VARCHAR(200) NOT NULL,
  "f_tax" BOOLEAN
);

CREATE UNIQUE INDEX ON "StudentInfo" ("student_id", "social_security_nr", "email");

CREATE UNIQUE INDEX ON "ProgramSchool" ("program_id", "school_id");

CREATE UNIQUE INDEX ON "Program" ("code");

CREATE UNIQUE INDEX ON "CourseProgram" ("program_id", "course_id");

CREATE UNIQUE INDEX ON "Course" ("code");

CREATE UNIQUE INDEX ON "CourseStudent" ("student_id", "course_id");

CREATE UNIQUE INDEX ON "EduLead" ("teacher_id");

CREATE UNIQUE INDEX ON "TeacherInfo" ("teacher_id", "social_security_nr", "email");

CREATE UNIQUE INDEX ON "Consultant" ("teacher_id");

CREATE UNIQUE INDEX ON "PermanentHire" ("teacher_id");

CREATE UNIQUE INDEX ON "Company" ("org_nr");

COMMENT ON COLUMN "Teacher"."contract_type" IS 'must be either ''consultant'' or ''permanent_hire''';

ALTER TABLE "StudentInfo" ADD FOREIGN KEY ("student_id") REFERENCES "Student" ("student_id");

ALTER TABLE "Student" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "ProgramSchool" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "ProgramSchool" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "Program" ADD FOREIGN KEY ("edulead_id") REFERENCES "EduLead" ("edulead_id");

ALTER TABLE "CourseProgram" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "CourseProgram" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "Course" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "CourseStudent" ADD FOREIGN KEY ("student_id") REFERENCES "Student" ("student_id");

ALTER TABLE "CourseStudent" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "EduLead" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "TeacherInfo" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("company_id") REFERENCES "Company" ("company_id");

ALTER TABLE "PermanentHire" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");
