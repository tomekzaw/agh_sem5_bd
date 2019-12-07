import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Product {
    @Id
    private String ProductName;
    private int UnitsOnStock;

    public Product() {
    }

    public Product(String ProductName, int UnitsOnStock) {
        this.ProductName = ProductName;
        this.UnitsOnStock = UnitsOnStock;
    }
}
