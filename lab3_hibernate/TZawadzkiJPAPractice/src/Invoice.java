import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Invoice {
    @Id
    @GeneratedValue
    private int InvoiceNumber;
    private int Quantity;

    @ManyToMany(cascade = {CascadeType.PERSIST})
    private Set<Product> Products = new HashSet<>();

    public Invoice() {
    }

    public Invoice(int quantity) {
        this.Quantity = quantity;
    }

    public int getInvoiceNumber() {
        return this.InvoiceNumber;
    }

    public void addProduct(Product product) {
        this.Products.add(product);
        product.addInvoice(this);
    }

    public void addProducts(Product... products) {
        for (Product product : products) {
            this.addProduct(product);
        }
    }

    public Product[] getProducts() {
        return this.Products.toArray(new Product[0]);
    }
}
