Hibernate: 
    
    create table Product (
       ProductName varchar(255) not null,
        UnitsOnStock integer not null,
        primary key (ProductName)
    )
Hibernate: 
    
    create table Supplier (
       CompanyName varchar(255) not null,
        City varchar(255),
        Street varchar(255),
        primary key (CompanyName)
    )
Hibernate: 
    
    create table Supplier_Product (
       Supplier_CompanyName varchar(255) not null,
        Products_ProductName varchar(255) not null,
        primary key (Supplier_CompanyName, Products_ProductName)
    )
Hibernate: 
    
    alter table Supplier_Product 
       add constraint UK_4quw533yhfv4oxdlj2crgegp8 unique (Products_ProductName)
Hibernate: 
    
    alter table Supplier_Product 
       add constraint FK8tydxwngwxbljwfqo3qnamry9 
       foreign key (Products_ProductName) 
       references Product
Hibernate: 
    
    alter table Supplier_Product 
       add constraint FKlmpqedkbbciufpgfdutgyaxhd 
       foreign key (Supplier_CompanyName) 
       references Supplier