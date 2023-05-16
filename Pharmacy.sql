-- Adminer 4.8.1 MySQL 5.7.36-39 dump

--Полный дамп БД со всеми данными и взаимосвязями внутри таблиц

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

--Структура таблицы `Customers`

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Имя покупателя',
  `address` varchar(255) DEFAULT NULL COMMENT 'Адрес покупателя',
  `phone` varchar(20) DEFAULT NULL COMMENT 'Телефон покупателя',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Заполенение таблицы `Customers` данными 

INSERT INTO `Customers` (`id`, `name`, `address`, `phone`) VALUES
(1,	'Иванов Иван Иванович',	'ул. Ленина, д. 10',	'+7 (111) 111-11-11'),
(2,	'Петров Петр Петрович',	'ул. Пушкина, д. 5',	'+7 (222) 222-22-22'),
(3,	'Сидорова Ольга Владимировна',	'ул. Гагарина, д. 15',	'+7 (333) 333-33-33'),
(4,	'Козлова Анна Михайловна',	'ул. Советская, д. 12',	'+7 (777) 777-77-77'),
(5,	'Николаева Елена Ивановна',	'ул. Мира, д. 8',	'+7 (888) 888-88-88'),
(6,	'Иванова Екатерина Васильевна',	'ул. Ленина, д. 5',	'+7 (999) 999-99-99'),
(7,	'Петрова Ольга Александровна',	'ул. Пушкина, д. 7',	'+7 (101) 101-10-10'),
(8,	'Сидоров Андрей Сергеевич',	'ул. Гагарина, д. 2',	'+7 (202) 202-20-20'),
(9,	'Кузнецов Виктор Владимирович',	'ул. Ленина, д. 15',	'+7 (303) 303-30-30'),
(10,	'Смирнов Максим Игоревич',	'ул. Пушкина, д. 20',	'+7 (404) 404-40-40'),
(11,	'Иванов Петр Николаевич',	'ул. Гагарина, д. 10',	'+7 (505) 505-50-50'),
(12,	'Петров Сергей Иванович',	'ул. Советская, д. 5',	'+7 (606) 606-60-60');

--Структура таблицы `Employees`

DROP TABLE IF EXISTS `Employees`;
CREATE TABLE `Employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Имя сотрудника',
  `position` varchar(100) DEFAULT NULL COMMENT 'Должность сотрудника',
  `salary` decimal(10,2) DEFAULT NULL COMMENT 'Зарплата сотрудника',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Заполенение таблицы `Employees` данными 

INSERT INTO `Employees` (`id`, `name`, `position`, `salary`) VALUES
(1,	'Смирнова Екатерина Владимировна',	'Фармацевт',	50000.00),
(2,	'Иванова Наталья Сергеевна',	'Менеджер по продажам',	60000.00),
(3,	'Петров Сергей Александрович',	'Директор',	100000.00),
(4,	'Кузнецова Анастасия Александровна',	'Уборщица',	22000.00),
(5,	'Сидоров Илья Викторович',	'Фармацевт',	50000.00);

--Структура таблицы `Medicines`

DROP TABLE IF EXISTS `Medicines`;
CREATE TABLE `Medicines` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Название лекарства',
  `type_id` int(11) DEFAULT NULL COMMENT 'ID типа лекарства',
  `supplier_id` int(11) DEFAULT NULL COMMENT 'ID поставщика',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Цена лекарства',
  `quantity` int(11) DEFAULT NULL COMMENT 'Количество лекарства на складе',
  PRIMARY KEY (`id`),
  KEY `fk_supplier` (`supplier_id`),
  KEY `fk_medicine_type` (`type_id`),
  CONSTRAINT `fk_medicine_type` FOREIGN KEY (`type_id`) REFERENCES `MedicineTypes` (`id`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Заполенение таблицы `Medicines` данными 

INSERT INTO `Medicines` (`id`, `name`, `type_id`, `supplier_id`, `price`, `quantity`) VALUES
(1,	'Анальгин',	1,	1,	50.00,	100),
(2,	'Аспирин',	1,	1,	40.00,	50),
(3,	'Амоксициллин',	2,	2,	150.00,	20),
(4,	'Цитрамон',	1,	1,	30.00,	200),
(5,	'Витамин С',	3,	3,	20.00,	300),
(6,	'Нурофен',	1,	1,	70.00,	80),
(7,	'Флюдан',	4,	2,	120.00,	30),
(8,	'Низорал',	5,	3,	220.00,	50),
(9,	'Корвалол',	3,	1,	45.00,	100),
(10,	'Ринтон',	2,	2,	85.00,	40),
(11,	'Окомистин',	8,	3,	110.00,	20),
(12,	'Левомицетин',	2,	2,	65.00,	50),
(13,	'Фуразолидон',	2,	1,	80.00,	40),
(14,	'Ципрофлоксацин',	2,	3,	150.00,	30),
(15,	'Дексаметазон',	1,	2,	120.00,	60),
(16,	'Детралекс',	6,	2,	250.00,	20),
(17,	'Эргоферон',	4,	1,	180.00,	30),
(18,	'Тавегил',	7,	3,	55.00,	100),
(19,	'Аспаркам',	6,	3,	120.00,	50);

--Структура таблицы `MedicineTypes`

DROP TABLE IF EXISTS `MedicineTypes`;
CREATE TABLE `MedicineTypes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'Название типа лекарств',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Заполенение таблицы `MedicineTypes` данными 

