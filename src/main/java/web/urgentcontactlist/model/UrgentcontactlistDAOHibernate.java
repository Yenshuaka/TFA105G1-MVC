package web.urgentcontactlist.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class UrgentcontactlistDAOHibernate implements UrgentcontactlistInterface {

	private SessionFactory sessionFactory;

	public UrgentcontactlistDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<UrgentcontactlistBean> select() {
		return this.getSession().createQuery("FROM UrgentcontactlistBean", UrgentcontactlistBean.class).list();
	}

	@Override
	public UrgentcontactlistBean insert(UrgentcontactlistBean bean) {
		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public UrgentcontactlistBean update(Integer urgentcontactno, Integer orderdetailno, String urgentfirstname,
			String urgentlastname, String urgentphone) {
		if (urgentcontactno != null) {
			UrgentcontactlistBean temp = this.getSession().get(UrgentcontactlistBean.class, urgentcontactno);
			if (temp != null) {
				temp.setOrderdetailno(orderdetailno);
				temp.setUrgentfirstname(urgentfirstname);
				temp.setUrgentlastname(urgentlastname);
				temp.setUrgentphone(urgentphone);
				return temp;
			}
		}
		return null;
	}

	@Override
	public UrgentcontactlistBean findByPrimaryKey(Integer urgentcontactno) {
		if(urgentcontactno!=null) {
			return this.getSession().get(UrgentcontactlistBean.class, urgentcontactno);
		}
		return null;
	}

	@Override
	public boolean delete(Integer urgentcontactno) {
		if(urgentcontactno!=null) {
			UrgentcontactlistBean temp = this.getSession().get(UrgentcontactlistBean.class, urgentcontactno);
			if(temp!=null) {
				this.getSession().delete(temp);
				return true;
			}
		}
		return false;
	}
	

}
