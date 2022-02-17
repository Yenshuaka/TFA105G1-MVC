<%@ page import="com.product.product.model.ProductBean"%>
<%@ page import="java.sql.*, com.product.productimg.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.*, org.springframework.context.ApplicationContext, org.springframework.web.context.WebApplicationContext"%>
<%@ page
	import="com.product.product.* , org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.Transaction "%>

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
<link href="css/plugin.css" rel="stylesheet" />
<!-- style CSS -->
<link href="css/style.css" rel="stylesheet" />
<!--color switcher css-->
<link rel="stylesheet" href="css/switcher/skin-aqua.css" media="screen"
	id="style-colors" />
<!-- Document Title -->
<title>首頁/行程總覽</title>
</head>

<body>
	<!--Preloader starts-->
	<!-- <div class="preloader js-preloader">
        <img src="images/preloader.gif" alt="...">
    </div> -->
	<!--Preloader ends-->
	<!--Page Wrapper starts-->
	<div class="page-wrapper fixed-footer">
		<!--header starts-->
		<header class="header transparent scroll-hide">
			<!--Main Menu starts-->
			<div class="site-navbar-wrap v2"
				style="background-color: rgb(32, 69, 99)">
				<div class="container">
					<div class="site-navbar">
						<div class="row align-items-center">
							<div class="col-md-4 col-6">
								<a class="navbar-brand" href="home-v2-using.html"><img
									src="images/f.png" alt="logo" class="img-fluid"></a>
							</div>
							<div class="col-md-8 col-6">
								<nav class="site-navigation float-left">
									<div class="container">
										<ul class="site-menu js-clone-nav d-none d-lg-block">
											<li class="has-children"><a href="home-v2-using.html"
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
													<li><a href="about.html">一日遊</a></li>
													<li><a href="contact.html">多日遊</a></li>
													<li><a href="about.html">包車</a></li>
													<li><a href="contact.html">熱門票卷</a></li>
													<li><a href="about.html">獨特體驗</a></li>
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
                                                        </ul>
                                                    </li>
                                                    <li class="has-children">
                                                        <a href="#">OpenStreet Map</a>
                                                        <ul class="dropdown sub-menu">
                                                            <li><a href="grid-fullwidth-leaflet-map.html">Grid Fullwidth</a></li>
                                                            <li><a href="list-fullwidth-leaflet-map.html">List FullWidth</a></li>
                                                            <li><a href="grid-left-leaflet-sidemap.html">Grid Left Sidemap</a></li>
                                                            <li><a href="list-left-leaflet-sidemap.html">List Left Sidemap</a></li>
                                                            <li><a href="grid-right-leaflet-sidemap.html">Grid Right Sidemap</a></li>
                                                            <li><a href="list-right-leaflet-sidemap.html">List Right Sidemap</a></li>
                                                            <li><a href="grid-search-half-leaflet-map.html">Advance Map Search</a></li>
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

                                                </ul>--></li>
											<li class="has-children"><a href="#"
												style="color: white">會員專區</a> <!-- <ul class="dropdown">
                                                    <li><a href="db.html">Dashboard</a></li>
                                                    <li><a href="db-my-listing.html">My Listings</a></li>
                                                    <li><a href="db-bookings.html">Bookings</a></li>
                                                    <li><a href="db-messages.html">Inbox</a></li>
                                                    <li><a href="db-favourites.html">Favourite Listing</a></li>
                                                    <li><a href="db-add-listing.html">Add Listing</a></li>
                                                    <li><a href="db-recieve-reviews.html">Reviews</a></li>
                                                    <li><a href="db-my-profile.html">User  Profile</a></li>
                                                    <li><a href="db-invoices.html">Invoices </a></li>

                                                </ul> --></li>
											<li class="has-children"><a href="#"
												style="color: white">登入/註冊</a> <!-- <ul class="dropdown">
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
								<div class="add-list float-right">
									<a class="btn v8" href="add-listing.html">購物車 <i
										class="icofont-shopping-cart">&nbsp3</i></a>
								</div>
								<!-- <div class="add-list float-right">
                                    <a class="btn v8" href="add-listing.html">Add Listing <i class="ion-plus-round"></i></a>
                                </div> -->
							</div>
						</div>
					</div>
					<!--mobile-menu starts -->
					<div class="site-mobile-menu">
						<div class="site-mobile-menu-header">
							<div class="site-mobile-menu-close  js-menu-toggle">
								<span class="ion-ios-close-empty"></span>
							</div>
						</div>
						<div class="site-mobile-menu-body"></div>
					</div>
					<!--mobile-menu ends-->
				</div>
			</div>
			<!--Main Menu ends-->
		</header>
		<!--Header ends-->
		<!--Breadcrumb section starts-->
		<div class="breadcrumb-section"
			style="background-image: url(images/sakura.jpg)">
			<div class="overlay op-5"></div>
			<div class="container">
				<div class="row align-items-center  pad-top-80">
					<div class="col-md-6 col-12">
						<div class="breadcrumb-menu">
							<h2 class="page-title">行程總覽</h2>
						</div>
					</div>
					<div class="col-md-6 col-12">
						<div class="breadcrumb-menu text-right sm-left">
							<ul>
								<li class="active"><a href="#">首頁</a></li>
								<li><a href="#">行程總覽</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Breadcrumb section ends-->
		<!--Listing Filter starts-->
		<div class="filter-wrapper style1 section-padding">
			<div class="container">
				<div class="row">
					<div class="col-xl-4 col-lg-12 option-box style1">
						<div class="filter-box style1 left">
							<div class="sidebar-title">
								<h2>篩選行程</h2>
							</div>
							<form>
								<div class="form-group filter-group">
									<input type="text" class="form-control filter-input"
										id="search-filter" name="search-bar" placeholder="搜尋關鍵字">
									<!-- <input type="text" class="form-control filter-input" id="location-filter" name="search-bar" placeholder="Location"> -->
									<select class="filter-input" id="option-select">
										<option>產品分類</option>
										<option>一日遊</option>
										<option>多日遊</option>
										<option>包車</option>
										<option>熱門票卷</option>
										<option>獨特體驗</option>
									</select>
								</div>
								<div class="filter-sub-area style1">
									<div class="filter-title  mar-top-20 mar-bot-15">
										<p>
											價錢(TWD) &nbsp&nbsp 0~<span id="value333">0</span>
										</p>

									</div>
									<div>
										<input id="range33" type="range" min="0" max="194599"
											value="0" step="10" οninput="change()" οnchange="change()">
									</div>

									<script>
										document.getElementById('range33')
												.addEventListener('change',
														change);
										function change() {

											var value = document
													.getElementById('range33').value;
											document.getElementById('value333').innerHTML = value;
										}
									</script>
