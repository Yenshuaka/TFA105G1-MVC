package com.posttypeall.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class PostTypeAllDAOHibernate implements PostTypeAllDAO{

	private SessionFactory sessionFactory;

	public PostTypeAllDAOHibernate(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public PostTypeAllBean select(Integer posttypeid) {
		if (posttypeid != null) {
			return this.getSession().get(PostTypeAllBean.class, posttypeid);
		}
		return null;
	}

	@Override
	public List<PostTypeAllBean> select() {
		return this.getSession().createQuery("FROM PostTypeAllBean", PostTypeAllBean.class).list();
		
	}

	@Override
	public PostTypeAllBean insert(PostTypeAllBean bean) {

//		if (bean != null && bean.getRecordid() != null) {
//			PostGoodRecordBean temp = this.getSession().get(PostGoodRecordBean.class, bean.getRecordid());
//			if (temp == null) {
				this.getSession().save(bean);
				return bean;
//			}
//		}
//		return null;  這幾行註解掉才會成功 因為PK是自動產生 產生之前根本不可能重複 所以直接加入 或者是要判斷這筆資料是否存在要用別的條件
	}

	@Override
	public PostTypeAllBean update(String posttypename, Integer typecount, Integer posttypeid) {
		if (posttypeid != null) {
			PostTypeAllBean temp = this.getSession().get(PostTypeAllBean.class, posttypeid);
			if (temp != null) {
				temp.setPosttypename(posttypename);
				temp.setTypecount(typecount);
//				temp.setPosttagid(posttagid);
				return temp;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer posttypeid) {

		if (posttypeid != null) {
			PostTypeAllBean temp = this.getSession().get(PostTypeAllBean.class, posttypeid);
			if (temp != null) {
				this.getSession().delete(temp);
				return true;
			}
		}
		return false;
	}
	
	
	public static void main(String[] args) {

		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();

		PostTypeAllDAO dao = new PostTypeAllDAOHibernate(sessionFactory);
		List<PostTypeAllBean> beans = dao.select();
		System.out.println("bean=" + beans);
//		

//		dao.insert(productBean2);
		
//		dao.update(false, 2, 3, 2);
//		
//		dao.delete(11);
		
		transaction.commit();
		session.close();
		sessionFactory.close();

	}
	
}
