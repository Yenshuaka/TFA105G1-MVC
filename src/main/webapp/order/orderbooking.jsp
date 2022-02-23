<%@page import="com.order.travelerlist.model.TravelerlistBean"%>
<%@page import="com.order.orderdetail.model.OrderdetailService"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.order.orderdetail.model.OrderdetailBean"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.* ,java.sql.*"%>
<%@ page
	import="com.order.order.model.*,com.order.orderdetail.model.*, org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.Transaction "%>
<!DOCTYPE html>

<html dir="ltr" lang="en-US">

<head>
<!-- Metas -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="LionCoders" />
<!-- Links -->
<link rel="icon" type="image/png" href="#" />
<!-- google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800"
	rel="stylesheet">
<!-- Plugins CSS -->
<link href="<%=request.getContextPath()%>/order/css_orderbooking/plugin.css" rel="stylesheet" />
<!-- style CSS -->
<link href="<%=request.getContextPath()%>/order/css_orderbooking/style.css" rel="stylesheet" />
<!--color switcher css-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/order/css_orderbooking/switcher/skin-red.css"
	media="screen" id="style-colors" />
<!-- Document Title -->
<!-- <title>listagram - Directory Listing HTML Template</title> -->
<title>Fun心遊台灣 - 開始探索</title>
</head>
<!-- 21, 39, 34, 47-59, 63-128, 132-162, 166-177, 181-192, 197, 221, 228, 232, 283-293, 239, 245, 257 -->
<!-- style.css 1575-1585-->

<style>


.btn_primary {
    margin-left: 15px;
}

.buyer_board {
height:500px;

}

.traveler_infor {

height:480px;

}

ul.list>li>div.inner_block2 {
	height: 300px;

}
.input_add {
	width: 250px;
	height: 30px;
	padding: 10px 12px;
	border: 1px solid #ccc;
	border-radius: 10px;
}

td{
padding:10px;
}
</style>

