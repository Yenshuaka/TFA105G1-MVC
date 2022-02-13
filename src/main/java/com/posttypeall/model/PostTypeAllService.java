package com.posttypeall.model;

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

public class PostTypeAllService {

	
	private PostTypeAllDAO postTypeAllDAO;

	public PostTypeAllService(PostTypeAllDAO postTypeAllDAO) {
		this.postTypeAllDAO = postTypeAllDAO;
	}

	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		PostTypeAllDAO postTypeAllDao = new PostTypeAllDAOHibernate(sessionFactory);
		PostTypeAllService postTypeAllService = new PostTypeAllService(postTypeAllDao);
		List<PostTypeAllBean> selects = postTypeAllService.select(null);
		System.out.println("selects=" + selects);
		
		PostTypeAllBean bean = new PostTypeAllBean();
		bean.setPosttypeid(2);
//		bean.setPostid(2);
//		bean.setTagid(2);
//		List<PostTagBean> bean2 = postTagService.select(bean);
		System.out.println("selects=" + postTypeAllService.select(bean));

//		postTagService.insert(bean);
		
//		postTagService.update(bean);
		
//		postTagService.delete(bean);
	
		
		transaction.commit();
		session.close();
		sessionFactory.close();
		
	}

	public List<PostTypeAllBean> select(PostTypeAllBean bean) {
		List<PostTypeAllBean> result = null;
		if (bean != null && bean.getPosttypeid() != null && !bean.getPosttypeid().equals(0)) {
			PostTypeAllBean temp = postTypeAllDAO.select(bean.getPosttypeid());
			if (temp != null) {
				result = new ArrayList<PostTypeAllBean>();
				result.add(temp);
			}
		} else {
			result = postTypeAllDAO.select();
		}
		return result;
	}

	public PostTypeAllBean insert(PostTypeAllBean bean) {
		PostTypeAllBean result = null;
		if (bean != null) {
			result = postTypeAllDAO.insert(bean);
		}
		return result;
	}

	public PostTypeAllBean update(PostTypeAllBean bean) {
		PostTypeAllBean result = null;              
		if (bean != null && bean.getPosttypeid() != null) {
			result = postTypeAllDAO.update(bean.getPosttypename(),bean.getTypecount(), bean.getPosttypeid());
		}
		return result;
	}

	public boolean delete(PostTypeAllBean bean) {
		boolean result = false;
		if (bean != null && bean.getPosttypeid() != null) {
			result = postTypeAllDAO.delete(bean.getPosttypeid());
		}
		return result;
	}
}
