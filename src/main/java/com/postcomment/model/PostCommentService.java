package com.postcomment.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class PostCommentService {

	private PostCommentDAO postCommentDAO;

	public PostCommentService(PostCommentDAO postCommentDAO) {
		this.postCommentDAO = postCommentDAO;
	}

	public static void main(String[] args) {

		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();

		PostCommentDAO postCommentDAO = new PostCommentDAOHibernate(sessionFactory);
		PostCommentService postCommentService = new PostCommentService(postCommentDAO);
		List<PostCommentBean> selects = postCommentService.select(null);
		System.out.println("selects=" + selects);

		PostCommentBean bean = new PostCommentBean();
		bean.setCommentid(8);
//		List<PostCommentBean> bean2 = postCommentService.select(bean);
//		System.out.println("selects=" + bean2);

//		bean.setMemberid(3);
//		bean.setPostid(1);
//		bean.setCommentcontent("這是2則留言");
//		bean.setCommenttime(new Timestamp(System.currentTimeMillis()));
//		postCommentService.insert(bean);

//		postCommentService.update(bean);

		postCommentService.delete(bean);

		transaction.commit();
		session.close();
		sessionFactory.close();

	}

	public List<PostCommentBean> select(PostCommentBean bean) {
		List<PostCommentBean> result = null;
		if (bean != null && bean.getCommentid() != null && !bean.getCommentid().equals(0)) {
			PostCommentBean temp = postCommentDAO.select(bean.getCommentid());
			if (temp != null) {
				result = new ArrayList<PostCommentBean>();
				result.add(temp);
			}
		} else {
			result = postCommentDAO.select();
		}
		return result;
	}

	public PostCommentBean insert(PostCommentBean bean) {
		PostCommentBean result = null;
		if (bean != null) {
			result = postCommentDAO.insert(bean);
		}
		return result;
	}

	public PostCommentBean update(PostCommentBean bean) {
		PostCommentBean result = null;
		if (bean != null && bean.getCommentid() != null) {
			result = postCommentDAO.update(bean.getMemberid(), bean.getPostid(), bean.getCommentcontent(),
					bean.getCommenttime(), bean.getCommentid());
		}
		return result;
	}

	public boolean delete(PostCommentBean bean) {
		boolean result = false;
		if (bean != null && bean.getCommentid() != null) {
			result = postCommentDAO.delete(bean.getCommentid());
		}
		return result;
	}
}
