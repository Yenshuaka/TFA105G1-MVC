package com.posttag.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.postgoodrecord.model.PostGoodRecordBean;
import com.postgoodrecord.model.PostGoodRecordDAO;
import com.postgoodrecord.model.PostGoodRecordDAOHibernate;
import com.postgoodrecord.model.PostGoodRecordService;

import model.hibernate.HibernateUtil;

public class PostTagService {

	
	private PostTagDAO postTagDAO;

	public PostTagService(PostTagDAO postTagDAO) {
		this.postTagDAO = postTagDAO;
	}

	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		PostTagDAO postTagDao = new PostTagDAOHibernate(sessionFactory);
		PostTagService postTagService = new PostTagService(postTagDao);
		List<PostTagBean> selects = postTagService.select(null);
		System.out.println("selects=" + selects);
		
		PostTagBean bean = new PostTagBean();
		bean.setPosttagid(6);
		bean.setPostid(2);
		bean.setTagid(2);
//		List<PostTagBean> bean2 = postTagService.select(bean);
//		System.out.println("selects=" + bean2);

//		postTagService.insert(bean);
		
//		postTagService.update(bean);
		
//		postTagService.delete(bean);
	
		
		transaction.commit();
		session.close();
		sessionFactory.close();
		
	}

	public List<PostTagBean> select(PostTagBean bean) {
		List<PostTagBean> result = null;
		if (bean != null && bean.getPosttagid() != null && !bean.getPosttagid().equals(0)) {
			PostTagBean temp = postTagDAO.select(bean.getPosttagid());
			if (temp != null) {
				result = new ArrayList<PostTagBean>();
				result.add(temp);
			}
		} else {
			result = postTagDAO.select();
		}
		return result;
	}

	public PostTagBean insert(PostTagBean bean) {
		PostTagBean result = null;
		if (bean != null) {
			result = postTagDAO.insert(bean);
		}
		return result;
	}

	public PostTagBean update(PostTagBean bean) {
		PostTagBean result = null;              
		if (bean != null && bean.getPosttagid() != null) {
			result = postTagDAO.update(bean.getPostid(),bean.getTagid(), bean.getPosttagid());
		}
		return result;
	}

	public boolean delete(PostTagBean bean) {
		boolean result = false;
		if (bean != null && bean.getPosttagid() != null) {
			result = postTagDAO.delete(bean.getPosttagid());
		}
		return result;
	}
}