INSERT INTO `MedicineTypes` (`id`, `name`) VALUES
(1,	'Анальгетик'),
(2,	'Антибиотик'),
(3,	'Витамин'),
(4,	'Противовирусный'),
(5,	'Противогрибковый'),
(6,	'Кардиопрепарат'),
(7,	'Антисептик'),
(8,	'Для глаз');

--Структура таблицы `Prescriptions`

DROP TABLE IF EXISTS `Prescriptions`;
CREATE TABLE `Prescriptions` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL COMMENT 'ID покупателя',
  `medicine_id` int(11) DEFAULT NULL COMMENT 'ID лекарства',
  `employee_id` int(11) DEFAULT NULL COMMENT 'ID сотрудника',
  `date` date DEFAULT NULL COMMENT 'Дата выписки рецепта',
  `quantity` int(11) DEFAULT NULL COMMENT 'Количество лекарства в рецепте',
  PRIMARY KEY (`id`),
  KEY `FK_Prescriptions_Customers` (`customer_id`),
  KEY `FK_Prescriptions_Medicines` (`medicine_id`),
  KEY `FK_Prescriptions_Employees` (`employee_id`),
  CONSTRAINT `FK_Prescriptions_Customers` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`id`),
  CONSTRAINT `FK_Prescriptions_Employees` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`id`),
  CONSTRAINT `FK_Prescriptions_Medicines` FOREIGN KEY (`medicine_id`) REFERENCES `Medicines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Заполенение таблицы `Prescriptions` данными 

INSERT INTO `Prescriptions` (`id`, `customer_id`, `medicine_id`, `employee_id`, `date`, `quantity`) VALUES
(1,	1,	1,	1,	'2023-05-10',	2),
(2,	2,	2,	1,	'2023-05-11',	1),
(3,	3,	3,	1,	'2023-05-12',	3),
(4,	1,	4,	1,	'2023-05-13',	2),
(5,	2,	5,	1,	'2023-05-14',	1);

--Структура таблицы `Sales`

DROP TABLE IF EXISTS `Sales`;
CREATE TABLE `Sales` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL COMMENT 'ID покупателя',
  `medicine_id` int(11) DEFAULT NULL COMMENT 'ID лекарства',
  `employee_id` int(11) DEFAULT NULL COMMENT 'ID сотрудника',
  `date` date DEFAULT NULL COMMENT 'Дата продажи',
  `quantity` int(11) DEFAULT NULL COMMENT 'Количество проданного лекарства',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Цена проданного лекарства',
  PRIMARY KEY (`id`),
  KEY `fk_customer` (`customer_id`),
  KEY `fk_medicine` (`medicine_id`),
  KEY `fk_employee` (`employee_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`id`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`id`),
  CONSTRAINT `fk_medicine` FOREIGN KEY (`medicine_id`) REFERENCES `Medicines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Заполенение таблицы `Sales` данными 

INSERT INTO `Sales` (`id`, `customer_id`, `medicine_id`, `employee_id`, `date`, `quantity`, `price`) VALUES
(1,	1,	1,	5,	'2021-01-01',	3,	150.00),
(2,	2,	2,	1,	'2021-01-02',	2,	80.00),
(3,	3,	3,	1,	'2021-01-02',	1,	150.00),
(4,	4,	4,	5,	'2021-01-03',	5,	150.00),
(5,	5,	5,	1,	'2021-01-03',	10,	200.00),
(6,	6,	6,	1,	'2021-01-03',	2,	140.00),
(7,	7,	7,	1,	'2021-01-04',	1,	120.00),
(8,	8,	8,	5,	'2021-01-04',	2,	440.00),
(9,	9,	9,	1,	'2021-01-05',	3,	135.00),
(10,	10,	10,	1,	'2021-01-05',	5,	425.00),
(11,	11,	11,	1,	'2021-01-05',	4,	440.00),
(12,	12,	12,	1,	'2021-01-06',	3,	195.00),
(13,	1,	13,	1,	'2021-01-06',	1,	80.00),
(14,	2,	14,	1,	'2021-01-07',	3,	450.00),
(15,	3,	15,	1,	'2021-01-07',	2,	240.00),
(16,	4,	16,	1,	'2021-01-08',	1,	250.00),
(17,	5,	17,	1,	'2021-01-08',	1,	180.00),
(18,	6,	18,	1,	'2021-01-08',	4,	220.00),
(19,	7,	19,	1,	'2021-01-09',	2,	240.00),
(20,	8,	1,	5,	'2021-01-09',	10,	500.00),
(21,	9,	2,	1,	'2021-01-09',	6,	240.00),
(22,	10,	3,	1,	'2021-01-10',	1,	150.00),
(23,	11,	4,	1,	'2021-01-10',	8,	240.00),
(24,	12,	5,	1,	'2021-01-10',	4,	400.00),
(25,	1,	6,	5,	'2021-01-11',	2,	140.00),
(26,	2,	7,	1,	'2021-01-11',	1,	120.00),
(27,	3,	8,	1,	'2021-01-12',	3,	660.00),
(28,	4,	9,	1,	'2021-01-12',	2,	90.00),
(29,	5,	10,	1,	'2021-01-13',	5,	425.00),
(30,	6,	11,	5,	'2021-01-13',	1,	110.00);

--Структура таблицы `Suppliers`

DROP TABLE IF EXISTS `Suppliers`;
CREATE TABLE `Suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Название поставщика',
  `address` varchar(255) DEFAULT NULL COMMENT 'Адрес поставщика',
  `phone` varchar(20) DEFAULT NULL COMMENT 'Телефон поставщика',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Заполенение таблицы `Suppliers` данными 

INSERT INTO `Suppliers` (`id`, `name`, `address`, `phone`) VALUES
(1,	'ООО \"Ригафарм\"',	'ул. Пушкина, д. 20',	'+7 (444) 444-44-44'),
(2,	'ООО \"Фармстандарт\"',	'ул. Гагарина, д. 25',	'+7 (555) 555-55-55'),
(3,	'ООО \"Фарм-Хим\"',	'ул. Ленина, д. 30',	'+7 (666) 666-66-66');

-- 2023-05-16 14:42:48