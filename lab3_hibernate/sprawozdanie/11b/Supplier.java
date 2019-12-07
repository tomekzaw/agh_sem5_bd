import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@SecondaryTable(name="Address")
public class Supplier {
    @Id
    private String CompanyName;

    @Column(table="Address")
    private String Street;
    @Column(table="Address")
    private String City;
    @Column(table="Address")
    private String ZipCode;

    @OneToMany(mappedBy="Supplier")
    private Set<Product> Products = new HashSet<>();

    public Supplier() {
    }

    public Supplier(String CompanyName, String Street, String City, String ZipCode) {
        this.CompanyName = CompanyName;
        this.Street = Street;
        this.City = City;
        this.ZipCode = ZipCode;
    }

    public void addProduct(Product product) {
        product.setSupplier(this);
        this.Products.add(product);
    }

    public String getCompanyName() {
        return CompanyName;
    }
}
