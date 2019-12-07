import javax.persistence.*;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
public class Company {
    @Id
    private String CompanyName;

    @Embedded
    private Address Address;

    public Company() {
    }

    public Company(String CompanyName, Address Address) {
        this.CompanyName = CompanyName;
        this.Address = Address;
    }

    public String getCompanyName() {
        return CompanyName;
    }
}
