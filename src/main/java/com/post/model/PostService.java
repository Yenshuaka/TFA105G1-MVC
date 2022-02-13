package com.post.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.postbejudged.model.PostBeJudgedBean;
import com.postbejudged.model.PostBeJudgedDAO;
import com.postbejudged.model.PostBeJudgedDAOHibernate;
import com.postbejudged.model.PostBeJudgedService;

@Service
@Transactional
public class PostService {
	@Autowired
	private PostDAO postDAO;
	
	public PostService(PostDAO postDAO) {		
		this.postDAO = postDAO;
	}
	
	public List<PostBean> select(PostBean bean) {
		
		List<PostBean> result = null;
		if (bean != null && bean.getPostid() != null && !bean.getPostid().equals(0)) {
			PostBean temp = postDAO.select(bean.getPostid());
			if (temp != null) {
				result = new ArrayList<PostBean>();
				result.add(temp);
			}
		} else {
			result = postDAO.select();
		}
		return result;
		
		
	}
	
	
	public PostBean insert(PostBean bean) {
		PostBean result = null;
		if (bean != null) {
			result = postDAO.insert(bean);
		}
		return result;
	}

	public PostBean update(PostBean bean) {
		PostBean result = null;              
		if (bean != null && bean.getPostid() != null) {
			result = postDAO.update(bean.getMemberid(), bean.getPosttitle(), bean.getPosttypeid(),
					bean.getPostcontent(), bean.getPosttime(), bean.getPoststatus(), 
					bean.getPostrewardpoints(), bean.getPostpicture(), bean.getPostid());
		}
		return result;
	}

	public boolean delete(PostBean bean) {
		boolean result = false;
		if (bean != null && bean.getPostid() != null) {
			result = postDAO.delete(bean.getPostid());
		}
		return result;
	}
	
	
public static void main(String[] args) {
		
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		
//		PostDAO postDAO = new PostDAOHibernate(sessionFactory);
//		PostService postService = new PostService(postDAO);
//		List<PostBean> selects = postService.select(null);
//		System.out.println("selects=" + selects);
		
		PostBean bean = new PostBean();
//		bean.setPostid(11);
//		List<PostBean> bean2 = postService.select(bean);
//		System.out.println("selects=" + bean2);
		
//		bean.setMemberid(3);
//		bean.setPosttitle("測試用");
//		bean.setPosttypeid(1);
//		bean.setPostcontent("不當發言");
//		bean.setPosttime(new Timestamp(System.currentTimeMillis()));
//		bean.setPoststatus(1);
//		bean.setPostrewardpoints(5);
//		postService.insert(bean);
		
//		postService.update(bean);
		
//		postService.delete(bean);
		
//		transaction.commit();
//		session.close();
//		sessionFactory.close();
		
	}
	
	
}
