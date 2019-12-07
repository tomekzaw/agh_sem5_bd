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

        Product piano = new Product("Fortepian", 123);
        Product guitar = new Product("Gitara", 45);
        Product flute = new Product("Flet", 67);
        Product trumpet = new Product("Trąbka", 89);
        for (Product product : new Product[] {piano, guitar, flute, trumpet}) {
            session.persist(product);
        }

        Category string = new Category("Instrumenty strunowe");
        Category wind = new Category("Instrumenty dęte");
        for (Category category : new Category[] {string, wind}) {
            session.persist(category);
        }

        wind.addProducts(flute, trumpet);

        Supplier supplier = new Supplier("Hurtownia instrumentów", "Czarnowiejska 139", "Kraków");
        session.persist(supplier);

        for (Product product : new Product[] {piano, guitar, flute, trumpet}) {
            supplier.addProduct(product);
        }
        
        for (Product product : wind.getProducts()) {
            System.out.println(product.getName());
        }

        System.out.println(trumpet.getCategory().getName());

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