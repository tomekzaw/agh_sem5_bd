import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Main {
    private static SessionFactory sessionFactory = null;

    public static void main(String[] args) {
        sessionFactory = getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        Product[] products = new Product[] {
                new Product("Fortepian", 123),
                new Product("Gitara", 45),
                new Product("Flet", 67),
                new Product("Trąbka", 89)
        };
        for (Product product : products) {
            session.persist(product);
        }

        Supplier supplier = new Supplier("Hurtownia instrumentów", "Czarnowiejska 139", "Kraków");
        session.persist(supplier);

        for (Product product : products) {
            supplier.addProduct(product);
        }

        tx.commit();
        session.close();
    }

    private static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            Configuration configuration = new Configuration();
            sessionFactory = configuration.configure().buildSessionFactory();
        }
        return sessionFactory;
    }
}