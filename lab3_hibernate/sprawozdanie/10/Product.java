import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Product {
    @Id
    private String ProductName;
    private int UnitsOnStock;

    @ManyToOne
    @JoinColumn(name="SupplierCompanyName")
    private Supplier Supplier;

    @ManyToOne
    @JoinColumn(name="CategoryID")
    private Category Category;

    @ManyToMany(mappedBy="Products", cascade={CascadeType.PERSIST})
    private Set<Invoice> Invoices = new HashSet<>();

    public Product() {
    }

    public Product(String ProductName, int UnitsOnStock) {
        this.ProductName = ProductName;
        this.UnitsOnStock = UnitsOnStock;
    }

    public String getName() {
        return this.ProductName;
    }

    public void setSupplier(Supplier supplier) {
        this.Supplier = supplier;
    }

    public Supplier getSupplier() {
        return Supplier;
    }

    public void setCategory(Category category) {
        this.Category = category;
    }

    public Category getCategory() {
        return this.Category;
    }

    public void addInvoice(Invoice invoice) {
        this.Invoices.add(invoice);
        // invoice.addProduct(this);
    }

    public Invoice[] getInvoices() {
        return this.Invoices.toArray(new Invoice[0]);
    }
}
