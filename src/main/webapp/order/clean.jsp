<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--Preloader starts-->
	<!-- <div class="preloader js-preloader">
        <img src="images/preloader.gif" alt="...">
    </div> -->
	<!--Preloader ends-->
	<!--Page Wrapper starts-->
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/order.do">
		<div class="page-wrapper">
			<!--header starts-->
			<%@ include file="/download/file/FS_Header.file"%>
			<!--Header ends-->
			<!--Hero section starts-->

			<div class="buyer_board">
				<div class="txt">訂購人資料</div>
				<hr>
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="form_group">

							<%
							MemberVO member = (MemberVO) session.getAttribute("member");
							List<MemberVO> allMember = (List<MemberVO>) session.getAttribute("allMember");
							String lastname = null;
							Integer sum = 0;
							Integer productprice = 0;

							for (int i = 0; i < allMember.size(); i++) {
								if (member.getMemberid() == allMember.get(i).getMemberid()) {
									lastname = allMember.get(i).getLastname();
								}
							}
							String firstname = null;
							for (int i = 0; i < allMember.size(); i++) {
								if (member.getMemberid() == allMember.get(i).getMemberid()) {
									firstname = allMember.get(i).getFirstname();
								}
							}
							String memberid = null;
							for (int i = 0; i < allMember.size(); i++) {
								if (member.getMemberid() == allMember.get(i).getMemberid()) {
									memberid = allMember.get(i).getIdno();
								}
							}
							String phone = null;
							for (int i = 0; i < allMember.size(); i++) {
								if (member.getMemberid() == allMember.get(i).getMemberid()) {
									phone = allMember.get(i).getPhone();
								}
							}
							String email = null;
							for (int i = 0; i < allMember.size(); i++) {
								if (member.getMemberid() == allMember.get(i).getMemberid()) {
									email = allMember.get(i).getEmail();
								}
							}
							%>


							<label>姓氏<span class="require_mark">*</span></label> <br> <input
								type="text" name="memberLastname" class="form_control"
								id="book_last_name" value="<%=lastname%>">
						</div>
						<div class="form_group">
							<label>名字<span class="require_mark">*</span></label> <br> <input
								type="text" name="memberFirstname" class="form_control"
								id="book_first_name" value="<%=firstname%>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="form_group">
							<label>身分證號碼 <span class="require_mark">*</span><br></label>
							<br> <input type="text" name="memberIdno"
								class="form_control" id="book_id" value="<%=memberid%>">
						</div>
						<div class="form_group">
							<label>連絡電話<span class="require_mark">*</span><br></label> <br>
							<input value="<%=phone%>" type="text" name="memberPhone"
								class="form_control" id="contact_phone">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="email_move">
						<label>電子郵件信箱<span class="require_mark">*</span><br></label>
						<br> <input value="<%=email%>" type="email"
							name="memberEmail" class="form_control_email">
						<div class="tip_text_danger">請輸入正確的Email的格式！</div>
					</div>

				</div>
				<div class="update_member">
					<input type="checkbox" id="update_member_id"> 同時更新會員資料
				</div>
				<!-- 				<div> -->
				<!-- 					<input type="submit" -->
				<!-- 						value="更新" class="btn_primary"> <input type="hidden" -->
				<!-- 						name="action" value="update"> -->
				<!-- 				</div>  -->
				<!-- 				</form> -->
			</div>




			<%
			List<ProductBean> productBeans = (List<ProductBean>) session.getAttribute("products");
			List<ProductBean> products = (List<ProductBean>) session.getAttribute("allProducts");
			List<Integer> imgids = (List<Integer>) session.getAttribute("imgids");
			%>

			<%
			for (int i = 0; i < productBeans.size(); i++) {
			%>

			<%
			String productname = null;
			for (int j = 0; j < products.size(); j++) {
				if (productBeans.get(i).getProductid() == products.get(j).getProductid()) {
					productname = products.get(j).getProductname();
				}
			}
			%>

			<%
			java.sql.Date startdate = null;
			for (int j = 0; j < products.size(); j++) {
				if (productBeans.get(i).getProductid() == products.get(j).getProductid()) {
					startdate = products.get(j).getStartdate();
				}
			}
			%>

			<%
			java.sql.Date enddate = null;
			for (int j = 0; j < products.size(); j++) {
				if (productBeans.get(i).getProductid() == products.get(j).getProductid()) {
					enddate = products.get(j).getEnddate();
				}
			}
			%>

			<div class="traveler_Infor">


				<div class="traveler_board">
					<div class="sub_title_traveler">旅客資料</div>
					<div>
						<img class="pic"
							src="<%=request.getContextPath()%>/ProductImageReader?imgid=<%=imgids.get(i)%> "
							alt="#">
					</div>
					<div class=product_intro>
						<div class="productname1">
							<%=productname%>
						</div>
						<div class=date>
							<div>
								開始日期:
								<%=startdate%>
							</div>
							<div>
								結束日期:
								<%=enddate%>
							</div>
						</div>
					</div>
					<hr>
					<div class="sub_title1">團員人數</div>
					<br> <label style="margin-left: 10px">人數</label><span
						class="require_mark">*</span><br> <select
						style="margin-left: 10px" name="numberoftraveler"
						id="<%=productname%>" class="numberoftraveler <%=productname%>"
						productname="<%=productname%>">
						<option disabled="disabled" selected>請選擇</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>

					</select> <input type="hidden" productname="<%=productname%>"
						value="<%=productprice%>"></input>
					<div class="tmp">
						<div class="traveler_infor">
							<div class="txt">
								旅客
								<button class="btn_ex" type="button" onclick="clear_info(this);">清空</button>
							</div>
							<div class="same_person">
								<select class="same_traveler" idtarget='0'>
									<option selected>請選擇</option>
									<option value="same">同訂購人資料</option>
								</select>
							</div>

							<div class="form_group">
								<label>出生日期 <span class="require_mark">*</span><br></label>
								<br> <input type="text" name="birthday" class="birthday"
									id="f_date1">
								<div class="tip_text_danger">此欄位必填</div>
							</div>
							<div class="form_group">
								<label style="margin-left: 10px">性別 <span
									class="require_mark">*</span><br></label> <br> <select
									name="gender" class="traveler_gender" id="traveler_gender">
									<option selected>請選擇</option>
									<option value="男">男生</option>
									<option value="女">女生</option>
								</select>
								<div class="tip_text_danger">此欄位必填</div>
							</div>
							<div class="form_group">
								<label>證件號碼(護照/身分證) <span class="require_mark">*</span><br></label>
								<br> <input type="text" name="idno" class="traveler_id"
									id="traveler_id">
								<div class="tip_text_danger">此欄位必填</div>
							</div>
							<div class="form_group">
								<label style="margin-left: 10px">姓氏<span
									class="require_mark">*</span><br></label> <br> <input
									style="margin-left: 10px" type="text" name="lastname"
									class="traveler_last_name" id="traveler_last_name${i}">
								<div class="tip_text_danger">此欄位必填</div>
							</div>
							<div class="form_group">
								<label>名字</label><span class="require_mark">*</span><br> <input
									type="text" name="firstname" class="traveler_first_name"
									id="traveler_first_name">
								<div class="tip_text_danger">此欄位必填</div>
							</div>
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

					<!-- 				<div class="sub_title">緊急聯絡人</div> -->
					<!-- 				<div class="urgent_board"> -->
					<!-- 					<div class="form_group"> -->
					<!-- 						<label>聯絡人姓</label><span class="require_mark">*</span><br>  -->
					<!-- 						<input type="text" name="urgent_last_name" class="form_control"> -->
					<!-- 						<div class="tip_text_danger">此欄位必填</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="form_group"> -->
					<!-- 						<label>聯絡人名</label><span class="require_mark">*</span><br> -->
					<!-- 						<input -->
					<!-- 							type="text" name="urgent_first_name" class="form_control"> -->
					<!-- 						<div class="tip_text_danger">此欄位必填</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="form_group"> -->
					<!-- 						<label>連絡電話</label><span class="require_mark">*</span><br> -->
					<!-- 						 <input type="text" name="urgent_phone" class="form_control" -->
					<!-- 							id="urgent_phone"> -->
					<!-- 						<div class="tip_text_danger">此欄位必填</div> -->
					<!-- 					</div> -->
					<!-- 				</div> -->

					<div class="sub_title">特殊需求備註</div>
					<textarea id="booking_note" name="specialneeds"
						class="note_control" maxlength="900" rows="3"
						placeholder="此欄位僅限資料備註。不在商品規範內的個人需求，不保證提供。"></textarea>

				</div>
			</div>
			<%
			}
			%>
			<div class="pay_board">

				<div class="board_card" id="payment_board1">
					<ul class="list">

						<li><a class="link_title" href="#"> ★ 請選擇付款方式
								<button type="button" class="switch_btn">
									<span class="-plus">+</span><span class="-minus">-</span>
								</button>

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

				<div class="board_card" id="payment_board2">
					<ul class="list">

						<li><a class="link_title1" href="#"> ★ 電子發票
								<button type="button" class="switch_btn">
									<span class="-plus">+</span><span class="-minus">-</span>
								</button>

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

				<div class="board_card" id="payment_board3">
					<ul class="list">

						<li><a class="link_title2" href="#"> ★ 付款明細
								<button type="button" class="switch_btn">
									<span class="-plus">+</span><span class="-minus">-</span>
								</button>

						</a>
							<div class="inner_block2">

								<table>

									<%
									for (int i = 0; i < productBeans.size(); i++) {
										String productname = null;
										for (int j = 0; j < products.size(); j++) {
											if (productBeans.get(i).getProductid() == products.get(j).getProductid()) {
										productname = products.get(j).getProductname();
											}
										}
										for (int k = 0; k < products.size(); k++) {
											if (productBeans.get(i).getProductid() == products.get(k).getProductid()) {
										productprice = products.get(k).getProductprice();
											}
										}
										sum += productprice;
									%>
									<div class="<%=productname%>">
										<img class="pic_bottom"
											src="<%=request.getContextPath()%>/ProductImageReader?imgid=<%=imgids.get(i)%> "
											alt="#">
										<div class="cart_detail">
											<div class="product_detail" value="">
												<%=productname%>
												<span class="pull_right1">TWD <%=productprice%></span>
											</div>

											<div class="startdate" name="startdate" value="2021-12-31">
											</div>
											<div class="price_detail">
												<div class="pull_left">
													人數 x
													<p class="numberperson <%=productname%>"></p>
												</div>
												<div>
													<input type="hidden" class="unitprice"
														value="<%=productprice%>"> 總金額<span
														class="pull_right">
														<p class="total <%=productname%>"></p>
													</span>
													<hr>
												</div>

											</div>
										</div>
									</div>


									<!-- 								<tr> -->

									<!-- 									<td>商品名稱:</td> -->
									<!-- 									<td><input class="input_add" type="TEXT" -->
									<%-- name="productname"
																							size="45"
																							value="<%=productname%>" />
																						</td>
																						--%>
									<!-- 								</tr> -->


									<!-- 								<tr> -->
									<!-- 									<td>出發日期:</td> -->
									<!-- 									<td><input class="input_add" name="startdate" type="text" -->
									<!-- 										value="2021-12-31" /></td> -->

									<!-- 								</tr> -->
									<!-- 								<tr> -->
									<!-- 									<td>商品金額:</td> -->
									<!-- 									<td><input class="input_add" type="TEXT" -->
									<%-- name="productprice"
																							size="45"
																							value="<%=productprice%>" />
																						</td>
																						--%>
									<!-- 								</tr> -->

									<input class="input_add" type="hidden" name="productid"
										size="45" value="<%=productBeans.get(i).getProductid()%>" />

									<input class="input_add" type="hidden" name="productprice"
										size="45" value="<%=productBeans.get(i).getProductprice()%>" />

									<input class="input_add" type="hidden" name="imgid" size="45"
										value="<%=imgids.get(i)%>" />



									<%
									}
									%>

								</table>
							</div></li>
					</ul>
				</div>

				<%
				Integer size = productBeans.size();
				%>

			</div>

			<div class="board2" id="payment_board">
				<div class="gray_text2">
					<p class="amount"></p>
					<%=size%>
					件商品合計<span class="amount" name="orderpriceamount" value="<%=sum%>">TWD
						<%=sum%>
					</span> <input type="submit" value="確認付款" class="btn_ex1"> <input
						type="hidden" name="action" value="insert">
				</div>
				<input class="input_add" type="hidden" name="orderpriceamount"
					size="45" value="<%=sum%>" />
			</div>
	</form>
	<!--Color switcher ends-r55555->
	<!--Scripts starts-->
	<!--plugin js-->
	<script
		src="<%=request.getContextPath()%>/order/js_orderbooking/plugin.js"></script>
	<!--google maps-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!--Main js-->

	<!--Scripts ends-->
</body>
</html>