package com.commentbejudged.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class CommentBeJudgedService {

	
	private CommentBeJudgedDAO commentBeJudgedDAO;

	public CommentBeJudgedService(CommentBeJudgedDAO commentBeJudgedDAO) {
		this.commentBeJudgedDAO = commentBeJudgedDAO;
	}

	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		CommentBeJudgedDAO commentBeJudgedDAO = new CommentBeJudgedDAOHibernate(sessionFactory);
		CommentBeJudgedService commentBeJudgedService = new CommentBeJudgedService(commentBeJudgedDAO);
		List<CommentBeJudgedBean> selects = commentBeJudgedService.select(null);
		System.out.println("selects=" + selects);
		
		CommentBeJudgedBean bean = new CommentBeJudgedBean();
		bean.setCommentbejudgedid(6);
//		List<CommentBeJudgedBean> bean2 = commentBeJudgedService.select(bean);
//		System.out.println("selects=" + bean2);
		
		bean.setMemberid(3);
		bean.setCommentid(3);
		bean.setCommentbejudgedreason("不當發言");
//		commentBeJudgedService.insert(bean);
		
//		commentBeJudgedService.update(bean);
		
		commentBeJudgedService.delete(bean);
		
		
		
		
		
		
		transaction.commit();
		session.close();
		sessionFactory.close();
		
	}

	public List<CommentBeJudgedBean> select(CommentBeJudgedBean bean) {
		List<CommentBeJudgedBean> result = null;
		if (bean != null && bean.getCommentbejudgedid() != null && !bean.getCommentbejudgedid().equals(0)) {
			CommentBeJudgedBean temp = commentBeJudgedDAO.select(bean.getCommentbejudgedid());
			if (temp != null) {
				result = new ArrayList<CommentBeJudgedBean>();
				result.add(temp);
			}
		} else {
			result = commentBeJudgedDAO.select();
		}
		return result;
	}

	public CommentBeJudgedBean insert(CommentBeJudgedBean bean) {
		CommentBeJudgedBean result = null;
		if (bean != null) {
			result = commentBeJudgedDAO.insert(bean);
		}
		return result;
	}

	public CommentBeJudgedBean update(CommentBeJudgedBean bean) {
		CommentBeJudgedBean result = null;              
		if (bean != null && bean.getCommentbejudgedid() != null) {
			result = commentBeJudgedDAO.update(bean.getCommentid(), bean.getMemberid(), bean.getCommentbejudgedreason(), bean.getCommentbejudgedid());
		}
		return result;
	}

	public boolean delete(CommentBeJudgedBean bean) {
		boolean result = false;
		if (bean != null && bean.getCommentbejudgedid() != null) {
			result = commentBeJudgedDAO.delete(bean.getCommentbejudgedid());
		}
		return result;
	}
}
