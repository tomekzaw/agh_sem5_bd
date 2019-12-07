import javax.persistence.*;

@Embeddable
public class Address {
    private String Street;
    private String City;
    private String ZipCode;

    public Address() {
    }

    public Address(String Street, String City, String ZipCode) {
        this.Street = Street;
        this.City = City;
        this.ZipCode = ZipCode;
    }
}