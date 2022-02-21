<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page
	import="com.order.travelerlist.model.* ,org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.Transaction "%>


<%
// SessionFactory sessionFactory = HibernateUtil.getSessionfactory();

// TravelerlistDAOHibernate travelerlistDAO = new TravelerlistDAOHibernate(sessionFactory);
// TravelerlistService travelerlistService = new TravelerlistService(travelerlistDAO);

// List<TravelerlistBean> list = travelerlistService.select(null);
// request.setAttribute("list",list);
%>

<html>
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

<link href="<%=request.getContextPath()%>/order/css/plugin.css"
	rel="stylesheet" />
<!-- Perfect scrollbar CSS-->
<link
	href="<%=request.getContextPath()%>/order/css/perfect-scrollbar.css"
	rel="stylesheet">
<!-- style CSS -->
<link href="<%=request.getContextPath()%>/order/css/style.css"
	rel="stylesheet" />
<!-- Dashboard CSS -->
<link href="<%=request.getContextPath()%>/order/css/dashboard.css"
	rel="stylesheet" />
<!--color switcher css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/order/css/switcher/skin-aqua.css"
	media="screen" id="style-colors" />
<!-- Document Title -->
<!-- <title>listagram - Directory Listing HTML Template</title> -->
<title>團員表</title>


<style>
.viewd-item-wrap {
	padding: 30px;
}

.move {
	color: brown;
	font-weight: bold;
	text-decoration: underline;
	font-size: 16px;
}

