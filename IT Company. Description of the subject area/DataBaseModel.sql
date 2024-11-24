create schema if not exists it_company;

use it_company;

create table if not exists `client` (
    idClient int primary key auto_increment,
    nameOfTheOrganization varchar(255) not null,
    countryOfTheOrganization varchar(255) not null,
    theOrganizationsCity varchar(255) not null,
    streetOfTheOrganization varchar(255) not null,
    theOrganizationsHouse varchar(255) not null,
    phoneNumber varchar(18) not null unique,
    emailAddress varchar(255) not null unique,
    surnameOfTheContactPerson varchar(255) not null,
    nameOfTheContactPerson varchar(255) not null,
    patronymicOfTheContactPerson varchar(255),
    regularCustomer tinyint(1) not null,
    theDiscountAmountPercent decimal(10, 0)
);

create table if not exists departments (
    idDepartment int primary key auto_increment,
    title varchar(255)
);

create table if not exists employee (
    idEmployee int primary key,
    idDepartment int not null,
    oosition enum('Сотрудник', 'Менеджер', 'Главный менеджер') not null,
    surname varchar(255) not null,
    name varchar(255) not null,
    patronymic varchar(255),
    gender enum('Мужской', 'Женский') not null,
    knowledgeOfTheProgrammingLanguage text,
    knowledgeOfTheProgrammingSystem text,
    dbmsOwnership text,
    ownershipOfTheOS text,
    constraint fk_IdDepartament foreign key (idDepartment) references departments (idDepartment)
);

create table if not exists `order` (
    idOrder int primary key auto_increment,
    idClient int not null,
    idSupervisor int not null,
    idContract int not null unique key,
    dateOfCreation datetime not null,
    orderCompletionDate datetime,
    plannedCompletionDate datetime not null,
    totalCost decimal(5, 2) not null,
    tasks text,
    orderStatus enum('В рассмотрении', 'Отклонён', 'Принят', 'Исполняется', 'Заморожен', 'Прекращён', 'Завершён'),
    constraint fk_IdClient foreign key (idClient) references client (idClient),
    constraint fk_IdEmployee foreign key (idSupervisor) references employee (idEmployee)
);
