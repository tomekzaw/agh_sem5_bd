Hibernate: 
    /* insert Company
        */ insert 
        into
            Company
            (City, Street, ZipCode, DTYPE, CompanyName) 
        values
            (?, ?, ?, 'Company', ?)
Hibernate: 
    /* insert Supplier
        */ insert 
        into
            Company
            (City, Street, ZipCode, bankAccountNumber, DTYPE, CompanyName) 
        values
            (?, ?, ?, ?, 'Supplier', ?)
Hibernate: 
    /* insert Customer
        */ insert 
        into
            Company
            (City, Street, ZipCode, discount, DTYPE, CompanyName) 
        values
            (?, ?, ?, ?, 'Customer', ?)