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

        Address address = new Address("Chopina 88", "Kraków", "30-059");
        Supplier supplier = new Supplier("Hurtownia fortepianów", address);
        em.persist(supplier);

        etx.commit();
        em.close();
    }
}