import javax.persistence.*;
import java.util.Objects;

@Entity
@Inheritance(strategy=InheritanceType.JOINED)
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Company company = (Company) o;
        return Objects.equals(CompanyName, company.CompanyName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(CompanyName);
    }
}
