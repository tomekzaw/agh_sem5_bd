import org.apache.derby.client.am.Decimal;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class Product {
    @Id
    private String ProductName;
    private int UnitsOnStock;

    @Column(precision=10, scale=2)
    private double UnitPrice;

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

    public Product(String ProductName, int UnitsOnStock, double UnitPrice) {
        this.ProductName = ProductName;
        this.UnitsOnStock = UnitsOnStock;
        this.UnitPrice = UnitPrice;
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

    public double getUnitPrice() {
        return this.UnitPrice;
    }

    public void addInvoice(Invoice invoice) {
        this.Invoices.add(invoice);
        // invoice.addProduct(this);
    }

    public Invoice[] getInvoices() {
        return this.Invoices.toArray(new Invoice[0]);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return Objects.equals(ProductName, product.ProductName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ProductName);
    }
}
