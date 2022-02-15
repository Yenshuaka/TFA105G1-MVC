package web.travelerlist.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import web.order.model.hibernate.HibernateUtil;

public class TravlerlistService {

	private TravelerlistDAOHibernate travelerlistDao;

	public TravlerlistService(TravelerlistDAOHibernate travelerlistDao) {
		this.travelerlistDao = travelerlistDao;
	}
	
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		TravlerlistService svc = new TravlerlistService(new TravelerlistDAOHibernate(sessionFactory));
		
		TravelerlistBean bean = new TravelerlistBean();
		//新增
		bean.setIdno("A12345678");
		bean.setGender("男");
		bean.setFirstname("軍軍");
		bean.setLastname("小");
		bean.setOrderdetailno(3);
		
		TravelerlistBean insert = svc.insert(bean);
		
		
		//刪除
//		bean.setTravelerlistno(6);
//		boolean delete = svc.delete(bean);
		System.out.println("測試成功");
		
		transaction.commit();
		session.close();
		sessionFactory.close();
	}

	public List<TravelerlistBean> select(TravelerlistBean bean) {
		List<TravelerlistBean> result = null;
		if (bean != null && bean.getTravelerlistno() != null && !bean.getTravelerlistno().equals(0)) {
			TravelerlistBean temp = travelerlistDao.findByPrimaryKey(bean.getTravelerlistno());
			if (temp != null) {
				result = new ArrayList<TravelerlistBean>();
				result.add(temp);
			}
		} else {
			result = travelerlistDao.select();
		}
		return result;
	}
	
	public TravelerlistBean insert(TravelerlistBean bean) {
		TravelerlistBean result = null;
		if(bean!=null) {
			result = travelerlistDao.insert(bean);
		}
		return result;
	}
	
	public TravelerlistBean update(TravelerlistBean bean) {
		TravelerlistBean result = null;
		if(bean!=null && bean.getTravelerlistno()!=null) {
			result = travelerlistDao.update(bean.getTravelerlistno(), bean.getTravelerlistno(), bean.getFirstname(), bean.getLastname(), bean.getGender(), bean.getIdno());
		}
		return result;
	}
	
	public boolean delete(TravelerlistBean bean) {
		boolean result = false;
		if(bean!=null && bean.getTravelerlistno()!=null) {
			result = travelerlistDao.delete(bean.getTravelerlistno());
		}
		return false;
	}
	
	public TravelerlistBean getOneTravelerlist(Integer travelerlistno) {
		return travelerlistDao.findByPrimaryKey(travelerlistno);
	}

}
