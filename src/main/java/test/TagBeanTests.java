package test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.tag.model.TagBean;

import model.hibernate.HibernateUtil;

public class TagBeanTests {

	public static void main(String[] args) {
		StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();

		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		TagBean insert = new TagBean();
		insert.setTagname("海景");
		session.save(insert);
		
		transaction.commit();
		session.close();
		sessionFactory.close();
	}

}
