Hibernate: 
    /* insert Supplier
        */ insert 
        into
            Supplier
            (CompanyName) 
        values
            (?)
Hibernate: 
    /* insert Supplier
        */ insert 
        into
            Address
            (City, Street, ZipCode, CompanyName) 
        values
            (?, ?, ?, ?)