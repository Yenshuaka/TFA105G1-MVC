package web.urgentcontactlist.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "urgent_contact_list")
public class UrgentcontactlistBean {
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "URGENT_CONTACT_NO")
	private Integer urgentcontactno;
	@Column(name = "ORDER_DETAIL_NO")
	private Integer orderdetailno;
	@Column(name = "URGENT_FIRST_NAME")
	private String urgentfirstname;
	@Column(name = "URGENT_LAST_NAME")
	private String urgentlastname;
	@Column(name = "URGENT_PHONE")
	private String urgentphone;
	
	public Integer getUrgentcontactno() {
		return urgentcontactno;
	}

	public void setUrgentcontactno(Integer urgentcontactno) {
		this.urgentcontactno = urgentcontactno;
	}

	public Integer getOrderdetailno() {
		return orderdetailno;
	}

	public void setOrderdetailno(Integer orderdetailno) {
		this.orderdetailno = orderdetailno;
	}

	public String getUrgentfirstname() {
		return urgentfirstname;
	}

	public void setUrgentfirstname(String urgentfirstname) {
		this.urgentfirstname = urgentfirstname;
	}

	public String getUrgentlastname() {
		return urgentlastname;
	}

	public void setUrgentlastname(String urgentlastname) {
		this.urgentlastname = urgentlastname;
	}

	public String getUrgentphone() {
		return urgentphone;
	}

	public void setUrgentphone(String urgentphone) {
		this.urgentphone = urgentphone;
	}

	@Override
	public String toString() {
		return "UrgentcontactlistBean [urgentcontactno=" + urgentcontactno + ", orderdetailno=" + orderdetailno
				+ ", urgentfirstname=" + urgentfirstname + ", urgentlastname=" + urgentlastname + ", urgentphone="
				+ urgentphone + "]";
	}
	
	

}
