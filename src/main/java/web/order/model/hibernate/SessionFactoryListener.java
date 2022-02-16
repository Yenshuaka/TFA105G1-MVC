//package web.order.model.hibernate;
//
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//
//@WebListener
//public class SessionFactoryListener implements ServletContextListener{
//
//	@Override
//	//contextInitialized()方法內產生SessionFactory物件
//	public void contextInitialized(ServletContextEvent sce) {
//		//修改HibernateUtil從JNDI Registry抓出SessionFactory
//		HibernateUtil.getSessionfactory();
//		
//	}
//
//	@Override
//	public void contextDestroyed(ServletContextEvent sce) {
//		
//		HibernateUtil.closeSessionFactory();
//		
//	}
//
//}
