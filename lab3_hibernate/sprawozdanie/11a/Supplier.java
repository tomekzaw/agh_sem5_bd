import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Supplier {
    @Id
    private String CompanyName;

    @Embedded
    private Address Address;

    @OneToMany(mappedBy="Supplier")
    private Set<Product> Products = new HashSet<>();

    public Supplier() {
    }

    public Supplier(String CompanyName, Address Address) {
        this.CompanyName = CompanyName;
        this.Address = Address;
    }

    public void addProduct(Product product) {
        product.setSupplier(this);
        this.Products.add(product);
    }

    public String getCompanyName() {
        return CompanyName;
    }
}
