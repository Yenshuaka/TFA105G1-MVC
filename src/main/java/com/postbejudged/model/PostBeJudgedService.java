package com.postbejudged.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class PostBeJudgedService {
	
	private PostBeJudgedDAO postBeJudgedDAO;

	public PostBeJudgedService(PostBeJudgedDAO postBeJudgedDAO) {
		this.postBeJudgedDAO = postBeJudgedDAO;
	}

	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		PostBeJudgedDAO postBeJudgedDAO = new PostBeJudgedDAOHibernate(sessionFactory);
		PostBeJudgedService postBeJudgedService = new PostBeJudgedService(postBeJudgedDAO);
		List<PostBeJudgedBean> selects = postBeJudgedService.select(null);
		System.out.println("selects=" + selects);
		
		PostBeJudgedBean bean = new PostBeJudgedBean();
		bean.setPostbejudgedid(2);
		List<PostBeJudgedBean> bean2 = postBeJudgedService.select(bean);
		System.out.println("selects=" + bean2);
		
		bean.setPostbejudgedid(6);
		bean.setMemberid(1);
		bean.setPostid(1);
		bean.setPostbejudgedreason("不當發言");
//		postBeJudgedService.insert(bean);
		
//		postBeJudgedService.update(bean);
		
		postBeJudgedService.delete(bean);
		
		
		
		
		
		
		transaction.commit();
		session.close();
		sessionFactory.close();
		
	}

	public List<PostBeJudgedBean> select(PostBeJudgedBean bean) {
		List<PostBeJudgedBean> result = null;
		if (bean != null && bean.getPostbejudgedid() != null && !bean.getPostbejudgedid().equals(0)) {
			PostBeJudgedBean temp = postBeJudgedDAO.select(bean.getPostbejudgedid());
			if (temp != null) {
				result = new ArrayList<PostBeJudgedBean>();
				result.add(temp);
			}
		} else {
			result = postBeJudgedDAO.select();
		}
		return result;
	}

	public PostBeJudgedBean insert(PostBeJudgedBean bean) {
		PostBeJudgedBean result = null;
		if (bean != null) {
			result = postBeJudgedDAO.insert(bean);
		}
		return result;
	}

	public PostBeJudgedBean update(PostBeJudgedBean bean) {
		PostBeJudgedBean result = null;              
		if (bean != null && bean.getPostbejudgedid() != null) {
			result = postBeJudgedDAO.update(bean.getPostid(), bean.getMemberid(), bean.getPostbejudgedreason(), bean.getPostbejudgedid());
		}
		return result;
	}

	public boolean delete(PostBeJudgedBean bean) {
		boolean result = false;
		if (bean != null && bean.getPostbejudgedid() != null) {
			result = postBeJudgedDAO.delete(bean.getPostbejudgedid());
		}
		return result;
	}
}
