import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Supplier extends Company {
    private String bankAccountNumber;

    @OneToMany(mappedBy="Supplier")
    private Set<Product> Products = new HashSet<>();

    public Supplier() {
    }

    public Supplier(String companyName, Address address, String bankAccountNumber) {
        super(companyName, address);
        this.bankAccountNumber = bankAccountNumber;
    }

    public void addProduct(Product product) {
        product.setSupplier(this);
        this.Products.add(product);
    }
}
