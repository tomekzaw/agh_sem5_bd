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

        Address czarnowiejska = new Address("Czarnowiejska 139", "Kraków", "30-057");
        Company company = new Company("Zaufana firma S.A.", czarnowiejska);
        em.persist(company);

        Address chopina = new Address("Chopina 88", "Kraków", "30-059");
        Supplier supplier = new Supplier("Hurtownia fortepianów", chopina, "12 1234 5678 9012 3456 7890");
        em.persist(supplier);

        Address kawiory = new Address("Kawiory 21", "Kraków", "30-055");
        Customer customer = new Customer("Sklep muzyczny", kawiory, 15);
        em.persist(customer);

        etx.commit();
        em.close();
    }
}