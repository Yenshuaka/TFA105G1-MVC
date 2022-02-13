package com.postcomment.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.postgoodrecord.model.PostGoodRecordBean;
import com.postgoodrecord.model.PostGoodRecordDAO;
import com.postgoodrecord.model.PostGoodRecordDAOHibernate;

import model.hibernate.HibernateUtil;

public class PostCommentDAOHibernate implements PostCommentDAO {
	
	private SessionFactory sessionFactory;

	public PostCommentDAOHibernate(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public PostCommentBean select(Integer commentid) {
		if (commentid != null) {
			return this.getSession().get(PostCommentBean.class, commentid);
		}
		return null;
	}

	@Override
	public List<PostCommentBean> select() {
		return this.getSession().createQuery("FROM PostCommentBean", PostCommentBean.class).list();
		
	}

	@Override
	public PostCommentBean insert(PostCommentBean bean) {

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
	public PostCommentBean update(Integer memberid, Integer postid, String commentcontent, Timestamp commenttime, Integer commentid) {
		if (commentid != null) {
			PostCommentBean temp = this.getSession().get(PostCommentBean.class, commentid);
			if (temp != null) {
				temp.setMemberid(memberid);
				temp.setPostid(postid);
				temp.setCommentcontent(commentcontent);
				temp.setCommenttime(commenttime);
				temp.setCommentid(commentid);
				return temp;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer commentid) {

		if (commentid != null) {
			PostCommentBean temp = this.getSession().get(PostCommentBean.class, commentid);
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

		PostCommentDAO dao = new PostCommentDAOHibernate(sessionFactory);
		List<PostCommentBean> beans = dao.select();
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
