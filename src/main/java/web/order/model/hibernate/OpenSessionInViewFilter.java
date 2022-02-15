package web.order.model.hibernate;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Servlet Filter implementation class OpenSessionInViewFilter
 */
@WebFilter("/*")
public class OpenSessionInViewFilter implements Filter {

	
	public void init(FilterConfig fConfig) throws ServletException {
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//
//		chain.doFilter(request, response);
//		
//		transaction.commit();
//		session.close();
		
//      以上為錯誤的程式 會造成transaction already active例外     下面的寫法就是講義上寫法 不會有例外
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		try {
			sessionFactory.getCurrentSession().beginTransaction();
			chain.doFilter(request, response); 
			sessionFactory.getCurrentSession().getTransaction().commit();//做完對資料庫的存取，確定成功要commit
			sessionFactory.getCurrentSession().close();
		} catch (Exception e) {
			sessionFactory.getCurrentSession().getTransaction().rollback();//任何錯誤都要rollback transaction
			e.printStackTrace();
			chain.doFilter(request, response);
		}
		
		
		
	}


	
	public void destroy() {
	}

}