<!-- 									<div id="slider-range" class="price-range mar-bot-30"></div> -->
								</div>
								<div class="filter-sub-menu style1 mar-bot-20">
 									<ul> 
 										<li class="has-sub"><a href="# ">更多篩選</a> 
											<ul class="explore__form-checkbox-list half-filter">
												<div class="filter-checkbox">
													<p>行程時間</p>
													<li><input id="check-a" type="checkbox" name="check">
														<label for="check-a">少於4小時</label></li>
													<li><input id="check-b" type="checkbox" name="check">
														<label for="check-b">4小時~1天</label></li>
													<li><input id="check-c" type="checkbox" name="check">
														<label for="check-c">1天~2天</label></li>
													<li><input id="check-d" type="checkbox" name="check">
														<label for="check-d">大於兩天</label></li>
 													<li><input id="check-f" type="checkbox" name="check">
                                                        <label for="check-f">Events</label></li> 
                                                    <li><input id="check-e" type="checkbox" name="check"> 
                                                         <label for="check-e">Free Wifi</label></li> 
												</div>
												<div class="filter-checkbox">
													<p>依評價篩選</p>
													<div>
														<input id="check-w" type="checkbox" name="check">
														<label for="check-w"> </label>
														<div class="list-ratings">
															<span class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star"></span>
														</div>
													</div>
													<div>
														<input id="check-x" type="checkbox" name="check">
														<label for="check-x"> </label>
														<div class="list-ratings">
															<span class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star-outline"></span>
														</div>
													</div>
													<div>
														<input id="check-y" type="checkbox" name="check">
														<label for="check-y"> </label>
														<div class="list-ratings">
															<span class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star-outline"></span> <span
																class="ion-android-star-outline"></span>
														</div>
													</div>
													<div>
														<input id="check-z" type="checkbox" name="check">
														<label for="check-z"> </label>
														<div class="list-ratings">
															<span class="ion-android-star"></span> <span
																class="ion-android-star"></span> <span
																class="ion-android-star-outline"></span> <span
																class="ion-android-star-outline"></span> <span
																class="ion-android-star-outline"></span>
														</div>
													</div>
												</div>
												<div class="filter-checkbox">
													<p>Sort By tags</p>
													<input id="check-ab" type="checkbox" name="check">
													<label for="check-ab">Hotel</label> <input id="check-bc"
														type="checkbox" name="check"> <label
														for="check-bc">Restaurant</label> <input id="check-cd"
														type="checkbox" name="check"> <label
														for="check-cd">sports</label> <input id="check-df"
														type="checkbox" name="check"> <label
														for="check-df">travel </label>
												</div>
											</ul></li>
