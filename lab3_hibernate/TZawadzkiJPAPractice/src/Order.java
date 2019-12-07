import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name="Order_table")
public class Order {
    @Id
    @GeneratedValue
    private int id;

    @ManyToOne(cascade={CascadeType.PERSIST})
    @JoinColumn(name="CustomerID")
    private Customer customer;

    private boolean submitted = false;

    private Date submittedOn;

    @OneToMany(mappedBy="order", cascade={CascadeType.PERSIST})
    private Set<OrderDetail> details = new HashSet<>();

    public Order() {
    }

    public Order(Customer customer) {
        this.customer = customer;
    }

    public void addDetail(OrderDetail detail) {
        this.details.add(detail);
        detail.setOrder(this);
    }

    public OrderDetail[] getDetails() {
        return this.details.toArray(new OrderDetail[0]);
    }

    public void removeDetail(OrderDetail detail) {
        this.details.remove(detail);
    }

    public int getId() {
        return this.id;
    }

    public void submit() {
        this.submitted = true;
        this.submittedOn = new Date();
    }

    public boolean isEmpty() {
        for (OrderDetail detail : this.getDetails()) {
            if (detail.getQuantity() > 0) {
                return false;
            }
        }
        return true;
    }

    public Customer getCustomer() {
        return this.customer;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return id == order.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
