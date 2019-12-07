Hibernate: 

    create table Product (
       ProductName varchar(255) not null,
        UnitsOnStock integer not null,
        SupplierCompanyName varchar(255),
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
    
    alter table Product 
       add constraint FK8tyd737am5p4dcvbibadpijld 
       foreign key (SupplierCompanyName) 
       references Supplier