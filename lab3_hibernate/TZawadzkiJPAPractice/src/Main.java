import javax.persistence.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class Main {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("derby");
    private static final EntityManager em = emf.createEntityManager();
    private static final Scanner inputScanner = new Scanner(System.in);
    private static final Random random = new Random();

    public static void main(String[] args) throws FileNotFoundException {
        insertInstrumentsFromFile("instrumenty.txt");

        Customer customer = createNewCustomer("TomSoft", "Kawiory 21", "Kraków", "30-055", 15);

        while (true) {
            System.out.print(">");
            String command = inputScanner.nextLine();
            switch (command) {
                case "?":
                    for (String c : new String[]{"order", "exit", "end"}) {
                        System.out.println("\t" + c);
                    }
                    break;

                case "order":
                    Order order = createNewOrder(customer);
                    placeOrder(order);
                    break;

                case "exit":
                case "end":
                    return;

                default:
                    System.out.println("Invalid command");
            }
        }
    }

    private static void placeOrder(Order order) {
        while (true) {
            System.out.print(String.format("(Order-%d)>", order.getId()));
            String command = inputScanner.nextLine();
            switch (command) {
                case "?":
                    for (String c : new String[]{"<product name>", "submit", "cancel"}) {
                        System.out.println("\t" + c);
                    }
                    break;

                case "show":
                    showOrder(order);
                    break;

                case "submit":
                    if (order.isEmpty()) {
                        System.out.println("Your order is empty");
                    } else {
                        order.submit();
                        em.persist(order);
                        System.out.println("Your order has been submitted. Thank you!");
                        return;
                    }
                    break;

                case "cancel":
                    System.out.println("Your order has been cancelled.");
                    return;

                default:
                    TypedQuery<Product> query = em.createQuery("from Product as product"
                            + " where lower(product.ProductName) LIKE '%'||lower(:ProductName)||'%'", Product.class);
                    query.setParameter("ProductName", command);
                    List<Product> results = query.getResultList();
                    switch (results.size()) {
                        case 0:
                            System.out.println("Product not found");
                            break;

                        case 1:
                            Product product = results.get(0);
                            while (!modifyProduct(order, product));
                            break;

                        default:
                            System.out.println("Ambiguous product name");
                            for (Product p : results) {
                                System.out.println("\t" + p.getName());
                            }
                    }
            }
        }
    }

    private static boolean modifyProduct(Order order, Product product) {
        System.out.print(String.format("(Order-%d)(Product-%s)>", order.getId(), product.getName()));
        String command = inputScanner.nextLine();
        switch (command) {
            case "?":
                for (String c : new String[]{"<quantity delta>", "exit", "end"}) {
                    System.out.println("\t" + c);
                }
                return false;

            case "end":
            case "exit":
                return true;
        }
        int delta;
        try {
            delta = Integer.parseInt(command);
        } catch (NumberFormatException __) {
            System.out.println("Invalid number");
            return false;
        }

        if (delta == 0) {
            System.out.println("Nothing changed");
            return true;
        }

        for (OrderDetail detail : order.getDetails()) {
            if (detail.getProduct() == product) {
                int after = detail.getQuantity() + delta;
                if (after < 0) {
                    System.out.println("Quantity must be a non-negative integer");
                    return false;
                }

                EntityTransaction etx = em.getTransaction();
                etx.begin();
                detail.updateQuantity(delta);
                em.persist(detail);
                etx.commit();
                if (after == 0) {
                    System.out.println(String.format("Removed all %s from your order", product.getName()));
                } else if (delta > 0) {
                    System.out.println(String.format("Added %d of %s from your order", delta, product.getName()));
                } else {
                    System.out.println(String.format("Removed %d of %s from your order", -delta, product.getName()));
                }
                return true;
            }
        }

        if (delta < 0) {
            System.out.println("Quantity must be a non-negative integer");
            return false;
        }

        EntityTransaction etx = em.getTransaction();
        etx.begin();
        OrderDetail detail = new OrderDetail(product, delta);
        order.addDetail(detail);
        em.persist(detail);
        etx.commit();
        System.out.println(String.format("Added %d of %s to your order", delta, product.getName()));
        return true;
    }

    private static void showOrder(Order order) {
        if (order.isEmpty()) {
            System.out.println("Your order is empty");
            return;
        }

        double total = 0;
        for (OrderDetail detail : order.getDetails()) {
            if (detail.getQuantity() == 0) {
                continue;
            }
            Product product = detail.getProduct();
            int quantity = detail.getQuantity();
            System.out.println(quantity + "x " + product.getName());
            total += product.getUnitPrice() * quantity;
        }
        System.out.println(String.format("Total price: $%.2f", total));
        int discountPercent = order.getCustomer().getDiscount();
        if (discountPercent != 0) {
            System.out.println(String.format("Discount: %d%%", discountPercent));
            System.out.println(String.format("After discount: $%.2f", total * (1 - discountPercent * 0.01)));
        }
    }

    private static Order createNewOrder(Customer customer) {
        EntityTransaction etx = em.getTransaction();
        etx.begin();

        Order order = new Order(customer);
        em.persist(order);

        etx.commit();
        return order;
    }

    private static Customer createNewCustomer(String companyName, String street, String city, String zipCode, int discount) {
        EntityTransaction etx = em.getTransaction();
        etx.begin();

        Address address = new Address(street, city, zipCode);
        Customer customer = new Customer(companyName, address, 15);
        em.persist(customer);

        etx.commit();
        return customer;
    }

    private static void insertInstrumentsFromFile(String path) throws FileNotFoundException {
        EntityTransaction etx = em.getTransaction();
        etx.begin();

        File file = new File(path);
        Scanner scanner = new Scanner(file);
        while (scanner.hasNextLine()) {
            String productName = scanner.nextLine();
            int unitsInStock = random.nextInt(1000);
            double unitPrice = random.nextInt(1000)*10 + 9.99d;
            Product product = new Product(productName, unitsInStock, unitPrice);
            em.persist(product);
        }
        scanner.close();

        etx.commit();
    }
}