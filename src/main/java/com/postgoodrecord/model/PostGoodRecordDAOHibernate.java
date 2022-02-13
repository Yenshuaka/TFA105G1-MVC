package com.postgoodrecord.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.internal.build.AllowSysOut;

import model.hibernate.HibernateUtil;

public class PostGoodRecordDAOHibernate implements PostGoodRecordDAO {
	
	private SessionFactory sessionFactory;

	public PostGoodRecordDAOHibernate(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public PostGoodRecordBean select(Integer recordid) {
		if (recordid != null) {
			return this.getSession().get(PostGoodRecordBean.class, recordid);
		}
		return null;
	}

	@Override
	public List<PostGoodRecordBean> select() {
		return this.getSession().createQuery("FROM PostGoodRecordBean", PostGoodRecordBean.class).list();
		
	}

	@Override
	public PostGoodRecordBean insert(PostGoodRecordBean bean) {

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
	public PostGoodRecordBean update(Boolean trueorfalse, Integer memberid, Integer postid, Integer recordid) {
		if (recordid != null) {
			PostGoodRecordBean temp = this.getSession().get(PostGoodRecordBean.class, recordid);
			if (temp != null) {
				temp.setGoodstatus(trueorfalse);
				temp.setMemberid(memberid);
				temp.setPostid(postid);
				temp.setRecordid(recordid);
				return temp;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer recordid) {

		if (recordid != null) {
			PostGoodRecordBean temp = this.getSession().get(PostGoodRecordBean.class, recordid);
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

		PostGoodRecordDAO dao = new PostGoodRecordDAOHibernate(sessionFactory);
		List<PostGoodRecordBean> beans = dao.select();
		System.out.println("bean=" + beans);
//		
//		PostGoodRecordBean postGoodRecordBean = dao.select(1);
//		System.out.println("bean=" + postGoodRecordBean);
		
//		PostGoodRecordBean productBean2 = new PostGoodRecordBean();
//		productBean2.setMemberid(1);
//		productBean2.setPostid(2);
//		productBean2.setGoodstatus(true);
//		dao.insert(productBean2);
		
//		dao.update(false, 2, 3, 2);
//		
//		dao.delete(11);
		
		transaction.commit();
		session.close();
		sessionFactory.close();

	}

}
