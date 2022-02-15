package web.urgentcontactlist.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import web.order.model.hibernate.HibernateUtil;

public class UrgentcontactlistService {

	private UrgentcontactlistDAOHibernate urgentcontactlistDao;

	public UrgentcontactlistService(UrgentcontactlistDAOHibernate urgentcontactlistDao) {
		this.urgentcontactlistDao = urgentcontactlistDao;
	}
	
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		UrgentcontactlistService svc = new UrgentcontactlistService(new UrgentcontactlistDAOHibernate(sessionFactory));
		
		UrgentcontactlistBean bean = new UrgentcontactlistBean();
		//新增
		bean.setOrderdetailno(3);
		bean.setUrgentfirstname("軍軍");
		bean.setUrgentlastname("小");
		bean.setUrgentphone("0987654321");
		
		UrgentcontactlistBean insert = svc.insert(bean);
		
		
		//刪除
//		bean.setUrgentcontactno(3);
//		boolean delete = svc.delete(bean);
		System.out.println("測試成功");
		
		transaction.commit();
		session.close();
		sessionFactory.close();
	}

	public List<UrgentcontactlistBean> select(UrgentcontactlistBean bean) {
		List<UrgentcontactlistBean> result = null;
		if (bean != null && bean.getUrgentcontactno() != null && !bean.getUrgentcontactno().equals(0)) {
			UrgentcontactlistBean temp = urgentcontactlistDao.findByPrimaryKey(bean.getUrgentcontactno());
			if (temp != null) {
				result = new ArrayList<UrgentcontactlistBean>();
				result.add(temp);
			}
		} else {
			result = urgentcontactlistDao.select();
		}
		return result;
	}
	
	public UrgentcontactlistBean insert(UrgentcontactlistBean bean) {
		UrgentcontactlistBean result = null;
		if(bean!=null) {
			result = urgentcontactlistDao.insert(bean);
		}
		return result;
	}
	
	public UrgentcontactlistBean update(UrgentcontactlistBean bean) {
		UrgentcontactlistBean result = null;
		if(bean!=null && bean.getUrgentcontactno()!=null) {
			result = urgentcontactlistDao.update(bean.getUrgentcontactno(), bean.getOrderdetailno(), bean.getUrgentfirstname(), bean.getUrgentlastname(), bean.getUrgentphone());
		}
		return result;
	}
	
	public boolean delete(UrgentcontactlistBean bean) {
		boolean result = false;
		if(bean!=null && bean.getUrgentcontactno()!=null) {
			result = urgentcontactlistDao.delete(bean.getUrgentcontactno());
		}
		return false;
	}
	
	public UrgentcontactlistBean getOneTravelerlist(Integer travelerlistno) {
		return urgentcontactlistDao.findByPrimaryKey(travelerlistno);
	}

}
