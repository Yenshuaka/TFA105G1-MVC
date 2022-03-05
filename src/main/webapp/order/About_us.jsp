<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page
	import="com.product.product.model.*, com.order.order.model.*,com.order.orderdetail.model.* ,org.springframework.context.ApplicationContext,org.springframework.web.context.WebApplicationContext, org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.Transaction "%>

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
<link href="<%=request.getContextPath()%>/download/css/plugin.css"
	rel="stylesheet" />
<!-- Perfect scrollbar CSS-->
<link
	href="<%=request.getContextPath()%>/download/css/perfect-scrollbar.css"
	rel="stylesheet">
<!-- style CSS -->
<link href="<%=request.getContextPath()%>/download/css/style.css"
	rel="stylesheet" />
<!-- Dashboard CSS -->
<link href="<%=request.getContextPath()%>/download/css/dashboard.css"
	rel="stylesheet" />
<!--color switcher css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/download/css/switcher/skin-aqua.css"
	media="screen" id="style-colors" />
<!-- Document Title -->

<style type="text/css">
p1 {
	font-size: 14px;
	color: #7a7a7a;
	font-weight: 400;
	line-height: 1.8;
	font-family: 'poppins', sans-serif;
}

h4 {
	font-size: 24px;
	font-family: 'poppins', sans-serif;
	font-weight: 700;
}

h5 {
	font-size: 18px;
	color: #777;
	font-family: 'poppins', sans-serif;
	font-weight: 300;
}

