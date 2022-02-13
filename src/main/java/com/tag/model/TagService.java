package com.tag.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.hibernate.HibernateUtil;

public class TagService {

	
	private TagDAO tagDAO;

	public TagService(TagDAO tagDAO) {
		this.tagDAO = tagDAO;
	}

	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		TagDAO tagDao = new TagDAOHibernate(sessionFactory);
		TagService tagService = new TagService(tagDao);
		List<TagBean> selects = tagService.select(null);
		System.out.println("selects=" + selects);
		
		TagBean bean = new TagBean();
		bean.setTagid(10);
		bean.setTagname("溫泉");
		
//		List<TagBean> bean2 = tagService.select(bean);
//		System.out.println("selects=" + bean2);
		
//		tagService.insert(bean);
		
//		tagService.update(bean);
		
		tagService.delete(bean);
		
		transaction.commit();
		session.close();
		sessionFactory.close();
		
	}

	public List<TagBean> select(TagBean bean) {
		List<TagBean> result = null;
		if (bean != null && bean.getTagid() != null && !bean.getTagid().equals(0)) {
			TagBean temp = tagDAO.select(bean.getTagid());
			if (temp != null) {
				result = new ArrayList<TagBean>();
				result.add(temp);
			}
		} else {
			result = tagDAO.select();
		}
		return result;
	}

	public TagBean insert(TagBean bean) {
		TagBean result = null;
		if (bean != null) {
			result = tagDAO.insert(bean);
		}
		return result;
	}

	public TagBean update(TagBean bean) {
		TagBean result = null;              
		if (bean != null && bean.getTagid() != null) {
			result = tagDAO.update(bean.getTagname(),bean.getTagid());
		}
		return result;
	}

	public boolean delete(TagBean bean) {
		boolean result = false;
		if (bean != null && bean.getTagid() != null) {
			result = tagDAO.delete(bean.getTagid());
		}
		return result;
	}
}
