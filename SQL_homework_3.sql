--select * from employees;

--select * from roles;

--select * from salary;

--select * from employee_salary;

--select * from roles_employee;

--Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select E.employee_name , S.monthly_salary 
from employee_salary
join employees E on employee_id = E.id
join salary S on salary_id = S.id;

--Вывести всех работников у которых ЗП меньше 2000.
select E.employee_name
from employee_salary
join employees E on employee_id = E.id
join salary S on salary_id = S.id
where S.monthly_salary < 2000;

--Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary , employees.employee_name 
from employee_salary
left join salary on salary_id = salary.id
left join employees on employee_id = employees.id
where employees.employee_name is null 

--Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary , employees.employee_name 
from employee_salary
left join salary on salary_id = salary.id
left join employees on employee_id = employees.id
where salary.monthly_salary < 2000 and employees.employee_name is null

--Найти всех работников кому не начислена ЗП.
select employees.employee_name , salary.monthly_salary 
from employee_salary
right join employees on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id
where salary.monthly_salary is null;

-- Вывести всех работников с названиями их должности.
select employees.employee_name , roles.role_name
from roles_employee
left join roles on role_id = roles.id
right join employees ON employee_id = employees.id;

--Вывести имена и должность только Java разработчиков.
select employees.employee_name , roles.role_name
from roles_employee
left join roles on role_id = roles.id
right join employees ON employee_id = employees.id
where roles.role_name like '%Java %';

--Вывести имена и должность только Python разработчиков
select employees.employee_name , roles.role_name
from roles_employee
right join employees on employee_id = employees.id
left join roles on role_id = roles.id
where roles.role_name like '%Python%';

--Вывести имена и должность всех QA инженеров.
select employees.employee_name , roles.role_name
from roles_employee
right join employees on employee_id = employees.id
left join roles on role_id = roles.id
where roles.role_name like '%QA%';

--Вывести имена и должность ручных QA инженеров.
select employees.employee_name , roles.role_name
from roles_employee
right join employees on employee_id = employees.id
left join roles on role_id = roles.id
where roles.role_name like '%Manual QA%';

--Вывести имена и должность автоматизаторов QA
select employees.employee_name , roles.role_name 
from roles_employee
right join employees on employee_id = employees.id
left join roles on role_id = roles.id
where roles.role_name like '%Automation%QA%';

--Вывести имена и зарплаты Junior специалистов
select employees.employee_name , salary.monthly_salary 
from employee_salary
left join employees on employee_id = employees.id
left join salary on salary_id = salary.id 
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%';

--Or follow query
--select employees.employee_name , salary.monthly_salary
--from roles_employee
--left join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
--left join salary on employee_salary.salary_id = salary.id
--left join roles on role_id = roles.id
--left join employees on roles_employee.employee_id = employees.id
--where role_name like '%Junior%' and salary.monthly_salary > 0

--Вывести имена и зарплаты Middle специалистов
select employees.employee_name , salary.monthly_salary 
from employee_salary
left join employees on employee_id = employees.id
left join salary on salary_id = salary.id 
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';

--Вывести имена и зарплаты Senior специалистов
select employees.employee_name , salary.monthly_salary 
from employee_salary
left join employees on employee_id = employees.id
left join salary on salary_id = salary.id 
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where role_name like '%Senior%';

--Вывести зарплаты Java разработчиков
select salary.monthly_salary
from roles_employee
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
left join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Java%';

--Вывести зарплаты Python разработчиков
select salary.monthly_salary
from roles_employee
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
left join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Python%';

-- Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name , salary.monthly_salary
from roles_employee
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
left join roles on roles_employee.role_id = roles.id
left join employees on employee_salary.employee_id = employees.id
where roles.role_name like '%Junior%Python%';

-- Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name , salary.monthly_salary
from roles_employee
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
left join roles on roles_employee.role_id = roles.id
left join employees on employee_salary.employee_id = employees.id
where roles.role_name like '%Middle%JavaScript%';

--Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name , salary.monthly_salary
from roles_employee
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
left join roles on roles_employee.role_id = roles.id
left join employees on employee_salary.employee_id = employees.id
where roles.role_name like '%Senior%Java %';

--Вывести зарплаты Junior QA инженеров
select salary.monthly_salary
from roles_employee
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
left join roles on roles_employee.role_id = roles.id
left join employees on employee_salary.employee_id = employees.id
where roles.role_name like '%Junior%QA%';

--Вывести среднюю зарплату всех Junior специалистов
Select avg(salary.monthly_salary)
from employee_salary
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join roles on roles_employee.role_id = roles.id 
left join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%';

--Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary)
from employee_salary
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join roles on roles_employee.role_id = roles.id 
left join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%JavaScript%';

--Вывести минимальную ЗП QA инженеров
select min(salary.monthly_salary)
from employee_salary
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join roles on roles_employee.role_id = roles.id 
left join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%QA%';

--Вывести максимальную ЗП QA инженеров
select max(salary.monthly_salary)
from roles_employee 
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
left join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%QA%'

--Вывести количество QA инженеров
select count(roles.role_name)
from roles_employee 
left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';


--Вывести количество QA инженеров вариант №2
select count(roles.role_name)
from employee_salary
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';


--Вывести количество Middle специалистов.
select count(roles.role_name)
from roles_employee 
left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Middle%';

--Вывести количество Middle специалистов вариант №2
select count(roles.role_name)
from employee_salary
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Middle%';

--Вывести количество разработчиков
select count(roles.role_name) , roles.role_name
from roles_employee 
left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%developer%'
group by roles.role_name;

--Вывести количество разработчиков вариант №2
select count(roles.role_name) , roles.role_name
from employee_salary
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%developer%'
group by roles.role_name;

--Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary)
from employee_salary
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join roles on roles_employee.role_id = roles.id 
left join salary on employee_salary.salary_id = salary.id 
where roles.role_name like '%developer%'

--Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name , roles.role_name , salary.monthly_salary
from employee_salary
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
left join salary on employee_salary.salary_id = salary.id
left join employees on employee_salary.employee_id = employees.id
order by salary.monthly_salary asc;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name , roles.role_name , salary.monthly_salary
from employee_salary
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
left join salary on employee_salary.salary_id = salary.id
left join employees on employee_salary.employee_id = employees.id
where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary asc;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name , roles.role_name , salary.monthly_salary
from employee_salary
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
left join salary on employee_salary.salary_id = salary.id
left join employees on employee_salary.employee_id = employees.id
where salary.monthly_salary <2300
order by salary.monthly_salary asc;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name , roles.role_name , salary.monthly_salary
from employee_salary
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
left join salary on employee_salary.salary_id = salary.id
left join employees on employee_salary.employee_id = employees.id
where salary.monthly_salary in (1100, 1500, 2000)
order by salary.monthly_salary asc;