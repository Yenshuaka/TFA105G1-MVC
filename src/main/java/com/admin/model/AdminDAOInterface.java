package com.admin.model;

import java.util.List;

import com.product.city.model.CityBean;

public interface AdminDAOInterface {
	
	public abstract AdminVO select(Integer empno);

	public abstract List<AdminVO> select();
	
	public abstract AdminVO insert(AdminVO admin);

	public abstract AdminVO update(AdminVO admin);

	public abstract boolean delete(Integer empno);

}
