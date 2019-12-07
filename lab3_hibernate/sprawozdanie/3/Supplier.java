import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Supplier {
    @Id
    public String CompanyName;
    public String Street;
    public String City;

    public Supplier() {
    }

    public Supplier(String CompanyName, String Street, String City) {
        this.CompanyName = CompanyName;
        this.Street = Street;
        this.City = City;
    }
}
