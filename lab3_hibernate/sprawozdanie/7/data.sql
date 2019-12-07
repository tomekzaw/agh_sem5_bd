Hibernate: 
    
values
    next value for hibernate_sequence
Hibernate: 
    
values
    next value for hibernate_sequence
Hibernate: 
    /* insert Product
        */ insert 
        into
            Product
            (CategoryID, SupplierCompanyName, UnitsOnStock, ProductName) 
        values
            (?, ?, ?, ?)
Hibernate: 
    /* insert Product
        */ insert 
        into
            Product
            (CategoryID, SupplierCompanyName, UnitsOnStock, ProductName) 
        values
            (?, ?, ?, ?)
Hibernate: 
    /* insert Product
        */ insert 
        into
            Product
            (CategoryID, SupplierCompanyName, UnitsOnStock, ProductName) 
        values
            (?, ?, ?, ?)
Hibernate: 
    /* insert Product
        */ insert 
        into
            Product
            (CategoryID, SupplierCompanyName, UnitsOnStock, ProductName) 
        values
            (?, ?, ?, ?)
Hibernate: 
    /* insert Invoice
        */ insert 
        into
            Invoice
            (Quantity, InvoiceNumber) 
        values
            (?, ?)
Hibernate: 
    /* insert Invoice
        */ insert 
        into
            Invoice
            (Quantity, InvoiceNumber) 
        values
            (?, ?)
Hibernate: 
    /* insert collection
        row Invoice.Products */ insert 
        into
            Invoice_Product
            (Invoices_InvoiceNumber, Products_ProductName) 
        values
            (?, ?)
Hibernate: 
    /* insert collection
        row Invoice.Products */ insert 
        into
            Invoice_Product
            (Invoices_InvoiceNumber, Products_ProductName) 
        values
            (?, ?)