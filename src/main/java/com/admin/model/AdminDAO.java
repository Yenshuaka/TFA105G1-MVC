package com.admin.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.member.model.MemberVO;
import com.product.product.model.ProductBean;

public class AdminDAO implements AdminDAOInterface {

	private SessionFactory sessionFactory;

	public AdminDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public AdminVO insert(AdminVO admin) {
		this.getSession().save(admin);
		return admin;
	}

	@Override
	public boolean delete(Integer empno) {
		if (empno != null) {
			AdminVO temp = this.getSession().get(AdminVO.class, empno);
			if (temp != null) {
				this.getSession().delete(temp);
				return true;
			}
		}
		return false;
	}

	@Override
	public AdminVO update(AdminVO admin) {
		if (admin.getEmpno() != null) {
			AdminVO temp = this.getSession().get(AdminVO.class, admin.getEmpno());
			if (temp != null) {
				temp.setEname(admin.getEname());
				temp.setAccount(admin.getAccount());
				temp.setPassword(admin.getPassword());
				return temp;
			}
		}
		return null;
	}

	@Override
	public AdminVO select(Integer empno) {
		if (empno != null) {
			return this.getSession().get(AdminVO.class, empno);
		}
		return null;
	}

	@Override
	public List<AdminVO> select() {
		return this.getSession().createQuery("FROM AdminVO", AdminVO.class).list();
	}

}