.image-inf {
	background-image: url(images/photo1.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
}

.image-inf2 {
	background-image: url(images/11.jpg);
	/* 	background-repeat: no-repeat; */
	/* 	background-size: cover; */
	width: 100%;
}

.group5 {
	margin-top: 80px;
}

.self_photo {
	width: 220px;
	float: left;
}

.self_intro {
	/* display: inline; */
	margin-left: 250px;
	font-size: 18px;
}

.div_gin {
	margin-top: 100px;
}
</style>

<title>關於我們</title>

</head>


<body>

	<!--Page Wrapper starts-->
	<div class="page-wrapper fixed-footer">
		<!--header starts-->
		<%@include file="/download/file/FS_Header.file"%>
		<!--Header ends-->
		<!--Breadcrumb section starts-->
		<div class="breadcrumb-section "
			style="background-image: url(images/c_banner.jpg">
			<div class="overlay op-5"></div>
			<div class="container">
				<div class="row align-items-center  pad-top-80">
					<div class="col-md-6 col-12">
						<div class="breadcrumb-menu">
							<h2 class="page-title">關於我們</h2>
						</div>
						<!--                     </div> -->
						<!--                     <div class="col-md-6 col-12"> -->
						<!--                         <div class="breadcrumb-menu text-right sm-left"> -->
						<!--                             <ul> -->
						<!--                                 <li class="active"><a href="#">Home</a></li> -->
						<!--                                 <li><a href="#">About us</a></li> -->
						<!--                             </ul> -->
						<!--                         </div> -->
					</div>
				</div>
			</div>
		</div>
		<!--Breadcrumb section ends-->
		<!--About section starts-->
		<div class="about-section section-padding pad-bot-90">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="about-text res-box">
							<span>關於</span>
							<h2>Fun心遊台灣團隊</h2>
							<p>隨著近年來體驗經濟的興起，愈來愈多人傾向以自由行、在地遊的方式旅遊。搭上這股潮流，我們團隊希望把旅程變得更簡單、更即時，讓自由行的客戶玩得更自在、安全。我們會透過不斷尋找台灣各地的特色體驗與在地活動，幫助旅行者能在我們開發出來的平台上發掘行程、輕鬆預訂，創造出只屬於他們自己獨一無二的旅遊回憶。</p>
							<p>本平台致力於把旅程變得更簡單、更即時，讓旅人玩得更自在、安全，並提供一站式的服務，讓客戶能更容易的探索我們美麗的寶島</p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="about-img">
							<img class="group5" src="images/group5.jpg" alt="...">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--About section ends-->
		<!--Counter section starts-->
		<div class="counter-section bg-xs"
			style="background-image: url(images/11.jpg)">
			<div class="overlay op-5 "></div>
			<div class="container">
				<div class="row pad-tb-90">
					<div class="col-md-3 col-6">
						<div class="counter-text">
							<i class="icofont-thumbs-up"></i>
							<h6 class="counter-value">100</h6>
							<p>客戶滿意</p>
						</div>
					</div>
					<div class="col-md-3 col-6">
						<div class="counter-text">
							<i class="icofont-street-view"></i>
							<h6 class="counter-value">20</h6>
							<p>全新旅程</p>
						</div>
					</div>
					<div class="col-md-3 col-6">
						<div class="counter-text">
							<i class="icofont-address-book"></i>
							<h6 class="counter-value">8</h6>
							<p>探索新城市</p>
						</div>
					</div>
					<div class="col-md-3 col-6">
						<div class="counter-text">
							<i class="icofont-island-alt"></i>
							<h6 class="counter-value">10</h6>
							<p>獨特體驗</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Counter section ends-->
		<!--Work-process starts-->
		<div class="work-process pad-bot-90 section-padding"
			style="background-image: url(images/others/dots-bg.svg)">
			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center">
						<h2>網站特色</h2>
					</div>
					<div class="col-md-4">
						<div class="work-process-content v1 text-center">
							<div class="process-icon v1">
								<img src="images/3.1.png" alt="..."> <span>1</span>
							</div>
							<h4 class="title">免規劃 0風險</h4>
								<p1>不需行程規劃（隨車服務人員）</p1>
								<p1>不需擔心交通問題（包車）</p1>
								<p1>不用提前預訂票券（代訂服務）</p1>
<!-- 								<p1>沒有額外購物行程</p1> -->

							</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="work-process-content v1 text-center">
							<div class="process-icon v1">
								<img src="images/1.png" alt="..."> <span>2</span>

							</div>
							<h4 class="title">彈性預定</h4>
							<p class="info">無論您喜歡提前計畫旅途，或者習慣當下做決定，您都可以彈性選擇您的行程、輕鬆預訂，即時出遊！</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="work-process-content v1 text-center">
							<div class="process-icon v1">
								<img src="images/3.png" alt="..."> <span>3</span>
							</div>
							<h4 class="title">找尋最佳景點</h4>
							<p class="info">為了成為旅人最可靠的夥伴，我們嚴格篩選所有景點，也定期服務品質，讓旅人能夠放心感受旅行的美好。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Work-process ends-->
		<!--Team section starts-->
		<div class="team-section pad-bot-70 pad-top-40">
			<div class="container">
			<h2 style="text-align: center">組員介紹</h2>
				<div class=div_roy>
					<img class="self_photo" src="images/roy.jpg" alt="">
					<div class="self_intro">
						<h4>顏源鴻 Gin Yen</h4>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique iste aliquam possimus, quaerat aut veritatis minima
						atque quam. Placeat, molestiae Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Similique iste aliquam possimus,
						quaerat aut veritatis molestiae Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Similique iste aliquam possimus,
						quaerat aut veritatis molestiae Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Similique iste aliquam possimus,
						quaerat aut veritatis
					</div>
				</div>

				<div class=div_gin>
					<img class="self_photo" src="images/roy.jpg" alt="">
					<div class="self_intro">
						<h4>姜昀廷 Roy Chiang</h4>
						<h5>日本京都留學，於大阪的汽車零件公司工作3年半，擔任國外業務並負責拓展歐洲與澳洲市場。同時也密切與研發部門合作開發新產品。會說四國語言，喜歡與人交流，並擅長團隊中的溝通協調。
							在開發專案中，我負責的是訂單的前後台管理，後端主要使用Spring與Hibernate框架，並搭配前端jQuery技術設計頁面功能。除了自身功能之外，平時也積極與團隊溝通，
							確認專案方向是否與使用者需求一致，並定期追蹤組員的進度，確保各個階段的開發時間能跟上當初制定的時間軸。</h5>
					</div>
				</div>

				<div class=div_gin>
					<img class="self_photo" src="images/nick.jpeg" alt="">
					<div class="self_intro">
						<h4>吳明龠 Nick Wu</h4>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique iste aliquam possimus, quaerat aut veritatis minima
						atque quam. Placeat, molestiae Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Similique iste aliquam possimus,
						quaerat aut veritatis molestiae Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Similique iste aliquam possimus,
						quaerat aut veritatis molestiae Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Similique iste aliquam possimus,
						quaerat aut veritatis
					</div>
				</div>
				<!--                 <div class="row mar-top-30"> -->
				<!--                     <div class="col-md-8 offset-md-2 text-center"> -->
				<!--                         <h2 class="section-title v1">Creative Leaders</h2> -->
				<!--                     </div> -->
				<!--                     <div class="col-md-12"> -->
				<!--                         <div class="team-wrapper swiper-container"> -->
				<!--                             <div class="swiper-wrapper"> -->
				<!--                                 <div class="swiper-slide single-team-member text-center"> -->
				<!--                                     <img src="images/team/team-member-1.jpg" alt="Image"> -->
				<!--                                     <div class="single-team-info text-center"> -->
				<!--                                         <h4>Amanda Gordon</h4> -->
				<!--                                         <span>Founder &amp; CEO</span> -->
				<!--                                         <div class="social-link style1"> -->
				<!--                                             <ul class="social-buttons style2"> -->
				<!--                                                 <li><a href="#"><i class="ion-social-facebook"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-twitter"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-pinterest"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-youtube"></i></a></li> -->
				<!--                                             </ul> -->
				<!--                                         </div> -->
				<!--                                     </div> -->
				<!--                                 </div> -->
				<!--                                 <div class="swiper-slide single-team-member text-center"> -->
				<!--                                     <img src="images/team/team-member-2.jpg" alt="Image"> -->
				<!--                                     <div class="single-team-info text-center"> -->
				<!--                                         <h4>Nick jones</h4> -->
				<!--                                         <span>Creative Director</span> -->
				<!--                                         <div class="social-link style1"> -->
				<!--                                             <ul class="social-buttons style2"> -->
				<!--                                                 <li><a href="#"><i class="ion-social-facebook"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-twitter"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-pinterest"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-youtube"></i></a></li> -->
				<!--                                             </ul> -->
				<!--                                         </div> -->
				<!--                                     </div> -->
				<!--                                 </div> -->
				<!--                                 <div class="swiper-slide single-team-member text-center"> -->
				<!--                                     <img src="images/team/team-member-3.jpg" alt="Image"> -->
				<!--                                     <div class="single-team-info text-center"> -->
				<!--                                         <h4>Salt bae</h4> -->
				<!--                                         <span>CMO</span> -->
				<!--                                         <div class="social-link style1"> -->
				<!--                                             <ul class="social-buttons style2"> -->
				<!--                                                 <li><a href="#"><i class="ion-social-facebook"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-twitter"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-pinterest"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-youtube"></i></a></li> -->
				<!--                                             </ul> -->
				<!--                                         </div> -->
				<!--                                     </div> -->
				<!--                                 </div> -->
				<!--                                 <div class="swiper-slide single-team-member text-center"> -->
				<!--                                     <img src="images/team/team-member-5.jpg" alt="Image"> -->
				<!--                                     <div class="single-team-info text-center"> -->
				<!--                                         <h4>Tony Stark</h4> -->
				<!--                                         <span>Founder &amp; CEO</span> -->
				<!--                                         <div class="social-link style1"> -->
				<!--                                             <ul class="social-buttons style2"> -->
				<!--                                                 <li><a href="#"><i class="ion-social-facebook"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-twitter"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-pinterest"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-youtube"></i></a></li> -->
				<!--                                             </ul> -->
				<!--                                         </div> -->
				<!--                                     </div> -->
				<!--                                 </div> -->
				<!--                                 <div class="swiper-slide single-team-member text-center"> -->
				<!--                                     <img src="images/team/team-member-4.jpg" alt="Image"> -->
				<!--                                     <div class="single-team-info text-center"> -->
				<!--                                         <h4>Jenifar Thang</h4> -->
				<!--                                         <span>Founder &amp; CEO</span> -->
				<!--                                         <div class="social-link style1"> -->
				<!--                                             <ul class="social-buttons style2"> -->
				<!--                                                 <li><a href="#"><i class="ion-social-facebook"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-twitter"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-pinterest"></i></a></li> -->
				<!--                                                 <li><a href="#"><i class="ion-social-youtube"></i></a></li> -->
				<!--                                             </ul> -->
				<!--                                         </div> -->
				<!--                                     </div> -->
				<!--                                 </div> -->
				<!--                             </div> -->
				<!--                         </div> -->
				<!--                         <div class="slider-btn v1 team-next"><i class="ion-arrow-right-c"></i></div> -->
				<!--                         <div class="slider-btn v1 team-prev"><i class="ion-arrow-left-c"></i></div> -->
				<!--                     </div> -->
				<!--                 </div> -->
			</div>
		</div>
		<!--Team section ends-->
		<!--Testimonial Section start-->
		<!-- 		<div class="hero-client-section pad-bot-70 mar-top-10 section-padding"> -->
		<!-- 			<div class="container"> -->
		<!-- 				<div class="row"> -->
		<!-- 					<div class="col-md-8 offset-md-2 text-center"> -->
		<!-- 						<h2 class="section-title v1">People Talking About Us</h2> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-12 mar-bot-70"> -->
		<!-- 						<div class="testimonial-wrapper swiper-container"> -->
		<!-- 							<div class="swiper-wrapper"> -->
		<!-- 								<div class="swiper-slide single-testimonial-item"> -->
		<!-- 									<div class="testimonial-img text-center"> -->
		<!-- 										<img src="images/clients/client_1.jpg" alt="..."> -->
		<!-- 									</div> -->
		<!-- 									<div class="testimonial-content text-center"> -->
		<!-- 										<ul class="product-rating"> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star-half"></i></li> -->
		<!-- 											<li><i class="ion-android-star-half"></i></li> -->
		<!-- 										</ul> -->
		<!-- 										<h5>Frank Jane</h5> -->
		<!-- 										<span>CEO, Bloomberg</span> -->
		<!-- 										<p>Lorem ipsum dolor adipisicing elit.iusto at laborum hic -->
		<!-- 											qui, minus, quasi modi assumenda quis corrupti.</p> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 								<div class="swiper-slide single-testimonial-item"> -->
		<!-- 									<div class="testimonial-img text-center"> -->
		<!-- 										<img src="images/clients/client_3.jpg" alt="..."> -->
		<!-- 									</div> -->
		<!-- 									<div class="testimonial-content text-center"> -->
		<!-- 										<ul class="product-rating"> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star-half"></i></li> -->
		<!-- 											<li><i class="ion-android-star-half"></i></li> -->
		<!-- 										</ul> -->
		<!-- 										<h5>Amanda Gordon</h5> -->
		<!-- 										<span>CMO, TechTelsa</span> -->
		<!-- 										<p>Lorem ipsum dolor adipisicing elit.iusto at laborum hic -->
		<!-- 											qui, minus, quasi modi assumenda quis corrupti.</p> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 								<div class="swiper-slide single-testimonial-item"> -->
		<!-- 									<div class="testimonial-img text-center"> -->
		<!-- 										<img src="images/clients/client_2.jpg" alt="..."> -->
		<!-- 									</div> -->
		<!-- 									<div class="testimonial-content text-center"> -->
		<!-- 										<ul class="product-rating"> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star-half"></i></li> -->
		<!-- 											<li><i class="ion-android-star-half"></i></li> -->
		<!-- 										</ul> -->
		<!-- 										<h5>Lee Priest</h5> -->
		<!-- 										<span>MD, Cornia Inc</span> -->
		<!-- 										<p>Lorem ipsum dolor adipisicing elit.iusto at laborum hic -->
		<!-- 											qui, minus, quasi modi assumenda quis corrupti.</p> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 								<div class="swiper-slide single-testimonial-item"> -->
		<!-- 									<div class="testimonial-img text-center"> -->
		<!-- 										<img src="images/clients/client_4.jpg" alt="..."> -->
		<!-- 									</div> -->
		<!-- 									<div class="testimonial-content text-center"> -->
		<!-- 										<ul class="product-rating"> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star"></i></li> -->
		<!-- 											<li><i class="ion-android-star-half"></i></li> -->
		<!-- 											<li><i class="ion-android-star-half"></i></li> -->
		<!-- 										</ul> -->
		<!-- 										<h5>Mark Henry</h5> -->
		<!-- 										<span>CEO, Alpha Inc</span> -->
		<!-- 										<p>Lorem ipsum dolor adipisicing elit.iusto at laborum hic -->
		<!-- 											qui, minus, quasi modi assumenda quis corrupti.</p> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 						<div class="client-pagination"></div> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<!--Testimonial Section ends-->
		<!--Partner section starts-->
		<!-- 		<div class="partner-section style1 pad-top-60 pad-bot-80"> -->
		<!-- 			<div class="container"> -->
		<!-- 				<div class="row"> -->
		<!-- 					<div class="col-md-12"> -->
		<!-- 						<div class="swiper-container partner-wrap"> -->
		<!-- 							<div class="swiper-wrapper"> -->
		<!-- 								<div class="swiper-slide single-partner"> -->
		<!-- 									<img src="images/partners/1.png" alt="..."> -->
		<!-- 								</div> -->
		<!-- 								<div class="swiper-slide single-partner"> -->
		<!-- 									<img src="images/partners/2.png" alt="..."> -->
		<!-- 								</div> -->
		<!-- 								<div class="swiper-slide single-partner"> -->
		<!-- 									<img src="images/partners/3.png" alt="..."> -->
		<!-- 								</div> -->
		<!-- 								<div class="swiper-slide single-partner"> -->
		<!-- 									<img src="images/partners/4.png" alt="..."> -->
		<!-- 								</div> -->
		<!-- 								<div class="swiper-slide single-partner"> -->
		<!-- 									<img src="images/partners/5.png" alt="..."> -->
		<!-- 								</div> -->
		<!-- 								<div class="swiper-slide single-partner"> -->
		<!-- 									<img src="images/partners/6.png" alt="..."> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 						<div class="slider-btn v1 partner-next"> -->
		<!-- 							<i class="ion-ios-arrow-right"></i> -->
		<!-- 						</div> -->
		<!-- 						<div class="slider-btn v1 partner-prev"> -->
		<!-- 							<i class="ion-ios-arrow-left"></i> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<!--Partner section ends-->
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
	<!-- 	<div class="color-switcher hide-color-switcher"> -->
	<!-- 		<a class="switcher-button"><i class="ion-android-settings"></i></a> -->
	<!-- 		<div class="color-switcher-title text-center"> -->
	<!-- 			<h5>Switch Colors</h5> -->
	<!-- 		</div> -->
	<!-- 		<div class="color-list text-center"> -->
	<!-- 			<a class="color green-theme" title="green"></a> <a -->
	<!-- 				class="color red-theme" title="red"></a> <a class="color blue-theme" -->
	<!-- 				title="blue"></a> <a class="color orange-theme" title="orange"></a> -->
	<!-- 			<a class="color pink-theme" title="pink"></a> <a -->
	<!-- 				class="color purple-theme" title="purple"></a> <a -->
	<!-- 				class="color violet-theme" title="violet"></a> <a -->
	<!-- 				class="color aqua-theme" title="aqua"></a> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
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