import javax.persistence.Entity;

@Entity
public class Customer extends Company {
    private int discount;

    public Customer() {
    }

    public Customer(String companyName, Address address, int discount) {
        super(companyName, address);
        this.discount = discount;
    }
}
