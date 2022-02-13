package com.tag.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class TagDAOHibernate implements TagDAO{

	
	private SessionFactory sessionFactory;

	public TagDAOHibernate(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public TagBean select(Integer tagid) {
		if (tagid != null) {
			return this.getSession().get(TagBean.class, tagid);
		}
		return null;
	}

	@Override
	public List<TagBean> select() {
		return this.getSession().createQuery("FROM TagBean", TagBean.class).list();
		
	}

	@Override
	public TagBean insert(TagBean bean) {

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
	public TagBean update(String tagname, Integer tagid) {
		if (tagid != null) {
			TagBean temp = this.getSession().get(TagBean.class, tagid);
			if (temp != null) {
				temp.setTagname(tagname);
				temp.setTagid(tagid);
				return temp;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer tagid) {

		if (tagid != null) {
			TagBean temp = this.getSession().get(TagBean.class, tagid);
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

		TagDAO dao = new TagDAOHibernate(sessionFactory);
		List<TagBean> beans = dao.select();
		System.out.println("bean=" + beans);
//		
		TagBean tagBean = dao.select(1);
		System.out.println("bean=" + tagBean);
		
//		TagBean tagBean2 = new TagBean();
//		tagBean2.setTagname("花蓮");
//		dao.insert(tagBean2);
		
//		dao.update("台東", 9);
//		
//		dao.delete(9);
		
		transaction.commit();
		session.close();
		sessionFactory.close();

	}
}
