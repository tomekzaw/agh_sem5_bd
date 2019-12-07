import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.sql.SQLOutput;

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

        Invoice first = new Invoice(1);
        Invoice second = new Invoice(2);
        for (Invoice invoice : new Invoice[] {first, second}) {
            session.persist(invoice);
        }

        first.addProduct(piano);
        first.addProduct(guitar);
        second.addProduct(guitar);

        for (Product product : first.getProducts()) {
            System.out.println(product.getName());
        }

        for (Invoice invoice : guitar.getInvoices()) {
            System.out.println(invoice.getInvoiceNumber());
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