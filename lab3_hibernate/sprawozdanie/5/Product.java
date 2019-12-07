import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    @Id
    private String ProductName;
    private int UnitsOnStock;

    @ManyToOne
    @JoinColumn(name="SupplierCompanyName")
    private Supplier Supplier;

    public Product() {
    }

    public Product(String ProductName, int UnitsOnStock) {
        this.ProductName = ProductName;
        this.UnitsOnStock = UnitsOnStock;
    }

    public void setSupplier(Supplier supplier) {
        this.Supplier = supplier;
    }

    public Supplier getSupplier() {
        return Supplier;
    }
}
