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
        for (Product product : new Product[] {piano, guitar, flute, trumpet}) {
            em.persist(product);
        }

        Category string = new Category("Instrumenty strunowe");
        Category wind = new Category("Instrumenty dęte");
        for (Category category : new Category[] {string, wind}) {
            em.persist(category);
        }

        wind.addProducts(flute, trumpet);

        Supplier supplier = new Supplier("Hurtownia instrumentów", "Czarnowiejska 139", "Kraków");
        em.persist(supplier);

        for (Product product : new Product[] {piano, guitar, flute, trumpet}) {
            supplier.addProduct(product);
        }

        for (Product product : wind.getProducts()) {
            System.out.println(product.getName());
        }

        System.out.println(trumpet.getCategory().getName());

        etx.commit();
        em.close();
    }
}