<!-- 									</ul> -->
								</div>
								<button type="submit" class="btn v1">搜尋</button>
							</form>
						</div>
					</div>
					<div class="col-xl-8 col-lg-12">
						<div class="row pad-bot-30 align-items-center">
							<div class="col-lg-4 col-sm-4 col-12">
								<div class="item-view-mode res-box">
									<!-- item-filter-list start -->
									<ul class="nav item-filter-list" role="tablist">
<!-- 										<<li><a data-toggle="tab" href="#grid-view"><i class="ion-grid"></i></a></li> -->
<!--                                         <li><a class="active" data-toggle="tab" href="#list-view"><i class="ion-ios-list"></i></a></li> --> 
									</ul>
									<!-- item-filter-list end -->
								</div>
							</div>
							<div class="col-lg-8 col-sm-8 col-12">
								<div class="item-element res-box  text-right xs-left">
									<p>
										共 <span>2748</span> 項行程
									</p>
								</div>
							</div>
						</div>
<!-- 						<div class="item-wrapper"> -->
<!-- 							<div class="tab-content"> -->
								<div id="grid-view" class="tab-pane product-grid">
									<div class="row">


										                                        <!-- <div class="col-lg-6 col-md-12 col-12"> -->
										<!--                                             <div class="trending-place-item"> -->
										<!--                                                 <div class="trending-img"> -->
										<!--                                                     <img src="images/category/places/place-1.jpg" alt="#"> -->
										<!--                                                     <span class="trending-rating-green">7</span> -->
										<!--                                                     <span class="save-btn"><i class="icofont-heart"></i></span> -->
										<!--                                                 </div> -->
										<!--                                                 <div class="trending-title-box"> -->
										<!--                                                     <h4><a href="single-listing-one.html">Four Seasons Resort</a></h4> -->
										<!--                                                     <div class="customer-review"> -->
										<!--                                                         <div class="rating-summary float-left"> -->
										<!--                                                             <div class="rating-result" title="60%"> -->
										<!--                                                                 <ul class="product-rating"> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                 </ul> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="review-summury float-right"> -->
										<!--                                                             <p><a href="#">3 Reviews</a></p> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                     <ul class="trending-address"> -->
										<!--                                                         <li><i class="ion-ios-location"></i> -->
										<!--                                                             <p>4210 Khale Street,Florence,USA</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-ios-telephone"></i> -->
										<!--                                                             <p>+843-600-2040</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-android-globe"></i> -->
										<!--                                                             <p>www.laresorta.com</p> -->
										<!--                                                         </li> -->
										<!--                                                     </ul> -->
										<!--                                                     <div class="trending-bottom mar-top-15 pad-bot-30"> -->
										<!--                                                         <div class="trend-left float-left"> -->
										<!--                                                             <span class="round-bg pink"><i class="icofont-hotel"></i></span> -->
										<!--                                                             <p><a href="#">Hotel</a></p> -->

										<!--                                                         </div> -->
										<!--                                                         <div class="trend-right float-right"> -->
										<!--                                                             <div class="trend-open"><i class="ion-clock"></i> -->
										<!--                                                                 Open <p>till 11.00pm</p> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                 </div> -->
										<!--                                             </div> -->
										<!--                                         </div>  -->
										<!-- 單項商品結束  -->
										<!--                                         <div class="col-lg-6 col-md-12 col-12"> -->
										<!--                                             <div class="trending-place-item"> -->
										<!--                                                 <div class="trending-img"> -->
										<!--                                                     <img src="images/category/places/cafe.jpg" alt="#"> -->
										<!--                                                     <span class="trending-rating-pink">9</span> -->
										<!--                                                     <span class="save-btn"><i class="icofont-heart"></i></span> -->
										<!--                                                 </div> -->
										<!--                                                 <div class="trending-title-box"> -->
										<!--                                                     <h4><a href="single-listing-two.html">Cafe Intermezzo</a></h4> -->
										<!--                                                     <div class="customer-review"> -->
										<!--                                                         <div class="rating-summary float-left"> -->
										<!--                                                             <div class="rating-result" title="60%"> -->
										<!--                                                                 <ul class="product-rating"> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                 </ul> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="review-summury float-right"> -->
										<!--                                                             <p><a href="#">5 Reviews</a></p> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                     <ul class="trending-address"> -->
										<!--                                                         <li><i class="ion-ios-location"></i> -->
										<!--                                                             <p>2721 Andy Street,ELLSWORTH,USA</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-ios-telephone"></i> -->
										<!--                                                             <p>+605-344-1198</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-android-globe"></i> -->
										<!--                                                             <p>www.cafemezzo.com</p> -->
										<!--                                                         </li> -->

										<!--                                                     </ul> -->

										<!--                                                     <div class="trending-bottom mar-top-15 pad-bot-30"> -->
										<!--                                                         <div class="trend-left float-left"> -->
										<!--                                                             <span class="round-bg green"><i class="icofont-tea"></i></span> -->
										<!--                                                             <p><a href="#">Cafe</a></p> -->
										<!--                                                         </div> -->

										<!--                                                         <div class="trend-right float-right"> -->
										<!--                                                             <div class="trend-closed"> -->
										<!--                                                                 Closed -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                 </div> -->
										<!--                                             </div> -->
										<!--                                         </div> -->
										<!--                                         <div class="col-lg-6 col-md-12 col-12"> -->
										<!--                                             <div class="trending-place-item"> -->
										<!--                                                 <div class="trending-img"> -->
										<!--                                                     <img src="images/category/places/place-5.jpg" alt="#"> -->
										<!--                                                     <span class="trending-rating-orange">6.5</span> -->
										<!--                                                     <span class="save-btn"><i class="icofont-heart"></i></span> -->
										<!--                                                 </div> -->
										<!--                                                 <div class="trending-title-box"> -->
										<!--                                                     <h4><a href="single-listing-one.html">Lagoon Theme Park</a></h4> -->
										<!--                                                     <div class="customer-review"> -->
										<!--                                                         <div class="rating-summary float-left"> -->
										<!--                                                             <div class="rating-result" title="60%"> -->
										<!--                                                                 <ul class="product-rating"> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                 </ul> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="review-summury float-right"> -->
										<!--                                                             <p><a href="#">3 Reviews</a></p> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                     <ul class="trending-address"> -->
										<!--                                                         <li><i class="ion-ios-location"></i> -->
										<!--                                                             <p>1301 Avenue, Brooklyn, NY 11230</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-ios-telephone"></i> -->
										<!--                                                             <p>+44 20 7336 8898</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-android-globe"></i> -->
										<!--                                                             <p>www.burgerandlobster.com</p> -->
										<!--                                                         </li> -->

										<!--                                                     </ul> -->

										<!--                                                     <div class="trending-bottom mar-top-15 pad-bot-30"> -->
										<!--                                                         <div class="trend-left float-left"> -->
										<!--                                                             <span class="round-bg red"><i class="icofont-travelling"></i></span> -->
										<!--                                                             <p><a href="#">Travel</a></p> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="trend-right float-right"> -->
										<!--                                                             <div class="trend-open"><i class="ion-clock"></i> -->
										<!--                                                                 Open <p>till 10.00pm</p> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                 </div> -->
										<!--                                             </div> -->
										<!--                                         </div> -->
										<!--                                         <div class="col-lg-6 col-md-12 col-12"> -->
										<!--                                             <div class="trending-place-item"> -->
										<!--                                                 <div class="trending-img"> -->
										<!--                                                     <img src="images/category/places/place-4.jpg" alt="#"> -->
										<!--                                                     <span class="trending-rating-pink">8</span> -->
										<!--                                                     <span class="save-btn"><i class="icofont-heart"></i></span> -->
										<!--                                                 </div> -->
										<!--                                                 <div class="trending-title-box"> -->
										<!--                                                     <h4><a href="single-listing-one.html">The Katikies</a></h4> -->
										<!--                                                     <div class="customer-review"> -->
										<!--                                                         <div class="rating-summary float-left"> -->
										<!--                                                             <div class="rating-result" title="60%"> -->
										<!--                                                                 <ul class="product-rating"> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                 </ul> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="review-summury float-right"> -->
										<!--                                                             <p><a href="#">3 Reviews</a></p> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                     <ul class="trending-address"> -->
										<!--                                                         <li><i class="ion-ios-location"></i> -->
										<!--                                                             <p>1301 Avenue, Brooklyn, NY 11230</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-ios-telephone"></i> -->
										<!--                                                             <p>+44 20 7336 8898</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-android-globe"></i> -->
										<!--                                                             <p>www.burgerandlobster.com</p> -->
										<!--                                                         </li> -->

										<!--                                                     </ul> -->

										<!--                                                     <div class="trending-bottom mar-top-15 pad-bot-30"> -->
										<!--                                                         <div class="trend-left float-left"> -->
										<!--                                                             <span class="round-bg pink"><i class="icofont-hotel"></i></span> -->
										<!--                                                             <p><a href="#">Hotel</a></p> -->

										<!--                                                         </div> -->
										<!--                                                         <div class="trend-right float-right"> -->
										<!--                                                             <div class="trend-open"><i class="ion-clock"></i> -->
										<!--                                                                 Open <p>till 10.00pm</p> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                 </div> -->
										<!--                                             </div> -->
										<!--                                         </div> -->
										<!--                                         <div class="col-lg-6 col-md-12 col-12"> -->
										<!--                                             <div class="trending-place-item"> -->
										<!--                                                 <div class="trending-img"> -->
										<!--                                                     <img src="images/category/places/place-9.jpg" alt="#"> -->
										<!--                                                     <span class="trending-rating-green">6.5</span> -->
										<!--                                                     <span class="save-btn"><i class="icofont-heart"></i></span> -->
										<!--                                                 </div> -->
										<!--                                                 <div class="trending-title-box"> -->
										<!--                                                     <h4><a href="single-listing-two.html">Genji Restaurant</a></h4> -->
										<!--                                                     <div class="customer-review"> -->
										<!--                                                         <div class="rating-summary float-left"> -->
										<!--                                                             <div class="rating-result" title="60%"> -->
										<!--                                                                 <ul class="product-rating"> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                 </ul> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="review-summury float-right"> -->
										<!--                                                             <p><a href="#">3 Reviews</a></p> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                     <ul class="trending-address"> -->
										<!--                                                         <li><i class="ion-ios-location"></i> -->
										<!--                                                             <p>1301 Avenue, Brooklyn, NY 11230</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-ios-telephone"></i> -->
										<!--                                                             <p>+44 20 7336 8898</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-android-globe"></i> -->
										<!--                                                             <p>www.burgerandlobster.com</p> -->
										<!--                                                         </li> -->
										<!--                                                     </ul> -->
										<!--                                                     <div class="trending-bottom mar-top-15 pad-bot-30"> -->
										<!--                                                         <div class="trend-left float-left"> -->
										<!--                                                             <span class="round-bg green"><i class="icofont-fast-food"></i></span> -->
										<!--                                                             <p><a href="#">Restaurant</a></p> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="trend-right float-right"> -->
										<!--                                                             <div class="trend-open"><i class="ion-clock"></i> -->
										<!--                                                                 Open <p>till 10.00pm</p> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                 </div> -->
										<!--                                             </div> -->
										<!--                                         </div> -->
										<!--                                         <div class="col-lg-6 col-md-12 col-12"> -->
										<!--                                             <div class="trending-place-item"> -->
										<!--                                                 <div class="trending-img"> -->
										<!--                                                     <img src="images/category/places/place-11.jpg" alt="#"> -->
										<!--                                                     <span class="trending-rating-green">8</span> -->
										<!--                                                     <span class="save-btn"><i class="icofont-heart"></i></span> -->
										<!--                                                 </div> -->
										<!--                                                 <div class="trending-title-box"> -->
										<!--                                                     <h4><a href="single-listing-one.html">The Straling</a></h4> -->
										<!--                                                     <div class="customer-review"> -->
										<!--                                                         <div class="rating-summary float-left"> -->
										<!--                                                             <div class="rating-result" title="60%"> -->
										<!--                                                                 <ul class="product-rating"> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                     <li><i class="ion-android-star-half"></i></li> -->
										<!--                                                                 </ul> -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="review-summury float-right"> -->
										<!--                                                             <p><a href="#">3 Reviews</a></p> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                     <ul class="trending-address"> -->
										<!--                                                         <li><i class="ion-ios-location"></i> -->
										<!--                                                             <p>1301 Avenue, Brooklyn, NY 11230</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-ios-telephone"></i> -->
										<!--                                                             <p>+44 20 7336 8898</p> -->
										<!--                                                         </li> -->
										<!--                                                         <li><i class="ion-android-globe"></i> -->
										<!--                                                             <p>www.burgerandlobster.com</p> -->
										<!--                                                         </li> -->
										<!--                                                     </ul> -->
										<!--                                                     <div class="trending-bottom mar-top-15 pad-bot-30"> -->
										<!--                                                         <div class="trend-left float-left"> -->
										<!--                                                             <span class="round-bg green"><i class="ion-ios-cart"></i></span> -->
										<!--                                                             <p><a href="#">Shop</a></p> -->
										<!--                                                         </div> -->
										<!--                                                         <div class="trend-right float-right"> -->
										<!--                                                             <div class="trend-closed"> -->
										<!--                                                                 closed -->
										<!--                                                             </div> -->
										<!--                                                         </div> -->
										<!--                                                     </div> -->
										<!--                                                 </div> -->
										<!--                                             </div> -->
										<!--                                         </div> -->
									</div>
									<!-- row結束 -->
								</div>


								<div id="list-view" class="tab-pane active product-list">
								<%  List<ProductBean> list2 = (List)request.getAttribute("list2");
									List imgids = 	(List)request.getAttribute("imgids");						
								%>     
								<%  for(int i=0; i < list2.size();i++){ %>
								
								
								<!-- 單項商品開始 -->
									<div class="row trending-place-item">
										<div class="col-md-6 no-pad-lr">
											<div class="trending-img">
												<img src="<%=request.getContextPath()%>/ProductImageReader?imgid=<%=imgids.get(i) %> " alt="#">
												<span class="trending-rating-green">7</span> <span
													class="save-btn"><i class="icofont-heart"></i></span>
											</div>
										</div>
										<div class="col-md-6 no-pad-lr">
											<div class="trending-title-box">
												<h4>
													<a href="<%=request.getContextPath() %>/MVC/ProductDetail?productid=<%=list2.get(i).getProductid() %>"><%=list2.get(i).getProductname() %></a>
												</h4>
												<div class="customer-review">
													<div class="rating-summary float-left">
														<div class="rating-result" title="60%">
															<ul class="product-rating">
																<li><i class="ion-android-star"></i></li>
																<li><i class="ion-android-star"></i></li>
																<li><i class="ion-android-star"></i></li>
																<li><i class="ion-android-star-half"></i></li>
																<li><i class="ion-android-star-half"></i></li>
															</ul>
														</div>
													</div>
													<div class="review-summury float-right">
														<p>
															<a href="#">3 Reviews</a>
														</p>
													</div>
												</div>
												<ul class="trending-address">
													<li><i class="ion-ios-location"></i>
														<p>4210 Khale Street,Florence,USA</p></li>
													<li><i class="ion-ios-telephone"></i>
														<p>+843-600-2040</p></li>
													<li><i class="ion-android-globe"></i>
														<p>www.laresorta.com</p></li>
												</ul>
												<div class="trending-bottom mar-top-15 pad-bot-30">
													<div class="trend-left float-left">
														<span class="round-bg pink"><i
															class="icofont-hotel"></i></span>
														<p>
															<a href="#">Hotel</a>
														</p>

													</div>
													<div class="trend-right float-right">
														<div class="trend-open">
															<i class="ion-clock"></i> Open
															<p>till 11.00pm</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 單項商品結束 -->


									<%} %>

									<!--                                     <div class="row trending-place-item"> -->
									<!--                                         <div class="col-md-6 no-pad-lr"> -->
									<!--                                             <div class="trending-img"> -->
									<!--                                                 <img src="images/category/places/cafe.jpg" alt="#"> -->
									<!--                                                 <span class="trending-rating-pink">9</span> -->
									<!--                                                 <span class="save-btn"><i class="icofont-heart"></i></span> -->
									<!--                                             </div> -->
									<!--                                         </div> -->
									<!--                                         <div class="col-md-6 no-pad-lr"> -->
									<!--                                             <div class="trending-title-box"> -->
									<!--                                                 <h4><a href="single-listing-two.html">我我</a></h4> -->
									<!--                                                 <div class="customer-review"> -->
									<!--                                                     <div class="rating-summary float-left"> -->
									<!--                                                         <div class="rating-result" title="60%"> -->
									<!--                                                             <ul class="product-rating"> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star-half"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star-half"></i></li> -->
									<!--                                                             </ul> -->
									<!--                                                         </div> -->
									<!--                                                     </div> -->
									<!--                                                     <div class="review-summury float-right"> -->
									<!--                                                         <p><a href="#">5 Reviews</a></p> -->
									<!--                                                     </div> -->
									<!--                                                 </div> -->
									<!--                                                 <ul class="trending-address"> -->
									<!--                                                     <li><i class="ion-ios-location"></i> -->
									<!--                                                         <p>2721 Andy Street,ELLSWORTH,USA</p> -->
									<!--                                                     </li> -->
									<!--                                                     <li><i class="ion-ios-telephone"></i> -->
									<!--                                                         <p>+605-344-1198</p> -->
									<!--                                                     </li> -->
									<!--                                                     <li><i class="ion-android-globe"></i> -->
									<!--                                                         <p>www.cafemezzo.com</p> -->
									<!--                                                     </li> -->

									<!--                                                 </ul> -->

									<!--                                                 <div class="trending-bottom mar-top-15 pad-bot-30"> -->
									<!--                                                     <div class="trend-left float-left"> -->
									<!--                                                         <span class="round-bg green"><i class="icofont-tea"></i></span> -->
									<!--                                                         <p><a href="#">Cafe</a></p> -->
									<!--                                                     </div> -->

									<!--                                                     <div class="trend-right float-right"> -->
									<!--                                                         <div class="trend-closed"> -->
									<!--                                                             Closed -->
									<!--                                                         </div> -->
									<!--                                                     </div> -->
									<!--                                                 </div> -->
									<!--                                             </div> -->
									<!--                                         </div> -->
									<!--                                     </div> -->
									<!--                                     <div class="row trending-place-item"> -->
									<!--                                         <div class="col-md-6 no-pad-lr"> -->
									<!--                                             <div class="trending-img"> -->
									<!--                                                 <img src="images/category/places/place-5.jpg" alt="#"> -->
									<!--                                                 <span class="trending-rating-orange">6.5</span> -->
									<!--                                                 <span class="save-btn"><i class="icofont-heart"></i></span> -->
									<!--                                             </div> -->
									<!--                                         </div> -->
									<!--                                         <div class="col-md-6 no-pad-lr"> -->
									<!--                                             <div class="trending-title-box"> -->
									<!--                                                 <h4><a href="single-listing-one.html">Lagoon Theme Park</a></h4> -->
									<!--                                                 <div class="customer-review"> -->
									<!--                                                     <div class="rating-summary float-left"> -->
									<!--                                                         <div class="rating-result" title="60%"> -->
									<!--                                                             <ul class="product-rating"> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star-half"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star-half"></i></li> -->
									<!--                                                             </ul> -->
									<!--                                                         </div> -->
									<!--                                                     </div> -->
									<!--                                                     <div class="review-summury float-right"> -->
									<!--                                                         <p><a href="#">3 Reviews</a></p> -->
									<!--                                                     </div> -->
									<!--                                                 </div> -->
									<!--                                                 <ul class="trending-address"> -->
									<!--                                                     <li><i class="ion-ios-location"></i> -->
									<!--                                                         <p>1301 Avenue, Brooklyn, NY 11230</p> -->
									<!--                                                     </li> -->
									<!--                                                     <li><i class="ion-ios-telephone"></i> -->
									<!--                                                         <p>+44 20 7336 8898</p> -->
									<!--                                                     </li> -->
									<!--                                                     <li><i class="ion-android-globe"></i> -->
									<!--                                                         <p>www.burgerandlobster.com</p> -->
									<!--                                                     </li> -->

									<!--                                                 </ul> -->

									<!--                                                 <div class="trending-bottom mar-top-15 pad-bot-30"> -->
									<!--                                                     <div class="trend-left float-left"> -->
									<!--                                                         <span class="round-bg red"><i class="icofont-travelling"></i></span> -->
									<!--                                                         <p><a href="#">Travel</a></p> -->
									<!--                                                     </div> -->
									<!--                                                     <div class="trend-right float-right"> -->
									<!--                                                         <div class="trend-open"><i class="ion-clock"></i> -->
									<!--                                                             Open <p>till 10.00pm</p> -->
									<!--                                                         </div> -->
									<!--                                                     </div> -->
									<!--                                                 </div> -->
									<!--                                             </div> -->
									<!--                                         </div> -->
									<!--                                     </div> -->
									<!--                                     <div class="row trending-place-item"> -->
									<!--                                         <div class="col-md-6 no-pad-lr"> -->
									<!--                                             <div class="trending-img"> -->
									<!--                                                 <img src="images/category/places/place-4.jpg" alt="#"> -->
									<!--                                                 <span class="trending-rating-pink">8</span> -->
									<!--                                                 <span class="save-btn"><i class="icofont-heart"></i></span> -->
									<!--                                             </div> -->
									<!--                                         </div> -->
									<!--                                         <div class="col-md-6 no-pad-lr"> -->
									<!--                                             <div class="trending-title-box"> -->
									<!--                                                 <h4><a href="single-listing-one.html">The Katikies</a></h4> -->
									<!--                                                 <div class="customer-review"> -->
									<!--                                                     <div class="rating-summary float-left"> -->
									<!--                                                         <div class="rating-result" title="60%"> -->
									<!--                                                             <ul class="product-rating"> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star-half"></i></li> -->
									<!--                                                                 <li><i class="ion-android-star-half"></i></li> -->
									<!--                                                             </ul> -->
									<!--                                                         </div> -->
									<!--                                                     </div> -->
									<!--                                                     <div class="review-summury float-right"> -->
									<!--                                                         <p><a href="#">3 Reviews</a></p> -->
									<!--                                                     </div> -->
									<!--                                                 </div> -->
									<!--                                                 <ul class="trending-address"> -->
									<!--                                                     <li><i class="ion-ios-location"></i> -->
									<!--                                                         <p>1301 Avenue, Brooklyn, NY 11230</p> -->
									<!--                                                     </li> -->
									<!--                                                     <li><i class="ion-ios-telephone"></i> -->
									<!--                                                         <p>+44 20 7336 8898</p> -->
									<!--                                                     </li> -->
									<!--                                                     <li><i class="ion-android-globe"></i> -->
									<!--                                                         <p>www.burgerandlobster.com</p> -->
									<!--                                                     </li> -->

									<!--                                                 </ul> -->

									<!--                                                 <div class="trending-bottom mar-top-15 pad-bot-30"> -->
									<!--                                                     <div class="trend-left float-left"> -->
									<!--                                                         <span class="round-bg pink"><i class="icofont-hotel"></i></span> -->
									<!--                                                         <p><a href="#">Hotel</a></p> -->

									<!--                                                     </div> -->
									<!--                                                     <div class="trend-right float-right"> -->
									<!--                                                         <div class="trend-open"><i class="ion-clock"></i> -->
									<!--                                                             Open <p>till 1000.00pm</p> -->
									<!--                                                         </div> -->
									<!--                                                     </div> -->
									<!--                                                 </div> -->
									<!--                                             </div> -->
									<!--                                         </div> -->
									<!--                                     </div> -->
								</div>
								<!--pagination starts-->
								<div class="post-nav nav-res pad-top-10">
									<div class="row">
										<div class="col-md-8 offset-md-2  col-xs-12 ">
											<div class="page-num text-center">
												<ul>
													<li class="active"><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<!--pagination ends-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Listing Filter ends-->
		<!-- Scroll to top starts-->
		<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
		<!-- Scroll to top ends-->
	</div>
	<!--Page Wrapper ends-->
	<!--Footer Starts-->
	<div class="footer-wrapper no-pad-tb v2">
		<div class="footer-top-area section-padding">
			<div class="container">
				<div class="row nav-folderized">
					<div class="col-lg-3 col-md-12">
						<div class="footer-logo">
							<!-- <a href="index.html"> <img src="images/f.png" alt="logo"></a> -->
							<a href="index.html">
								<h1>Fun心遊台灣</h1>
							</a>
							<div class="company-desc">
								<p>
									我們致力於給每一位旅客最好的旅遊體驗，每一段旅程都將成為人生精采的回憶。
									<!-- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio excepturi nam totam sequi, ipsam consequatur repudiandae libero illum. -->
								</p>
							</div>
						</div>
					</div>
					<!-- <div class="col-lg-3 col-md-12">
                        <div class="footer-content nav">
                            <h2 class="title" >相關連結</h2>
                            <ul class="list">
                                <li><a class="link-hov style2" href="#" >登入</a></li>
                                <li><a class="link-hov style2" href="#" >會員中心</a></li>
                                <li><a class="link-hov style2" href="#" >購物車</a></li>
                                <li><a class="link-hov style2" href="#" >隱私權保護政策</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-12">
                        <div class="footer-content nav">
                            <h2 class="title" >產品分類</h2>
                            <ul class="list">
                                <li><a class="link-hov style2" href="#" >一日遊</a></li>
                                <li><a class="link-hov style2" href="#" >多日遊</a></li>
                                <li><a class="link-hov style2" href="#" >包車</a></li>
                                <li><a class="link-hov style2" href="#" ></a></li>

                            </ul>
                        </div>
                    </div> -->
					<div class="col-lg-3 col-md-12">
						<div class="footer-content nav">
							<h2 class="title">聯絡我們</h2>
							<ul class="list footer-list">
								<li>
									<div class="contact-info">
										<div class="icon">
											<i class="ion-ios-location"></i>
										</div>
										<div class="text">緯育Tibame-TFA105第一組</div>
									</div>
								</li>
								<li>
									<div class="contact-info">
										<div class="icon">
											<i class="ion-email"></i>
										</div>
										<div class="text">
											<a href="#">組員個人履歷</a>
										</div>
									</div>
								</li>
								<!-- <li>
                                    <div class="contact-info">
                                        <div class="icon">
                                            <i class="ion-ios-telephone"></i>
                                        </div>
                                        <div class="text">+81 02 2955 3611</div>
                                    </div>
                                </li> -->
							</ul>
							<!-- <ul class="social-buttons style2">
                                <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                                <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                                <li><a href="#"><i class="ion-social-pinterest"></i></a></li>
                                <li><a href="#"><i class="ion-social-youtube"></i></a></li>
                                <li><a href="#"><i class="ion-social-dribbble"></i></a></li>
                            </ul> -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="footer-bottom-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="payment-method">
                            <img src="images/payment/payment-1.png" alt="...">
                            <img src="images/payment/payment-2.png" alt="...">
                            <img src="images/payment/payment-3.png" alt="...">
                        </div>
                    </div>
                    <div class="col-md-6 text-right sm-left">
                        <ul class="additional-link">
                            <li><a href="#">Terms &amp; Condition</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="login.html">Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> -->
	</div>
	<!--Footer ends-->
	<!--Color switcher starts-->
	<div class="color-switcher hide-color-switcher">
		<a class="switcher-button"><i class="ion-android-settings"></i></a>
		<div class="color-switcher-title text-center">
			<h5>Switch Colors</h5>
		</div>
		<div class="color-list text-center">
			<a class="color green-theme" title="green"></a> <a
				class="color red-theme" title="red"></a> <a class="color blue-theme"
				title="blue"></a> <a class="color orange-theme" title="orange"></a>
			<a class="color pink-theme" title="pink"></a> <a
				class="color purple-theme" title="purple"></a> <a
				class="color violet-theme" title="violet"></a> <a
				class="color aqua-theme" title="aqua"></a>
		</div>
	</div>
	<!--Color switcher ends-->
	<!--Scripts starts-->
	<!--plugin js-->
	<script src="js/plugin.js"></script>
	<!--google maps-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!--Main js-->
	<script src="js/main.js"></script>
	<!--Scripts ends-->
</body>

</html>
