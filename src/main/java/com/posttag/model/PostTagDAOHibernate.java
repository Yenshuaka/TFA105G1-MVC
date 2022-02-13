package com.posttag.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class PostTagDAOHibernate implements PostTagDAO{

	private SessionFactory sessionFactory;

	public PostTagDAOHibernate(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public PostTagBean select(Integer posttagid) {
		if (posttagid != null) {
			return this.getSession().get(PostTagBean.class, posttagid);
		}
		return null;
	}

	@Override
	public List<PostTagBean> select() {
		return this.getSession().createQuery("FROM PostTagBean", PostTagBean.class).list();
		
	}

	@Override
	public PostTagBean insert(PostTagBean bean) {

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
	public PostTagBean update(Integer postid, Integer tagid, Integer posttagid) {
		if (posttagid != null) {
			PostTagBean temp = this.getSession().get(PostTagBean.class, posttagid);
			if (temp != null) {
				temp.setPostid(postid);
				temp.setTagid(tagid);
//				temp.setPosttagid(posttagid);
				return temp;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer posttagid) {

		if (posttagid != null) {
			PostTagBean temp = this.getSession().get(PostTagBean.class, posttagid);
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

		PostTagDAO dao = new PostTagDAOHibernate(sessionFactory);
		List<PostTagBean> beans = dao.select();
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
