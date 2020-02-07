SELECT "e"."emp_no", "e"."last_Name", "e"."first_Name", "e"."gender", "s"."salary"
FROM "employees" "e"
JOIN "salaries" "s"
ON ("e"."emp_no" = "s"."emp_no")
;


