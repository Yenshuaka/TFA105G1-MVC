package com.commentbejudged.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class CommentBeJudgedDAOHibernate implements CommentBeJudgedDAO {

	
	private SessionFactory sessionFactory;

	public CommentBeJudgedDAOHibernate(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public CommentBeJudgedBean select(Integer commentbejudgedid) {
		if (commentbejudgedid != null) {
			return this.getSession().get(CommentBeJudgedBean.class, commentbejudgedid);
		}
		return null;
	}

	@Override
	public List<CommentBeJudgedBean> select() {
		return this.getSession().createQuery("FROM CommentBeJudgedBean", CommentBeJudgedBean.class).list();
		
	}

	@Override
	public CommentBeJudgedBean insert(CommentBeJudgedBean bean) {

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
	public CommentBeJudgedBean update(Integer commentid, Integer memberid, String commentbejudgedreason, Integer commentbejudgedid) {
		if (commentbejudgedid != null) {
			CommentBeJudgedBean temp = this.getSession().get(CommentBeJudgedBean.class, commentbejudgedid);
			if (temp != null) {
				temp.setCommentid(commentid);
				temp.setMemberid(memberid);
				temp.setCommentbejudgedreason(commentbejudgedreason);
				temp.setCommentbejudgedid(commentbejudgedid);
				return temp;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer commentbejudgedid) {

		if (commentbejudgedid != null) {
			CommentBeJudgedBean temp = this.getSession().get(CommentBeJudgedBean.class, commentbejudgedid);
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

		CommentBeJudgedDAO dao = new CommentBeJudgedDAOHibernate(sessionFactory);
		List<CommentBeJudgedBean> beans = dao.select();
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
