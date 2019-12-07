import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name="Order_Detail")
public class OrderDetail implements Serializable {
    @Id
    @ManyToOne
    @JoinColumn(name="OrderID")
    private Order order;

    @Id
    @ManyToOne
    @JoinColumn(name="ProductID")
    private Product product;

    private int quantity;

    public OrderDetail() {

    }

    public OrderDetail(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public OrderDetail(Product product) {
        this(product, 1);
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderDetail that = (OrderDetail) o;
        return Objects.equals(order, that.order) &&
                Objects.equals(product, that.product);
    }

    @Override
    public int hashCode() {
        return Objects.hash(order, product);
    }

    public Product getProduct() {
        return this.product;
    }

    public int getQuantity() {
        return this.quantity;
    }

    public void updateQuantity(int delta) {
        this.quantity += delta;
    }
}
