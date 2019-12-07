import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class Category {
    @Id
    @GeneratedValue
    private int CategoryID;
    private String Name;

    @OneToMany(mappedBy="Category")
    private Set<Product> Products = new HashSet<>();

    public Category() {
    }

    public Category(String Name) {
        this.Name = Name;
    }

    public String getName() {
        return this.Name;
    }

    public void addProduct(Product product) {
        product.setCategory(this);
        this.Products.add(product);
    }

    public void addProducts(Product... products) {
        for (Product product : products) {
            this.addProduct(product);
        }
    }

    public Product[] getProducts() {
        return this.Products.toArray(new Product[0]);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category category = (Category) o;
        return CategoryID == category.CategoryID;
    }

    @Override
    public int hashCode() {
        return Objects.hash(CategoryID);
    }
}
