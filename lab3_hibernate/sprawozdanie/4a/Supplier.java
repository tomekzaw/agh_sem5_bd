import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Supplier {
    @Id
    private String CompanyName;
    private String Street;
    private String City;

    @OneToMany
    private Set<Product> Products = new HashSet<>();

    public Supplier() {
    }

    public Supplier(String CompanyName, String Street, String City) {
        this.CompanyName = CompanyName;
        this.Street = Street;
        this.City = City;
    }

    public void addProduct(Product product) {
        this.Products.add(product);
    }
}
