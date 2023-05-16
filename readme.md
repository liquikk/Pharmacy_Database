# Проектирование базы данных для аптеки

## Описание
База данных аптеки предназначена для управления данными, связанными с лекарственными средствами, клиентами, продажами и сотрудниками в аптеке. Она помогает упорядочить и хранить информацию обо всех лекарствах, которые продаются в аптеке, их поставщиках, ценах и количестве. Кроме того, база данных содержит информацию о клиентах, позволяя аптеке отслеживать покупки, выписку рецептов, а также организовывать работу сотрудников, контролировать их зарплату, должность и другие данные.

Использование базы данных в аптеке значительно упрощает работу сотрудников и обеспечивает более быстрое обслуживание клиентов. Благодаря базе данных, аптека может быстро найти лекарство, которое нужно клиенту, и узнать о его наличии, цене и поставщике. База данных также позволяет отслеживать и управлять запасами, что помогает предотвращать дефицит товара. Кроме того, аптека может анализировать данные о продажах и поставщиках, чтобы принимать решения о закупках и расширении ассортимента.

В целом, база данных аптеки является необходимым инструментом для эффективного управления и контроля в аптеке. Она позволяет сотрудникам облегчить свою работу и обеспечивает более быстрое и качественное обслуживание клиентов.

## БД состоит из таблиц:

## Таблица "Customers":

Хранит информацию о покупателях аптеки, включая их ID, имя, адрес и телефонный номер.

| Поле    | Тип данных | Описание          |
| ------- | ---------- | ----------------- |
| id      | int    | Уникальный идентификатор покупателя |
| name    | varchar | Имя покупателя |
| address | varchar | Адрес покупателя |
| phone   | varchar | Телефон покупателя |

## Таблица "Employees":

Хранит информацию о сотрудниках аптеки, включая их ID, имя, должность и зарплату.

| Поле    | Тип данных | Описание          |
| ------- | ---------- | ----------------- |
| id      | int    | Уникальный идентификатор сотрудника |
| name    | varchar | Имя сотрудника |
| position | varchar | Должность сотрудника |
| salary  | decimal | Зарплата сотрудника |

## Таблица "Medicines":

Хранит информацию о лекарствах в аптеке, включая их ID, название, ID типа лекарства, ID поставщика, цену и количество на складе. Таблица содержит внешние ключи на таблицы MedicineTypes (Типы лекарств) и Suppliers (Поставщики).

| Поле    | Тип данных | Описание          |
| ------- | ---------- | ----------------- |
| id      | int    | Уникальный идентификатор лекарства |
| name    | varchar | Название лекарства |
| type_id | int | Идентификатор типа лекарства |
| supplier_id | int | Идентификатор поставщика |
| price   | decimal | Цена лекарства |
| quantity | int | Количество лекарства на складе |

## Таблица "MedicineTypes":

Хранит информацию о типах лекарств в аптеке, включая их ID и название.

| Поле    | Тип данных | Описание          |
| ------- | ---------- | ----------------- |
| id      | int    | Уникальный идентификатор типа лекарства |
| name    | varchar | Название типа лекарства |

## Таблица "Prescriptions":

Хранит информацию о выписанных рецептах, включая их ID, ID покупателя, ID лекарства, ID сотрудника, дату выписки и количество лекарства в рецепте. Таблица содержит внешние ключи на таблицы Customers (Покупатели), Medicines (Лекарства) и Employees (Сотрудники).

| Поле    | Тип данных | Описание          |
| ------- | ---------- | ----------------- |
| id      | int    | Уникальный идентификатор рецепта |
| customer_id | int | Идентификатор покупателя |
| medicine_id | int | Идентификатор лекарства |
| employee_id | int | Идентификатор сотрудника |
| date    | date       | Дата выписки рецепта |
| quantity | int   | Количество лекарства в рецепте |

## Таблица Sales:

Хранит информацию о проданных лекарствах, включая их ID, ID покупателя, ID лекарства, ID сотрудника, дату продажи, количество проданного лекарства и цену. Таблица содержит внешние ключи на таблицы Customers (Покупатели), Medicines (Лекарства) и Employees (Сотрудники).

| Поле         | Тип данных | Описание                                               |
|--------------|------------|--------------------------------------------------------|
| id           | int        | Уникальный идентификатор продажи                        |
| customer_id  | int        | Идентификатор покупателя                               |
| medicine_id  | int        | Идентификатор лекарства                                |
| employee_id  | int        | Идентификатор сотрудника, который продал лекарство      |
| date         | date       | Дата продажи                                           |
| quantity     | int        | Количество проданных лекарств                          |
| price        | decimal    | Цена проданного лекарства                              |

