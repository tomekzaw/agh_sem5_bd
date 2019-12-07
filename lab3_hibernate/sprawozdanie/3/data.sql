Hibernate: 
    select
        product0_.ProductName as ProductN1_0_0_,
        product0_.SupplierCompanyName as Supplier3_0_0_,
        product0_.UnitsOnStock as UnitsOnS2_0_0_,
        supplier1_.CompanyName as CompanyN1_1_1_,
        supplier1_.City as City2_1_1_,
        supplier1_.Street as Street3_1_1_ 
    from
        Product product0_ 
    left outer join
        Supplier supplier1_ 
            on product0_.SupplierCompanyName=supplier1_.CompanyName 
    where
        product0_.ProductName=?
Hibernate: 
    /* insert Supplier
        */ insert 
        into
            Supplier
            (City, Street, CompanyName) 
        values
            (?, ?, ?)
Hibernate: 
    /* update
        Product */ update
            Product 
        set
            SupplierCompanyName=?,
            UnitsOnStock=? 
        where
            ProductName=?