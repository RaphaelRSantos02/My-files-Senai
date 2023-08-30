
select *from employees e 
join salaries s on e.emp_no = s.emp_no
join titles t on e.emp_no = t.emp_no;


select e.emp_no, e.first_name, count(*) as NoOFTitles from employees e
join titles t on e.emp_no = t.emp_no
group by t.emp_no having NoOFTitles > 1;



