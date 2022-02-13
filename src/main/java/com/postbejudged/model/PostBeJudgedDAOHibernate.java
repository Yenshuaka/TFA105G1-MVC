package com.postbejudged.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.postgoodrecord.model.PostGoodRecordBean;
import com.postgoodrecord.model.PostGoodRecordDAO;
import com.postgoodrecord.model.PostGoodRecordDAOHibernate;

import model.hibernate.HibernateUtil;

public class PostBeJudgedDAOHibernate implements PostBeJudgedDAO {
	
	private SessionFactory sessionFactory;

	public PostBeJudgedDAOHibernate(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public PostBeJudgedBean select(Integer postbejudgedid) {
		if (postbejudgedid != null) {
			return this.getSession().get(PostBeJudgedBean.class, postbejudgedid);
		}
		return null;
	}

	@Override
	public List<PostBeJudgedBean> select() {
		return this.getSession().createQuery("FROM PostBeJudgedBean", PostBeJudgedBean.class).list();
		
	}

	@Override
	public PostBeJudgedBean insert(PostBeJudgedBean bean) {

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
	public PostBeJudgedBean update(Integer postid, Integer memberid, String postbejudgedreason, Integer postbejudgedid) {
		if (postbejudgedid != null) {
			PostBeJudgedBean temp = this.getSession().get(PostBeJudgedBean.class, postbejudgedid);
			if (temp != null) {
				temp.setPostid(postid);
				temp.setMemberid(memberid);
				temp.setPostbejudgedreason(postbejudgedreason);
				temp.setPostbejudgedid(postbejudgedid);
				return temp;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer postbejudgedid) {

		if (postbejudgedid != null) {
			PostBeJudgedBean temp = this.getSession().get(PostBeJudgedBean.class, postbejudgedid);
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

		PostBeJudgedDAO dao = new PostBeJudgedDAOHibernate(sessionFactory);
		List<PostBeJudgedBean> beans = dao.select();
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
