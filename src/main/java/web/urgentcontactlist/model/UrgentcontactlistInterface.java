package web.urgentcontactlist.model;

import java.util.List;


public interface UrgentcontactlistInterface {
	
	public abstract List<UrgentcontactlistBean> select();
	
	public abstract UrgentcontactlistBean insert(UrgentcontactlistBean bean);

	public abstract UrgentcontactlistBean update(Integer urgentcontactno, Integer orderdetailno,
			String urgentfirstname, String urgentlastname, String urgentphone);

	public abstract UrgentcontactlistBean findByPrimaryKey(Integer urgentcontactno);
	
	public abstract boolean delete(Integer urgentcontactno);
	
	

}