<body>
	<!--Preloader starts-->
	<!-- <div class="preloader js-preloader">
        <img src="images/preloader.gif" alt="...">
    </div> -->
	<!--Preloader ends-->
	<!--Page Wrapper starts-->
	<div class="page-wrapper">
		<!--header starts-->
		<%@ include file="file/Header_main.file"%>
		<!--Header ends-->
		<!--Hero section starts-->
		
		
		<div class="buyer_board">
			<div class="txt">訂購人資料</div>
			<hr>
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="form_group">
							<label>姓氏<span class="require_mark">*</span></label> <br>
							<input
								type="text" name="contact_lastName" placeholder="例:王"
								class="form_control" id="book_last_name" value="王">
							<div class="tip_text_danger" id="tip_text_danger_first">此欄位必填</div>
						</div>
						<div class="form_group">
							<label>名字<span class="require_mark">*</span></label> <br> <input
								type="text" name="contact_firstName" placeholder="例:小明"
								class="form_control" id="book_first_name" value="小明">
							<div class="tip_text_danger" id="tip_text_danger_last">此欄位必填</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="form_group">
							<label>身分證號碼 <span class="require_mark">*</span><br></label>
							<br> <input type="text" name="contact_id"
								class="form_control" id="book_id" value="A1010101010">
							<div class="tip_text_danger">此欄位必填</div>
						</div>
						<div class="form_group">
							<label>連絡電話<span class="require_mark">*</span><br></label> <br>
							<input value="0928605223" type="text" name="contact_phone"
								class="form_control" id="contact_phone">
							<div class="tip_text_danger">此欄位必填</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="email_move">
						<label>電子郵件信箱<span class="require_mark">*</span><br></label>
						<br> <input value="m03272000@gmail.com" type="email"
							name="contact_email" placeholder="請輸入常用電子郵件信箱"
							class="form_control_email">
						<div class="tip_text_danger">請輸入正確的Email的格式！</div>
					</div>
				</div>
				<div class="update_member">
					<input type="checkbox" id="update_member_id"> 同時更新會員資料
				</div>
				<div>
					<button class="btn_primary">繼續</button>
				</div> 
		</div>






		<div id="traveler_Infor">
			<div class="sub_title_traveler">旅客資料</div>
			<div class="traveler_board">
				<div class="traveler_infor">
					<div class="txt">
						旅客代表人
						<button class="btn_ex">清空</button>
					</div>
					<div class="same_person">
						<select class="same_traveler">
							<option disabled="disabled" selected>請選擇</option>
							<option value="same">同訂購人資料</option>
						</select>
					</div>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do">
					<div class="form_group">
						<label>出生日期 <span class="require_mark">*</span><br></label> <br>
						<input type="text" name="birthday"
							class="form_control" id="f_date1">
						<div class="tip_text_danger">此欄位必填</div>
					</div>
					<div class="form_group">
						<label>性別 <span class="require_mark">*</span><br></label> <br>
						<select name="gender" class="form_control" id="traveler_gender">
							<!-- 							<option disabled="disabled" selected>請選擇</option> -->
							<option value="男">男生</option>
							<option value="女">女生</option>
						</select>
						<div class="tip_text_danger">此欄位必填</div>
					</div>
					<div class="form_group">
						<label>證件號碼(護照/身分證) <span class="require_mark">*</span><br></label>
						<br> <input type="text" name="idno" class="form_control"
							id="traveler_id">
						<div class="tip_text_danger">此欄位必填</div>
					</div>
					<div class="form_group">
						<label>姓氏<span class="require_mark">*</span><br></label> <br>
						<input type="text" name="lastname" class="form_control"
							id="traveler_last_name">
						<div class="tip_text_danger">此欄位必填</div>
					</div>
					<div class="form_group">
						<label>名字</label><span class="require_mark">*</span><br> 
						<input
							type="text" name="firstname" class="form_control"
							id="traveler_first_name">
						<div class="tip_text_danger">此欄位必填</div>
					</div>
				</div>

				<div class="sub_title">導覽語言</div>
				<div class="form_group">
					<label>行程導覽語言</label><span class="require_mark">*</span><br>
					<select name="" id="booking_guide_language" class="form_control">
						<option disabled="disabled" selected>請選擇</option>
						<option value="zh-tw">中文</option>
					</select>
					<div class="tip_text_danger">此欄位必填</div>
				</div>

				<div class="sub_title">緊急聯絡人</div>
				<div class="urgent_board">
					<div class="form_group">
						<label>聯絡人姓</label><span class="require_mark">*</span><br> 
						<input type="text" name="urgent_last_name" class="form_control">
						<div class="tip_text_danger">此欄位必填</div>
					</div>
					<div class="form_group">
						<label>聯絡人名</label><span class="require_mark">*</span><br>
						<input
							type="text" name="urgent_first_name" class="form_control">
						<div class="tip_text_danger">此欄位必填</div>
					</div>
					<div class="form_group">
						<label>連絡電話</label><span class="require_mark">*</span><br>
						 <input type="text" name="urgent_phone" class="form_control"
							id="urgent_phone">
						<div class="tip_text_danger">此欄位必填</div>
					</div>
				</div>

				<div class="sub_title">特殊需求備註</div>
				<textarea id="booking_note" name="specialneeds" class="note_control"
					maxlength="900" rows="3"
					placeholder="此欄位僅限資料備註。不在商品規範內的個人需求，不保證提供。"></textarea>
				 
			</div>
		</div>
		
		<div>
			<div class="sub_title_traveler">付款</div>
			<div class="board_card" id="payment_board">
				<ul class="list">

					<li><a class="link_title" href="#">
							<button type="button" class="switch_btn">
								<span class="-plus">+</span><span class="-minus">-</span>
							</button> ★ 請選擇付款方式
					</a>
						<div class="inner_block">
							<hr>
							<div class="">
								<input type="radio" class="credit"> <span
									class="chekc_box_title">信用卡/簽帳金融卡</span>
								<hr>
								<div class="form_group2">
									<label class="gray_text3">信用卡號碼</label><br> <input
										type="text" class="card_number"
										placeholder="oooo oooo oooo oooo">
								</div>
								<div class="form_group2">
									<label class="gray_text3">有效期限</label><br> <input
										type="text" class="card_number" id="expire_date"
										placeholder="MM YY">
								</div>
								<div class="form_group2">
									<label class="gray_text3">背面末3碼</label><br> <input
										type="text" class="card_number" id="back_number"
										placeholder="CVC/CVV">
								</div>
							</div>
						</div></li>

				</ul>
			</div>

			<div class="board_card" id="payment_board">
				<ul class="list">

					<li><a class="link_title1" href="#">
							<button type="button" class="switch_btn">
								<span class="-plus">+</span><span class="-minus">-</span>
							</button> ★ 電子發票
					</a>
						<div class="inner_block1">
							<hr>
							<span class="chekc_box_title">旅行業代收轉付電子收據</span><br> <select
								name="" id="receipt_id" class="form_control1">
								<option disabled="disabled" selected>請選擇</option>
								<option value="zh-tw">寄至訂購人E-mail</option>
							</select>
						</div></li>

				</ul>
			</div>

			<div class="board_card" id="payment_board">
				<ul class="list">

					<li><a class="link_title2" href="#">
							<button type="button" class="switch_btn">
								<span class="-plus">+</span><span class="-minus">-</span>
							</button> ★ 付款明細
					</a>
						<div class="inner_block2">
						<hr>
							<table>

								<tr>
									<td>商品名稱:</td>
									<td><input class="input_add" type="TEXT"
										name="productname" size="45" value="台中一日行" /></td>
								</tr>

								<tr>
									<td>出發日期:</td>
									<td><input class="input_add" name="startdate" id="f_date1"
										type="text" value="2021-12-31" /></td>

								</tr>
								<tr>
									<td>商品金額:</td>
									<td><input class="input_add" type="TEXT"
										name="productprice" size="45" value="1500" /></td>
								</tr>
								<tr>
									<td>旅客人數:</td>
									<td><input class="input_add" type="TEXT"
										name="numberoftraveler" size="45" value="2" /></td>
								</tr>
							</table>
						</div></li>
				</ul>
			</div>

			<div class="board2" id="payment_board">
				<div class="gray_text2">
					1件商品合計<span class="amount">TWD 992</span> <input type="submit"
						value="確認付款" class="btn_ex1"> <input type="hidden"
						name="action" value="insert">
				</div>
			</div>
			</FORM>
		</div>
</div>
			<!--Color switcher ends-->
			<!--Scripts starts-->
			<!--plugin js-->
			<script src="<%=request.getContextPath()%>/order/js_orderbooking/plugin.js"></script>
			<!--google maps-->
			<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
			<!--Main js-->
			<script src="<%=request.getContextPath()%>/order/js_orderbooking/main.js"></script>
			<!--Scripts ends-->
</body>

<%
TravelerlistBean travelerlistBean = new TravelerlistBean();
java.sql.Date birthday = null;
try {
	birthday = travelerlistBean.getBirthday();
} catch (Exception e) {
	birthday = new java.sql.Date(System.currentTimeMillis());
}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>


<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=birthday%> ', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
</script>
</html>