## Таблица Suppliers:

Хранит информацию о поставщиках лекарств в аптеке, включая их ID, название, адрес и телефонный номер.

| Поле        | Тип данных | Описание                                                 |
|-------------|------------|----------------------------------------------------------|
| id          | int        | Уникальный идентификатор поставщика                       |
| name        | varchar    | Название поставщика                                      |
| address     | varchar    | Адрес поставщика                                         |
| phone       | varchar    | Телефон поставщика                                       |

## Взаимосвязи:

![image](https://github.com/liquikk/Pharmacy_Database/blob/main/связи.png?raw=true)

* Один покупатель может иметь несколько рецептов и продаж, но каждый рецепт/продажа принадлежит только одному покупателю.

* Один сотрудник может выписать/осуществить несколько рецептов/продаж, но каждый рецепт/продажа принадлежит только одному сотруднику.

* Одно лекарство может быть включено в несколько рецептов/продаж, но каждый рецепт/продажа относится только к одному лекарству.

* Одно лекарство может иметь только один тип лекарства, но каждый тип лекарства может быть связан с несколькими лекарствами.

* Одно лекарство может быть поставляемо от одного поставщика, но каждый поставщик может поставлять несколько лекарств.

## Представления

1. Представление покупателей:

```sql
CREATE VIEW CustomersView AS
SELECT c.id, c.name, c.address, c.phone, COUNT(p.id) AS prescriptions_count, SUM(s.quantity) AS total_quantity
FROM Customers c
LEFT JOIN Prescriptions p ON c.id = p.customer_id
LEFT JOIN Sales s ON c.id = s.customer_id
GROUP BY c.id;
```

2. Представление сотрудников:

```sql
CREATE VIEW EmployeesView AS
SELECT e.id, e.name, e.position, e.salary, COUNT(p.id) AS prescriptions_count, SUM(s.quantity) AS total_quantity
FROM Employees e
LEFT JOIN Prescriptions p ON e.id = p.employee_id
LEFT JOIN Sales s ON e.id = s.employee_id
GROUP BY e.id;
```

3. Представление лекарств:

```sql
CREATE VIEW MedicinesView AS
SELECT m.id, m.name, mt.name AS type, s.name AS supplier, m.price, m.quantity,
       (SELECT SUM(quantity) FROM Prescriptions WHERE medicine_id = m.id) AS total_prescriptions,
       (SELECT SUM(quantity) FROM Sales WHERE medicine_id = m.id) AS total_sales
FROM Medicines m
LEFT JOIN MedicineTypes mt ON m.type_id = mt.id
LEFT JOIN Suppliers s ON m.supplier_id = s.id;
```

4. Представление продаж:

```sql
CREATE VIEW SalesView AS
SELECT s.id, c.name AS customer, m.name AS medicine, e.name AS employee, s.date, s.quantity, s.price
FROM Sales s
JOIN Customers c ON s.customer_id = c.id
JOIN Medicines m ON s.medicine_id = m.id
JOIN Employees e ON s.employee_id = e.id;
```

## Создание таблиц:

```sql
CREATE TABLE MedicineTypes (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL COMMENT 'Название типа лекарств'
);

CREATE TABLE Suppliers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Название поставщика',
    address VARCHAR(255) COMMENT 'Адрес поставщика',
    phone VARCHAR(20) COMMENT 'Телефон поставщика'
);

CREATE TABLE Employees (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Имя сотрудника',
    position VARCHAR(100) COMMENT 'Должность сотрудника',
    salary DECIMAL(10, 2) COMMENT 'Зарплата сотрудника'
);

CREATE TABLE Customers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Имя покупателя',
    address VARCHAR(255) COMMENT 'Адрес покупателя',
    phone VARCHAR(20) COMMENT 'Телефон покупателя'
);

CREATE TABLE Medicines (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Название лекарства',
    type_id INTEGER COMMENT 'ID типа лекарства',
    supplier_id INTEGER COMMENT 'ID поставщика',
    price DECIMAL(10, 2) COMMENT 'Цена лекарства',
    quantity INTEGER COMMENT 'Количество лекарства на складе'
);

CREATE TABLE Prescriptions (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER COMMENT 'ID покупателя',
    medicine_id INTEGER COMMENT 'ID лекарства',
    employee_id INTEGER COMMENT 'ID сотрудника',
    date DATE COMMENT 'Дата выписки рецепта',
    quantity INTEGER COMMENT 'Количество лекарства в рецепте'
);
```

## Создание взаимосвязей:

```sql
ALTER TABLE Medicines
ADD CONSTRAINT fk_medicine_type
FOREIGN KEY (type_id)
REFERENCES MedicineTypes(id);

ALTER TABLE Medicines
ADD CONSTRAINT fk_supplier
FOREIGN KEY (supplier_id)
REFERENCES Suppliers(id);

ALTER TABLE Sales ADD
CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES Customers(id);

ALTER TABLE Sales ADD
CONSTRAINT fk_medicine
FOREIGN KEY (medicine_id)
REFERENCES Medicines(id);

ALTER TABLE Sales ADD
CONSTRAINT fk_employee
FOREIGN KEY (employee_id)
REFERENCES Employees(id);

ALTER TABLE Prescriptions
ADD CONSTRAINT FK_Prescriptions_Customers
FOREIGN KEY (customer_id)
REFERENCES Customers (id);

ALTER TABLE Prescriptions
ADD CONSTRAINT FK_Prescriptions_Medicines
FOREIGN KEY (medicine_id)
REFERENCES Medicines (id);

ALTER TABLE Prescriptions
ADD CONSTRAINT FK_Prescriptions_Employees
FOREIGN KEY (employee_id)
REFERENCES Employees (id);
```

# Примеры SQL запросов для типовых операций:

## Создание записи в таблице Medicines:

```sql
INSERT INTO `Medicines` (`id`, `name`, `type_id`, `supplier_id`, `price`, `quantity`) VALUES
(1, 'Анальгин', 1,  1,  50.00,  100);
```

Запрос создает новую запись в таблице Medicines. Значения полей для новой записи: id = 1, name = 'Анальгин', type_id = 1, supplier_id = 1, price = 50.00, quantity = 100.

## Изменение записи в таблице Medicines:

```sql
UPDATE Medicines SET price = '60',quantity = '80' WHERE id = 1;
```

Запрос изменяет существующую запись в таблице Medicines. В данном случае, поле price для записи с id = 1 будет изменено на 60, а поле quantity будет изменено на 80.

## Удаление записи из таблицы Medicines:

```sql
DELETE FROM Medicines WHERE id = 1;
```

Запрос удаляет запись из таблицы Medicines, где id равно 1. Таким образом, запись с id = 1 будет удалена из таблицы.

## Создание записи в таблице Sales:

```sql
INSERT INTO `Sales` (`id`, `customer_id`, `medicine_id`, `employee_id`, `date`, `quantity`, `price`) VALUES
(1, 1,  1,  1,  '2021-01-01',   3,  150.00);
```

Запрос создает новую запись в таблице Sales. Значения полей для новой записи: id = 1, customer_id = 1, medicine_id = 1, employee_id = 1, date = '2021-01-01', quantity = 3, price = 150.00.

## Изменение записи в таблице Sales:

```sql
UPDATE Sales SET quantity = '4' WHERE id = 1;
```

Запрос изменяет существующую запись в таблице Sales. В данном случае, поле quantity для записи с id = 1 будет изменено на 4.

## Удаление записи из таблицы Sales:

```sql
DELETE FROM Sales WHERE id = 1;
```

Запрос удаляет запись из таблицы Sales, где id равно 1. Таким образом, запись с id = 1 будет удалена из таблицы.

## Создание записи в таблице Employees:

```sql
INSERT INTO `Employees` (`id`, `name`, `position`, `salary`) VALUES
(1, 'Смирнова Екатерина Владимировна',  'Фармацевт',    50000.00);
```

## Изменение записи в таблице Employees:

```sql
UPDATE Employees SET salary = '66000' WHERE id = 1;
```

## Удаление записи из таблицы Employees:

```sql
DELETE FROM Employees WHERE id = 1;
```

## Создание записи в таблице Customers:

```sql
INSERT INTO `Customers` (`id`, `name`, `address`, `phone`) VALUES
(1, 'Иванов Иван Иванович', 'ул. Ленина, д. 10',    '+7 (111) 111-11-11');
```

## Изменение записи в таблице Customers:

```sql
UPDATE Customers SET phone = '+7 (123) 456-78-90' WHERE id = 1;
```

## Удаление записи из таблицы Customers:

```sql
DELETE FROM Customers WHERE id = 1;
```


