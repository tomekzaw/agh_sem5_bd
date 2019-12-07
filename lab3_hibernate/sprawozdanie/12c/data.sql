Hibernate: 
    /* insert Company
        */ insert 
        into
            Company
            (City, Street, ZipCode, CompanyName) 
        values
            (?, ?, ?, ?)
Hibernate: 
    /* insert Supplier
        */ insert 
        into
            Supplier
            (City, Street, ZipCode, bankAccountNumber, CompanyName) 
        values
            (?, ?, ?, ?, ?)
Hibernate: 
    /* insert Customer
        */ insert 
        into
            Customer
            (City, Street, ZipCode, discount, CompanyName) 
        values
            (?, ?, ?, ?, ?)