--select * from employees;
--select * from roles;
--select * from salary;
--select * from employee_salary;
--select * from roles_employee;

--1.Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select E.employee_name , S.monthly_salary 
from employee_salary
join employees E on employee_id = E.id
join salary S on salary_id = S.id

--2.Вывести всех работников у которых ЗП меньше 2000.
select E.employee_name
from employee_salary
join employees E on employee_id = E.id
join salary S on salary_id = S.id
where S.monthly_salary < 2000;

--3.Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.monthly_salary
from salary s 
left join employee_salary es on s.id = es.salary_id
where employee_id is null;


--4.Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.monthly_salary
from salary as s
left join employee_salary as es on s.id = es.salary_id
where s.monthly_salary < 2000
and employee_id is null;

--5.Найти всех работников кому не начислена ЗП.
select e.employee_name
from employees as e
left join employee_salary as es on e.id = es.employee_id 
where es.employee_id is null;

--6.Вывести всех работников с названиями их должности.
select e.employee_name , r.role_name
from roles_employee
right join employees as e ON employee_id = e.id
left join roles as r on role_id = r.id;

--7.Вывести имена и должность только Java разработчиков.
select e.employee_name , r.role_name
from roles_employee
right join employees as e ON employee_id = e.id
left join roles as r on role_id = r.id
where r.role_name like '%Java %';

--8.Вывести имена и должность только Python разработчиков
select e.employee_name , r.role_name
from roles_employee
right join employees as e on employee_id = e.id
left join roles as r on role_id = r.id
where r.role_name like '%Python%';

--9.Вывести имена и должность всех QA инженеров.
select e.employee_name , r.role_name
from roles_employee
right join employees as e on employee_id = e.id
left join roles as r on role_id = r.id
where r.role_name like '%QA%';

--10.Вывести имена и должность ручных QA инженеров.
select e.employee_name , r.role_name
from roles_employee
right join employees as e on employee_id = e.id
left join roles as r on role_id = r.id
where r.role_name like '%Manual QA%';

--11.Вывести имена и должность автоматизаторов QA
select e.employee_name , r.role_name 
from roles_employee
right join employees as e on employee_id = e.id
left join roles as r on role_id = r.id
where r.role_name like '%Automation%QA%';

--12.Вывести имена и зарплаты Junior специалистов
select e.employee_name , s.monthly_salary 
from employee_salary as es
right join employees as e on es.employee_id = e.id
left join salary as s on salary_id = s.id 
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Junior%';


--13.Вывести имена и зарплаты Middle специалистов
select e.employee_name , s.monthly_salary 
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Middle%';

--14.Вывести имена и зарплаты Senior специалистов
select e.employee_name , s.monthly_salary 
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Senior%';

--15.Вывести зарплаты Java разработчиков
select s.monthly_salary 
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Java %';

--16.Вывести зарплаты Python разработчиков
select s.monthly_salary 
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Python%';

--17.Вывести имена и зарплаты Junior Python разработчиков
select e.employee_name , s.monthly_salary 
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Junior%Python%';

--18.Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name , s.monthly_salary 
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Middle%JavaScript%';

--19.Вывести имена и зарплаты Senior Java разработчиков
select e.employee_name , s.monthly_salary 
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es	.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Senior%Java %';

--20.Вывести зарплаты Junior QA инженеров
select s.monthly_salary 
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es	.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where r.role_name like '%Junior%QA%';

--21.Вывести среднюю зарплату всех Junior специалистов
select avg(s.monthly_salary)
from salary as s
left join employee_salary as es on s.id = es.salary_id
left join roles_employee as re on es.employee_id = re.employee_id 
left join roles as r on re.role_id = r.id
where r.role_name like '%Junior%';


--22.Вывести сумму зарплат JS разработчиков
select sum(s.monthly_salary)
from salary as s
left join employee_salary as es on s.id = es.salary_id
left join roles_employee as re on es.employee_id = re.employee_id 
left join roles as r on re.role_id = r.id
where r.role_name like '%JavaScript%';

--23.Вывести минимальную ЗП QA инженеров
select min(s.monthly_salary)
from salary as s
left join employee_salary as es on s.id = es.salary_id
left join roles_employee as re on es.employee_id = re.employee_id 
left join roles as r on re.role_id = r.id
where r.role_name like '%QA%';

--24.Вывести максимальную ЗП QA инженеров
select max(s.monthly_salary)
from salary as s
left join employee_salary as es on s.id = es.salary_id
left join roles_employee as re on es.employee_id = re.employee_id 
left join roles as r on re.role_id = r.id
where r.role_name like '%QA%';

--25.Вывести количество QA инженеров
select count(r.role_name)
from roles as r
left join roles_employee as re on r.id = re.role_id 
where r.role_name like '%QA%' and re.employee_id is not null


--26.Вывести количество Middle специалистов.
select count(r.role_name)
from roles as r
left join roles_employee as re on r.id = re.role_id 
where r.role_name like '%Middle%' and re.employee_id is not null

--27.Вывести количество разработчиков
select count(r.role_name)
from roles as r
left join roles_employee as re on r.id = re.role_id 
where r.role_name like '%developer%' and re.employee_id is not null


--28.Вывести фонд (сумму) зарплаты разработчиков.
select sum(s.monthly_salary)
from employee_salary as es
left join roles_employee as re on es.employee_id = re.employee_id 
left join roles as r on re.role_id = r.id 
left join salary as s on es.salary_id = s.id 
where r.role_name like '%developer%'

--29.Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name , r.role_name , s.monthly_salary
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
order by s.monthly_salary;

--30.Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name , r.role_name , s.monthly_salary
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where s.monthly_salary between 1700 and 2300
order by s.monthly_salary;

--31.Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name , r.role_name , s.monthly_salary
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where s.monthly_salary < 2300
order by s.monthly_salary;

--32.Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name , r.role_name , s.monthly_salary
from employees as e
left join employee_salary as es on e.id = es.employee_id
left join salary as s on es.salary_id = s.id
left join roles_employee as re on e.id = re.employee_id
left join roles as r on re.role_id = r.id
where s.monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary;
