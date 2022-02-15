package web.travelerlist.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class TravelerlistDAOHibernate implements TravelerlistInterface {

	private SessionFactory sessionFactory;

	public TravelerlistDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<TravelerlistBean> select() {
		return this.getSession().createQuery("FROM TravelerlistBean", TravelerlistBean.class).list();
	}

	@Override
	public TravelerlistBean insert(TravelerlistBean bean) {
		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public TravelerlistBean update(Integer travelerlistno, Integer orderdetailno, String firstname, String lastname,
			String gender, String idno) {
		if (travelerlistno != null) {
			TravelerlistBean temp = this.getSession().get(TravelerlistBean.class, travelerlistno);
			if (temp != null) {
				temp.setIdno(idno);
				temp.setFirstname(firstname);
				temp.setLastname(lastname);
				temp.setOrderdetailno(orderdetailno);
				temp.setGender(gender);
				return temp;
			}
		}
		return null;
	}

	@Override
	public TravelerlistBean findByPrimaryKey(Integer travelerlistno) {
		if(travelerlistno!=null) {
			return this.getSession().get(TravelerlistBean.class, travelerlistno);
		}
		return null;
	}


	@Override
	public boolean delete(Integer travelerlistno) {
		if(travelerlistno!=null) {
			TravelerlistBean temp = this.getSession().get(TravelerlistBean.class, travelerlistno);
			if(temp!=null) {
				this.getSession().delete(temp);
				return true;
			}
		}
		return false;
	}

}
