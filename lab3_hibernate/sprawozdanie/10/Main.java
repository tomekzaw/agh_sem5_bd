import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class Main {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("derby");
        EntityManager em = emf.createEntityManager();
        EntityTransaction etx = em.getTransaction();
        etx.begin();

        Product piano = new Product("Fortepian", 123);
        Product guitar = new Product("Gitara", 45);
        Product flute = new Product("Flet", 67);
        Product trumpet = new Product("Trąbka", 89);

        Invoice first = new Invoice(1);
        Invoice second = new Invoice(2);

        first.addProduct(piano);
        first.addProduct(guitar);
        second.addProduct(guitar);

        /*
        for (Product product : new Product[] {piano, guitar, flute, trumpet}) {
            em.persist(product);
        }
        */
        for (Invoice invoice : new Invoice[] {first, second}) {
            em.persist(invoice);
        }

        for (Product product : new Product[] {piano, guitar, flute, trumpet}) {
            em.persist(product);
        }
        /*
        for (Invoice invoice : new Invoice[] {first, second}) {
            em.persist(invoice);
        }
        */

        for (Product product : first.getProducts()) {
            System.out.println(product.getName());
        }

        for (Invoice invoice : guitar.getInvoices()) {
            System.out.println(invoice.getInvoiceNumber());
        }

        etx.commit();
        em.close();
    }
}