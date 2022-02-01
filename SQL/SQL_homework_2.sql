-- создаем таблицу employees
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
	);

-- Наполнить таблицу employee 70 строками
insert into employees (employee_name)
values ('William Shakespeare'),
('J.R.R Tolkien'),
('George Orwell'),
('Charles Dickens'),
('Leo Tolstoy'),
('Jane Austen'),
('Ernest Hemingway'),
('Homer'),
('John Steinbeck'),
('James Joyce'),
('Mark Twain'),
('Alexandre Dumas'),
('Vladimir Nabokov'),
('F. Scott Fitzgerald Scott Titzgerald'),
('Robert Frost'),
('Virgil'),
('William Wordsworth'),
('Oscar Wilde'),
('C.S. LewisS Tewis'),
('Garcia Tarquez'),
('Victor Hugo'),
('J.K. RowlingK Towling'),
('Allan Toe'),
('Virginia Woolf'),
('Emily Dickinson'),
('D. H. Lawrence H Tawrence'),
('Walt Whitman'),
('George Eliot'),
('Marcel Proust'),
('Albert Camus'),
('J.D. SalingerD Talinger'),
('Fyodor Dostoevsky'),
('Thomas Hardy'),
('Joseph Heller'),
('Salman Rushdie'),
('Charlotte Bronte'),
('Douglas Adams'),
('Emily Bronte'),
('W. Somerset Maugham Somerset Taugham'),
('Honore de Balzac'),
('Khalid Hosseini'),
('Toni Morrison'),
('Agatha Christie'),
('Ayn Rand'),
('Joseph Conrad'),
('Evelyn Waugh'),
('William Faulkner'),
('John Updike'),
('Dante Alighieri'),
('Franz Kafka'),
('Edith Wharton'),
('Wolfgang Toethe'),
('Henry Miller'),
('Butler Teats'),
('Aldous Huxley'),
('Paulo Coelho'),
('Luis Torges'),
('Marcus Aurelius'),
('Jack London'),
('David Thoreau'),
('Thomas Mann'),
('Graham Greene'),
('George R.RR Tartin'),
('Jules Verne'),
('Jack Kerouac'),
('Paul Tarte'),
('Agatha Christie'),
('Hunter S. ThompsonS Thompson'),
('William Blake'),
('Maya Angelou');

--Создать таблицу salary
create table salary (
	id serial primary key,
	monthly_salary int not null
);

--Наполнить таблицу salary 15 строками
insert into salary (monthly_salary)
values 	(1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);

--Создать таблицу employee_salary
create table employee_salary(
	id serial primary key,
	employee_id int unique not null, 
	salary_id int not null
);

--Наполнить таблицу employee_salary 40 строками:
insert into employee_salary (employee_id, salary_id)
values	(1, 2),
		(2, 3),
		(3, 4),
		(4, 5),
		(5, 6),
		(6, 7),
		(7, 2),
		(8, 1),
		(9, 4),
		(10, 2),
		(11, 11),
		(12, 12),
		(13, 3),
		(14, 4),
		(15, 15),
		(16, 4),
		(17, 4),
		(18, 10),
		(19, 5),
		(20, 14),
		(21, 4),
		(22, 6),
		(23, 9),
		(24, 4),
		(25, 2),
		(26, 1),
		(50, 2),
		(33, 10),
		(44, 11),
		(32, 8),
		(71, 2),
		(73, 3),
		(77, 10),
		(80, 4),
		(100, 2),
		(90, 5),
		(81, 3),
		(92, 4),
		(74, 10),
		(78, 1);

--Создать таблицу roles
create table roles (
	id serial primary key,
	role_name int unique not null
);

--Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name type varchar(30) using role_name::varchar(30);

--Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values	('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

	
--Создать таблицу roles_employee
create table roles_employee(
	id serial primary key,
	employee_id int unique not null,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

--Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values	(23, 2),
		(3, 4),
		(70, 4),
		(4, 4),
		(12, 20),
		(22, 7),
		(24, 9),
		(11, 2),
		(69, 4),
		(13, 15),
		(14, 14),
		(15, 11),
		(16, 18),
		(5, 19),
		(65, 5),
		(44, 14),
		(43, 1),
		(45, 3),
		(47, 6),
		(48, 8),
		(49, 9),
		(50, 10),
		(1, 2),
		(51, 13),
		(52, 14),
		(53, 15),
		(54, 16),
		(55, 17),
		(56, 18),
		(57, 19),
		(58, 20),
		(59, 1),
		(60, 2),
		(33, 5),
		(61, 7),
		(62, 9),
		(63, 11),
		(64, 13),
		(67, 14),
		(66, 16);