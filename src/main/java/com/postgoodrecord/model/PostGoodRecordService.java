package com.postgoodrecord.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class PostGoodRecordService {

	private PostGoodRecordDAO postGoodRecordDAO;

	public PostGoodRecordService(PostGoodRecordDAO postGoodRecordDAO) {
		this.postGoodRecordDAO = postGoodRecordDAO;
	}

	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		PostGoodRecordDAO postGoodRecordDao = new PostGoodRecordDAOHibernate(sessionFactory);
		PostGoodRecordService postGoodRecordService = new PostGoodRecordService(postGoodRecordDao);
		List<PostGoodRecordBean> selects = postGoodRecordService.select(null);
		System.out.println("selects=" + selects);
		
		PostGoodRecordBean bean = new PostGoodRecordBean();
//		bean.setMemberid(1);
//		bean.setGoodstatus(true);
//		bean.setPostid(1);
		bean.setRecordid(2);
//		postGoodRecordService.insert(bean);
		
//		postGoodRecordService.update(bean);
		
//		postGoodRecordService.delete(bean);
		
		
		List<PostGoodRecordBean> bean2 = postGoodRecordService.select(bean);
		System.out.println("selects=" + bean2);
		
		
		
		
		transaction.commit();
		session.close();
		sessionFactory.close();
		
	}

	public List<PostGoodRecordBean> select(PostGoodRecordBean bean) {
		List<PostGoodRecordBean> result = null;
		if (bean != null && bean.getRecordid() != null && !bean.getRecordid().equals(0)) {
			PostGoodRecordBean temp = postGoodRecordDAO.select(bean.getRecordid());
			if (temp != null) {
				result = new ArrayList<PostGoodRecordBean>();
				result.add(temp);
			}
		} else {
			result = postGoodRecordDAO.select();
		}
		return result;
	}

	public PostGoodRecordBean insert(PostGoodRecordBean bean) {
		PostGoodRecordBean result = null;
		if (bean != null) {
			result = postGoodRecordDAO.insert(bean);
		}
		return result;
	}

	public PostGoodRecordBean update(PostGoodRecordBean bean) {
		PostGoodRecordBean result = null;              
		if (bean != null && bean.getRecordid() != null) {
			result = postGoodRecordDAO.update(bean.getGoodstatus(),bean.getMemberid(), bean.getPostid(), bean.getRecordid());
		}
		return result;
	}

	public boolean delete(PostGoodRecordBean bean) {
		boolean result = false;
		if (bean != null && bean.getRecordid() != null) {
			result = postGoodRecordDAO.delete(bean.getRecordid());
		}
		return result;
	}
}
