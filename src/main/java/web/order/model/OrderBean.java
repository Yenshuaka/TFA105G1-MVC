package web.order.model;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import web.orderdetail.model.OrderdetailBean;


@Entity
@Table(name = "ordertest")

public class OrderBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ORDER_ID")
	private Integer orderid;
	@Column(name = "MEMBER_ID")
	private Integer memberid;
	@Column(name = "ORDER_DATE")
	private LocalDateTime orderdate;
	@Column(name = "ORDER_PRICE_AMOUNT")
	private Integer orderpriceamount;
	@Column(name = "USED_FUNPOINTS")
	private Integer usedfunpoints;
	

	public OrderBean() {
		super();
	}


	public OrderBean(Integer orderid, Integer memberid, LocalDateTime orderdate, Integer orderpriceamount,
			Integer usedfunpoints) {
		super();
		this.orderid = orderid;
		this.memberid = memberid;
		this.orderdate = orderdate;
		this.orderpriceamount = orderpriceamount;
		this.usedfunpoints = usedfunpoints;
	}
	
	@Override
	public String toString() {
		return "OrderBean [orderid=" + orderid + ", memberid=" + memberid + ", orderdate=" + orderdate
				+ ", orderpriceamount=" + orderpriceamount + ", usedfunpoints=" + usedfunpoints + "]";
	}


	public Integer getOrderid() {
		return orderid;
	}


	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}


	public Integer getMemberid() {
		return memberid;
	}


	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}


	public LocalDateTime getOrderdate() {
		return orderdate;
	}



	public Integer getOrderpriceamount() {
//		OrderdetailBean bean = new OrderdetailBean();
//		return bean.getProductprice();
		
		return orderpriceamount;
		
	}


	public void setOrderpriceamount(Integer orderpriceamount) {
		this.orderpriceamount = orderpriceamount;
	}


	public Integer getUsedfunpoints() {
		return usedfunpoints;
	}


	public void setUsedfunpoints(Integer usedfunpoints) {
		this.usedfunpoints = usedfunpoints;
	}


	public void setOrderdate(LocalDateTime orderdate) {
		this.orderdate = orderdate;
		
	}

	
	
}
