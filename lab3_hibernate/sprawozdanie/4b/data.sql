Hibernate: 
    /* insert Product
        */ insert 
        into
            Product
            (UnitsOnStock, ProductName) 
        values
            (?, ?)
Hibernate: 
    /* insert Product
        */ insert 
        into
            Product
            (UnitsOnStock, ProductName) 
        values
            (?, ?)
Hibernate: 
    /* insert Product
        */ insert 
        into
            Product
            (UnitsOnStock, ProductName) 
        values
            (?, ?)
Hibernate: 
    /* insert Product
        */ insert 
        into
            Product
            (UnitsOnStock, ProductName) 
        values
            (?, ?)
Hibernate: 
    /* insert Supplier
        */ insert 
        into
            Supplier
            (City, Street, CompanyName) 
        values
            (?, ?, ?)
Hibernate: 
    /* create one-to-many row Supplier.Products */ update
        Product 
    set
        SupplierCompanyName=? 
    where
        ProductName=?
Hibernate: 
    /* create one-to-many row Supplier.Products */ update
        Product 
    set
        SupplierCompanyName=? 
    where
        ProductName=?
Hibernate: 
    /* create one-to-many row Supplier.Products */ update
        Product 
    set
        SupplierCompanyName=? 
    where
        ProductName=?
Hibernate: 
    /* create one-to-many row Supplier.Products */ update
        Product 
    set
        SupplierCompanyName=? 
    where
        ProductName=?