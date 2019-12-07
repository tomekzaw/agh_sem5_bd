Hibernate: create sequence hibernate_sequence start with 1 increment by 1
Hibernate: 
    
    create table Category (
       CategoryID integer not null,
        Name varchar(255),
        primary key (CategoryID)
    )
Hibernate: 
    
    create table Company (
       DTYPE varchar(31) not null,
        CompanyName varchar(255) not null,
        City varchar(255),
        Street varchar(255),
        ZipCode varchar(255),
        discount integer,
        bankAccountNumber varchar(255),
        primary key (CompanyName)
    )
Hibernate: 
    
    create table Invoice (
       InvoiceNumber integer not null,
        Quantity integer not null,
        primary key (InvoiceNumber)
    )
Hibernate: 
    
    create table Invoice_Product (
       Invoices_InvoiceNumber integer not null,
        Products_ProductName varchar(255) not null,
        primary key (Invoices_InvoiceNumber, Products_ProductName)
    )
Hibernate: 
    
    create table Product (
       ProductName varchar(255) not null,
        UnitsOnStock integer not null,
        CategoryID integer,
        SupplierCompanyName varchar(255),
        primary key (ProductName)
    )
Hibernate: 
    
    alter table Invoice_Product 
       add constraint FKpwsbq166bgjnd1v1jgt5erjwi 
       foreign key (Products_ProductName) 
       references Product
Hibernate: 
    
    alter table Invoice_Product 
       add constraint FK88h51tf9ne7gdg782v2aw46ap 
       foreign key (Invoices_InvoiceNumber) 
       references Invoice
Hibernate: 
    
    alter table Product 
       add constraint FKf9oip6g0rdsqr327ymf173jf9 
       foreign key (CategoryID) 
       references Category
Hibernate: 
    
    alter table Product 
       add constraint FKo6oiex67n05mb5fwccmxok3mt 
       foreign key (SupplierCompanyName) 
       references Company