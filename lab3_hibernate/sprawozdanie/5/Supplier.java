import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Supplier {
    @Id
    private String CompanyName;
    private String Street;
    private String City;

    @OneToMany(mappedBy="Supplier")
    private Set<Product> Products = new HashSet<>();

    public Supplier() {
    }

    public Supplier(String CompanyName, String Street, String City) {
        this.CompanyName = CompanyName;
        this.Street = Street;
        this.City = City;
    }

    public void addProduct(Product product) {
        product.setSupplier(this);
        this.Products.add(product);
    }

    public String getCompanyName() {
        return CompanyName;
    }
}