table {
	width: 900px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

th {
	text-align: center;
	background: #0ceffe;
	padding: 5px;
	font-weight: normal;
}

td {
	text-align: center;
	background: #dcddc0;
	padding: 5px;
	font-weight: normal;
}
</style>

</head>
<body>
	<div class="page-wrapper">

		<!--Sidebar Menu Starts-->
		<aside class="menu-sidebar js-right-sidebar d-block d-lg-none">
			<div class="logo" style="background-color: rgb(32, 69, 99)">
				<a href="#"> <img src="images/f.png" alt="Listagram" />
				</a>
			</div>
			<div class="menu-sidebar__content js-scrollbar2">
				<!-- <div class="account-img">
                    <img src="images/clients/reviewer-4.png" alt="Steve Austin" />
                </div> -->
				<!-- <h4 class="name">Howdy, Steve!</h4> -->
				<nav class="navbar-sidebar2">
					<ul class="list-unstyled navbar__list">
						<li><a class="active" href="db.html"> <i
								class="ion-ios-gear-outline"></i>首頁公告
						</a></li>
						<li><a href="<%=request.getContextPath()%>/order.do"> <i
								class="ion-social-buffer-outline"></i>訂單管理
						</a></li>

						<li><a href="db-bookings.html"> <i
								class="ion-ios-copy-outline"></i>行程總覽
						</a></li>
						<li><a href="db-messages.html"> <i
								class="ion-ios-email-outline"></i>會員管理
						</a> <span class="inbox-num pending">3</span></li>

						<li><a href="db-favourites.html"> <i
								class="ion-ios-heart-outline"></i>admin管理
						</a></li>
						<li><a href="db-add-listing.html"> <i
								class="ion-ios-plus-outline"></i>論壇管理
						</a></li>
						<li><a class="js-arrow" href="#"> <i
								class="ion-ios-star-outline"></i>客服系統管理
						</a> <!-- <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="db-recieve-reviews.html">
                                        Recieved Reviews</a>
                                    <span class="inbox-num active">6</span>
                                </li>
                                <li>
                                    <a href="db-submit-reviews.html">
                                        Submitted reviews</a>
                                    <span class="inbox-num pending">8</span>
                                </li>
                            </ul> --></li>
						<!-- <li>
                            <a href="db-my-profile.html">
                                <i class="ion-ios-person-outline"></i>My profile</a>
                        </li>
                        <li>
                            <a href="db-invoices.html">
                                <i class="ion-ios-printer-outline"></i>Invoices</a>
                        </li> -->
						<li><a href="#"> <i class="ion-ios-upload-outline"></i>登出
						</a></li>
					</ul>
				</nav>
			</div>
		</aside>
		<!--Sidebar Menu ends-->

		<!--Dashboard content Wrapper starts-->
		<div class="dash-content-wrap">

			<!-- Top header starts-->
			<header class="db-top-header"
				style="background-color: rgb(32, 69, 99)">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-9 col-sm-6 col-4">
							<div class="site-navbar-wrap v2"
								style="background-color: rgb(32, 69, 99)">
								<div class="site-navbar">
									<div class="row align-items-center">
										<nav class="site-navigation float-left">
											<div class="container">
												<ul class="site-menu js-clone-nav d-none d-lg-block">
													<li class="has-children"><a href="#"
														style="color: white">首頁</a> <!-- <ul class="dropdown">
                                                    <li><a href="home-v1.html">Home Tab</a></li>
                                                    <li><a href="home-v2.html">Home Hero</a></li>
                                                    <li><a href="home-v3.html">Home Video</a></li>
                                                    <li><a href="home-v4.html">Home parallax</a></li>
                                                    <li><a href="home-v5.html">Home Classic</a></li>
                                                    <li><a href="home-v6.html">Home Map</a></li>
                                                    <li><a href="home-v7.html">Home Slider</a></li>
                                                    <li><a href="home-v8.html">Home Video Fullscreen</a></li>
                                                    <li><a href="home-v9.html">Home Hero Fullscreen</a></li>
                                                    <li><a href="home-v10.html">Home Map Fullscreen</a></li>
                                                </ul> --></li>
													<li class="has-children"><a href="#"
														style="color: white">產品分類</a>
														<ul class="dropdown">
															<li><a href="home-v1.html">一日遊</a></li>
															<li><a href="home-v2.html">多日遊</a></li>
															<li><a href="home-v3.html">包車</a></li>
															<li><a href="home-v4.html">熱門票卷</a></li>
															<li><a href="home-v5.html">獨特體驗</a></li>
															<!-- <li class="has-children">
                                                        <a href="#">List Layout</a>
                                                        <ul class="dropdown sub-menu">
                                                            <li><a href="list-fullwidth.html">Full Width</a></li>
                                                            <li><a href="list-fullwidth-map.html">Fullwidth with map</a></li>
                                                            <li><a href="list-left-sidebar.html">Left Sidebar</a></li>
                                                            <li><a href="list-right-sidebar.html">Right Sidebar</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="has-children">
                                                        <a href="#">Grid Layout</a>
                                                        <ul class="dropdown sub-menu">
                                                            <li><a href="grid-fullwidth.html">Full Width</a></li>
                                                            <li><a href="grid-fullwidth-map.html">Fullwidth with map</a></li>
                                                            <li><a href="grid-two-column.html">Grid two column</a></li>
                                                            <li><a href="grid-left-sidebar.html">Left Sidebar</a></li>
                                                            <li><a href="grid-right-sidebar.html">Right Sidebar</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="has-children">
                                                        <a href="#">Map sidebar Layout</a>
                                                        <ul class="dropdown sub-menu">
                                                            <li><a href="list-left-sidemap.html">List Left sidemap</a></li>
                                                            <li><a href="list-right-sidemap.html">List Right sidemap</a></li>
                                                            <li><a href="grid-left-sidemap.html">grid Left sidemap</a></li>
                                                            <li><a href="grid-right-sidemap.html">grid Right sidemap</a></li>
                                                            <li><a href="grid-search-half-map.html">advanced search</a></li>
                                                            <li><a href="grid-search-half-map.html">advanced search</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="has-children">
                                                        <a href="#">Category Listings</a>
                                                        <ul class="dropdown sub-menu">
                                                            <li><a href="all-categories.html">All Category</a></li>
                                                            <li><a href="all-locations.html">All Locations</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="has-children">
                                                        <a href="#">Listing Details</a>
                                                        <ul class="dropdown sub-menu">
                                                            <li><a href="single-listing-one.html">Single Listing one</a></li>
                                                            <li><a href="single-listing-two.html">Single Listing two</a></li>
                                                            <li><a href="single-listing-three.html">Single Listing three</a></li>
                                                            <li><a href="single-listing-four.html">Single Listing four</a></li>
                                                            <li><a href="single-listing-five.html">Single Listing five</a></li>
                                                        </ul>
                                                    </li> -->
														</ul></li>
													<li class="has-children"><a href="#"
														style="color: white">論壇</a> <!-- <ul class="dropdown">
                                                    <li><a href="about.html">About us</a></li>
                                                    <li><a href="contact.html">Contact us</a></li>
                                                    <li class="has-children">
                                                        <a href="#">News Layout</a>
                                                        <ul class="dropdown sub-menu">
                                                            <li><a href="news-left-sidebar.html">News Left sidebar</a></li>
                                                            <li><a href="news-right-sidebar.html">News right sidebar</a></li>
                                                            <li><a href="news-without-sidebar.html">News without sidebar</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="has-children">
                                                        <a href="#">Single News Layout</a>
                                                        <ul class="dropdown sub-menu">
                                                            <li><a href="single-news-one.html">Single News one</a></li>
                                                            <li><a href="single-news-two.html">Single News two</a></li>
                                                            <li><a href="single-news-three.html">Single News three</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="404-page.html">404 error</a></li>
                                                    <li><a href="add-listing.html">Add Listing</a></li>
                                                    <li><a href="booking.html">Booking Page</a></li>
                                                    <li><a href="booking-confirmation.html">Booking Confirmation</a></li>
                                                    <li><a href="login.html">Login</a></li>
                                                    <li><a href="pricing-table.html">Pricing Table</a></li>
                                                    <li><a href="user-profile.html">User profile</a></li>
                                                    <li><a href="faq.html">FAQ</a></li>
                                                    <li><a href="invoice.html">invoice</a></li>
                                                </ul> --></li>
													<li class="has-children"><a href="#"
														style="color: white">會員專區</a> <!-- <ul class="dropdown">
                                                    <li><a href="db.html">Dashboard</a></li>
                                                    <li><a href="db-my-listing.html">My Listings</a></li>
                                                    <li><a href="db-bookings.html">Bookings</a></li>
                                                    <li><a href="db-messages.html">Inbox</a></li>
                                                    <li><a href="db-favourites.html">Favourite Listing</a></li>
                                                    <li><a href="db-add-listing.html">Add Listing</a></li>
                                                    <li><a href="db-recieve-reviews.html">Reviews</a></li>
                                                    <li><a href="db-my-profile.html">User Profile</a></li>
                                                    <li><a href="db-invoices.html">Invoices </a></li>

                                                </ul> --></li>

													<li class="d-lg-none"><a class="btn v1"
														href="add-listing.html">Add Listing <i
															class="ion-plus-round"></i></a></li>
												</ul>
											</div>
										</nav>
										<div class="d-lg-none sm-right">
											<a href="#" class="mobile-bar js-menu-toggle"> <span
												class="ion-android-menu"></span>
											</a>
										</div>
									</div>
								</div>
								<div class="site-mobile-menu">
									<div class="site-mobile-menu-header">
										<div class="site-mobile-menu-close  js-menu-toggle">
											<span class="ion-ios-close-empty"></span>
										</div>
									</div>
									<div class="site-mobile-menu-body"></div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-8">
							<img src="images/f.png" alt="">
						</div>
						<!-- <div class="col-md-3 col-sm-6 col-8">
                            <div class="header-button">
                                <div class="header-button-item has-noti js-item-menu"> -->
						<!-- <i class="ion-ios-bell-outline"></i> -->
						<!-- <div class="notifi-dropdown js-dropdown">
                                        <div class="notifi__title">
                                            <p>You have 2 Notifications</p>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c1 red">
                                                <i class="icofont-check"></i>
                                            </div>
                                            <div class="content">
                                                <p>Your listing <b>Hotel Ocean Paradise</b> has been approved!</p>
                                                <span class="date">5min ago</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c1 green"> -->
						<!-- <i class="icofont-ui-message"></i>
                                            </div>
                                            <div class="content">
                                                <p>You have 3 unread Messages</p>
                                                <span class="date">5min ago</span>
                                            </div>
                                        </div>
                                        <div class="notify-bottom text-center pad-tb-20">
                                            <a href="#">View All Notification</a>
                                        </div> -->
						<!-- </div>
                                </div>
                                <div class="header-button-item js-sidebar-btn">
                                    <img src="images/clients/reviewer-4.png" alt="...">
                                    <span>Steve <i class="ion-arrow-down-b"></i></span>
                                </div>
                                <div class="setting-menu js-right-sidebar d-none d-lg-block">
                                    <div class="account-dropdown__body">
                                        <div class="account-dropdown__item">
                                            <a href="db.html"> -->
						<!-- <i class="ion-ios-gear-outline"></i>Dashboard</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="db-my-listing.html">
                                                <i class="ion-social-buffer-outline"></i>Listings</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="db-bookings.html">
                                                <i class="ion-ios-copy-outline"></i>Bookings</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="db-recieve-reviews.html">
                                                <i class="ion-ios-star-outline"></i>Reviews</a> -->
						<!-- </div>
                                        <div class="account-dropdown__item">
                                            <a href="db-messages.html">
                                                <i class="ion-ios-email-outline"></i>Inbox</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="db-my-profile.html">
                                                <i class="ion-ios-person-outline"></i>Profile</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="#"> -->
						<!-- <i class="ion-ios-upload-outline"></i>Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
					</div>
				</div>
			</header>
			<!-- Top header ends-->

			<!--Dashboard breadcrumb starts-->
			<div class="dash-breadcrumb">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="dash-breadcrumb-content">
								<div class="dash-breadcrumb-left">
									<div class="breadcrumb-menu text-right sm-left">
										<ul>
											<li class="active"><a href="#">Home</a></li>
											<li class="active"><a
												href="<%=request.getContextPath()%>/order.do">訂單首頁</a></li>
											<li class="active"><a href="listOneOrderdetail.jsp">訂單明細</a></li>
											<li>團員表</li>
										</ul>
									</div>
								</div>
								<!-- <a class="btn v3" href="add-listing.html"><i class="ion-plus-round"></i>Add Listing </a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Dashboard breadcrumb ends-->

			<!-- Dashboard Content starts-->
			<div class="dash-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="recent-activity my-listing">
								<div class="act-title">
									<h5>
										<i class="ion-social-buffer-outline"></i> 團員表
									</h5>
								</div>

								<div class="viewd-item-wrap">
									<h4>
										<a class="move" href="listAllOrder.jsp">回訂單首頁</a>
									</h4>

									<table>
										<tr>
											<th>團員編號</th>
											<th>訂單明細編號</th>
											<th>姓</th>
											<th>名</th>
											<th>性別</th>
											<th>出生日期</th>
											<th>身分證字號</th>
											<th>修改</th>
											<th>刪除</th>
										</tr>

										<c:forEach var="travelerlistBean" items="${list}">

											<tr>

												<td>${travelerlistBean.travelerlistno}</td>
												<td>${travelerlistBean.orderdetailno}</td>
												<td>${travelerlistBean.lastname}</td>
												<td>${travelerlistBean.firstname}</td>
												<td>${travelerlistBean.gender}</td>
												<td>${travelerlistBean.birthday}</td>
												<td>${travelerlistBean.idno}</td>


												<td>
													<FORM METHOD="post"
														ACTION="<%=request.getContextPath()%>/travelerlist.do"
														style="margin-bottom: 0px;">
														<input type="submit" value="修改" class="btn v2"> <input
															type="hidden" name="travelerlistno"
															value="${travelerlistBean.travelerlistno}"> <input
															type="hidden" name="action" value="getOne_For_Update">
													</FORM>
												</td>
												<td>
													<FORM METHOD="post"
														ACTION="<%=request.getContextPath()%>/travelerlist.do"
														style="margin-bottom: 0px;">
														<input type="submit" value="刪除" class="btn v5"　id="delete"> <input
															type="hidden" name="travelerlistno"
															value="${travelerlistBean.travelerlistno}"> <input
															type="hidden" name="action" value="delete">
													</FORM>
												</td>
											</tr>
										</c:forEach>
									</table>



								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- Dashboard Content ends-->

			<!--Dashboard footer starts-->
			<div class="dash-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="copyright">
								<p>© 2019 Listagram . All rights reserved.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Dashboard footer ends-->
		</div>
		<!--Dashboard content Wrapper ends-->

	</div>
	<!-- Plugin JS-->
	<script src="<%=request.getContextPath()%>/order/js/plugin.js"></script>
	<!--Perfect Scrollbar JS-->
	<script
		src="<%=request.getContextPath()%>/order/js/perfect-scrollbar.min.js"></script>
	<!-- Main JS-->
	<script src="<%=request.getContextPath()%>/order/js/main.js"></script>
	<!-- Dashboard JS-->
	<script src="<%=request.getContextPath()%>/order/js/dashboard.js"></script>

	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>

	<script>
		$("#delete").on("click", function() {
			var yes = confirm("你確定要刪除嗎?")

		})
	</script>
</body>
</html>