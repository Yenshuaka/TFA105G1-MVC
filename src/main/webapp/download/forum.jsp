<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.post.model.* , java.util.* , java.sql.Connection, java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement , java.sql.ResultSet , java.sql.SQLException, java.sql.Time"%>
<%@ page import="java.sql.Timestamp , java.util.ArrayList , java.util.Date, java.util.List"%>
<%@ page import="org.hibernate.SessionFactory, org.springframework.context.ApplicationContext, org.springframework.web.context.WebApplicationContext  "%>

<%  
	
	ServletContext applicationContext = this.getServletContext();
	ApplicationContext context = (ApplicationContext) applicationContext.getAttribute
		(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
	PostService postService = context.getBean("postService", PostService.class);
	List<PostBean> list = postService.select(null);
	
	String index = "1";
	int x = Integer.parseInt(index);
// 	System.out.println(request.getParameter("page"));
	if(request.getParameter("page")!= null){
		
		x = Integer.parseInt(request.getParameter("page"));
	}

 %>
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
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800" rel="stylesheet">
    <!-- Plugins CSS -->
    <link href="css/plugin.css" rel="stylesheet" />
    <!-- style CSS -->
    <link href="css/style.css" rel="stylesheet" />
    <!--color switcher css-->
    <link rel="stylesheet" href="css/switcher/skin-aqua.css" media="screen" id="style-colors" />
    <!-- Document Title -->
    <title>Fun心遊台灣 - 首頁/論壇</title>
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
            <div class="site-navbar-wrap v2" style="background-color: rgb(32, 69, 99)">
                <div class="container">
                    <div class="site-navbar">
                        <div class="row align-items-center">
                            <div class="col-md-4 col-6">
                                <a class="navbar-brand" href="home-v2-using.html"><img src="images/f.png" alt="logo" class="img-fluid"></a>
                            </div>
                            <div class="col-md-8 col-6">
                                <nav class="site-navigation float-left">
                                    <div class="container">
                                        <ul class="site-menu js-clone-nav d-none d-lg-block">
                                            <li class="has-children">
                                                <a href="home-v2-using.html" style="color: white">首頁</a>
                                                <!-- <ul class="dropdown">
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
                                                </ul> -->
                                            </li>
                                            <li class="has-children">
                                                <a href="#" style="color: white">產品分類</a>
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
                                                </ul> 
                                            </li>
                                            <li class="has-children">
                                                <a href="#" style="color: white">論壇</a>
                                                <!-- <ul class="dropdown">
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

                                                </ul>-->
                                            </li> 
                                            <li class="has-children">
                                                <a href="#" style="color: white">會員專區</a>
                                                <!-- <ul class="dropdown">
                                                    <li><a href="db.html">Dashboard</a></li>
                                                    <li><a href="db-my-listing.html">My Listings</a></li>
                                                    <li><a href="db-bookings.html">Bookings</a></li>
                                                    <li><a href="db-messages.html">Inbox</a></li>
                                                    <li><a href="db-favourites.html">Favourite Listing</a></li>
                                                    <li><a href="db-add-listing.html">Add Listing</a></li>
                                                    <li><a href="db-recieve-reviews.html">Reviews</a></li>
                                                    <li><a href="db-my-profile.html">User  Profile</a></li>
                                                    <li><a href="db-invoices.html">Invoices </a></li>

                                                </ul> -->
                                            </li>
                                            <li class="has-children">
                                                <a href="#" style="color: white">登入/註冊</a>
                                                <!-- <ul class="dropdown">
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
                                                </ul> -->
                                            </li>
                                            <li class="d-lg-none"><a class="btn v1" href="add-listing.html">Add Listing <i class="ion-plus-round"></i></a></li>
                                        </ul>
                                    </div>
                                </nav>
                                <div class="d-lg-none sm-right">
                                    <a href="#" class="mobile-bar js-menu-toggle">
                                        <span class="ion-android-menu"></span>
                                    </a>
                                </div>
                                <div class="add-list float-right">
                                    <a class="btn v8" href="add-listing.html">購物車 <i class="icofont-shopping-cart">&nbsp3</i></a>
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
        <div class="breadcrumb-section" style="background-image: url(images/camp.png)">
            <div class="overlay op-5"></div>
            <div class="container">
                <div class="row align-items-center  pad-top-80">
                    <div class="col-md-6 col-12">
                        <div class="breadcrumb-menu">
                           <!--  <h2 class="page-title">News Right sidebar</h2> -->
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="breadcrumb-menu text-right sm-left">
                            <ul>
                                <li class="active"><a href="#">首頁</a></li>
                                <li><a href="#">論壇</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Breadcrumb section ends-->
        <!--Blog section starts-->
        <div class="blog-area section-padding pad-bot-40 mar-top-20">
            <div class="container">
                <div class="row">
                    <!--Blog post starts-->
                    <div class="col-xl-9 col-md-12 no-pad-lr">
                        <div class="blog-section style1">
                            <div class="container">
                                <div class="row">
                                
                                
                                
                                <% for (int i = (x-1)*6; i <= (x*6)-1 ; i++) {  %>
						
                                    <div class="col-md-6">
                                        <div class="card single-blog-item v1 mar-bot-30">             
                                            <img src="/G1test2/PostImageReader?postid=<%=list.get(i).getPostid() %>" alt="..." style="width:400px;height:300px">
                                            <a href="#" class="blog-cat btn v6 red">Hotel</a>
                                            <div class="card-body">
                                                <h4 class="card-title"><a href="single-news-two.html"><%=list.get(i).getPosttitle()%></a></h4>
                                                <div class="bottom-content">
                                                    <p class="date">Dec 5th , 2018 by <a href="#" class="text-dark">Adam D'Costa</a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 <% } %>  
                                  
                              	</div> 
                                    
<!--                                     <div class="col-md-6"> -->
<!--                                         <div class="card single-blog-item v1 mar-bot-30"> -->
<!--                                             <img src="images/blog/news_8.jpg" alt="..."> -->
<!--                                             <a href="#" class="blog-cat btn v6 red">Restaurant</a> -->
<!--                                             <div class="card-body"> -->
<!--                                                 <h4 class="card-title"><a href="single-news-two.html">Cappuccino Coffee at Broklyn for Coffee Lover.</a></h4> -->
<!--                                                 <div class="bottom-content"> -->
<!--                                                     <p class="date">Dec 5th , 2018 by <a href="#" class="text-dark">Adam D'Costa</a></p> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6"> -->
<!--                                         <div class="card single-blog-item v1 mar-bot-30"> -->
<!--                                             <img src="images/blog/news_10.jpg" alt="..."> -->
<!--                                             <a href="#" class="blog-cat btn v6 red">Eat &amp; Drink</a> -->
<!--                                             <div class="card-body"> -->
<!--                                                 <h4 class="card-title"><a href="single-news-two.html">Upcoming Fairway Food Festival 2019 in Italy</a></h4> -->
<!--                                                 <div class="bottom-content"> -->
<!--                                                     <p class="date">Dec 5th , 2018 by <a href="#" class="text-dark">Adam D'Costa</a></p> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6"> -->
<!--                                         <div class="card single-blog-item v1 mar-bot-30"> -->
<!--                                             <img src="images/blog/news_7.jpg" alt="..."> -->
<!--                                             <a href="#" class="blog-cat btn v6 red">Hotel</a> -->
<!--                                             <div class="card-body"> -->
<!--                                                 <h4 class="card-title"><a href="single-news-two.html">Top 10 Homestay in London That you don't miss out</a></h4> -->
<!--                                                 <div class="bottom-content"> -->
<!--                                                     <p class="date">Dec 5th , 2018 by <a href="#" class="text-dark">Adam D'Costa</a></p> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6"> -->
<!--                                         <div class="card single-blog-item v1 mar-bot-30"> -->
<!--                                             <img src="images/blog/news_9.jpg" alt="..."> -->
<!--                                             <a href="#" class="blog-cat btn v6 red">Travel</a> -->
<!--                                             <div class="card-body"> -->
<!--                                                 <h4 class="card-title"><a href="single-news-two.html">Top 50 Greatest Street Arts in Paris</a></h4> -->
<!--                                                 <div class="bottom-content"> -->
<!--                                                     <p class="date">Dec 5th , 2018 by <a href="#" class="text-dark">Adam D'Costa</a></p> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6"> -->
<!--                                         <div class="card single-blog-item v1 mar-bot-30"> -->
<!--                                             <img src="images/blog/news_12.jpg" alt="..."> -->
<!--                                             <a href="#" class="blog-cat btn v6 red">Travel</a> -->
<!--                                             <div class="card-body"> -->
<!--                                                 <h4 class="card-title"><a href="single-news-two.html">Beauty of Singapore through the eyes of Kalyra</a></h4> -->
<!--                                                 <div class="bottom-content"> -->
<!--                                                     <p class="date">Mar 12th , 2019 by <a href="#" class="text-dark">Adam D'Costa</a></p> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <!--pagination starts-->
                                <div class="post-nav nav-res pad-top-20 pad-bot-60">
                                    <div class="row">
                                        <div class="col-md-8 offset-md-2  col-xs-12 ">
                                            <div class="page-num text-center">
                                                <ul> 
                                                    <li <% if(x==1) {out.write("class=\"active\"");} %>><a href="http://localhost:7080/G1test2/download/forum.jsp?page=1">1</a></li>     
                                                    <li <% if(x==2) {out.write("class=\"active\"");} %>><a href="http://localhost:7080/G1test2/download/forum.jsp?page=2">2</a></li>
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
                    <!--Blog post ends-->
                    <!-- Right Sidebar starts-->
                    <div class="col-xl-3 col-md-12 sidebar">
                        <div class="widget search">
                            <form>
                                <input type="text" class="form-control" placeholder="Search">
                                <button type="submit" class="search-button"><i class="ion-ios-search"></i></button>
                            </form>
                        </div>
                        <div class="widget categories">
                            <h3 class="widget-title">文章分類</h3>
                            <ul class="icon">
                                <li><a class="link-hov style3" href="#">心情</a></li>
                                <li><a class="link-hov style3" href="#">遊記</a></li>
                                <li><a class="link-hov style3" href="#">購物</a></li>
                                <li><a class="link-hov style3" href="#">美食</a></li>
                                <li><a class="link-hov style3" href="#">其他</a></li>
                            </ul>
                        </div>
                        <div class="widget recent-posts">
                            <h3 class="widget-title">近期文章</h3>
                            <ul class="post-list">
                                <li class="row mar-top-30">
                                    <div class="col-lg-5 col-4">
                                        <div class="entry-img">
                                            <img src="images/blog/blog-thumb-1.jpg" alt="...">
                                        </div>
                                    </div>
                                    <div class="col-lg-7 col-8">
                                        <div class="entry-text">
                                            <h4 class="entry-title"><a href="single-news-two.html">Best caffe in London </a></h4>
                                            <span class="entry-date">Aug 16th, 2017</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="row mar-top-30">
                                    <div class="col-lg-5 col-4">
                                        <div class="entry-img">
                                            <img src="images/blog/blog-thumb-2.jpg" alt="...">
                                        </div>
                                    </div>
                                    <div class="col-lg-7 col-8">
                                        <div class="entry-text">
                                            <h4 class="entry-title"><a href="single-news-two.html">3 Ways to style city street</a></h4>
                                            <span class="entry-date">Oct 12th, 2017</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="row mar-top-30">
                                    <div class="col-lg-5 col-4">
                                        <div class="entry-img">
                                            <img src="images/blog/blog-thumb-3.jpg" alt="...">
                                        </div>
                                    </div>
                                    <div class="col-lg-7 col-8">
                                        <div class="entry-text">
                                            <h4 class="entry-title"><a href="single-news-two.html">Best Cheap Hotel in London</a></h4>
                                            <span class="entry-date">Sep 25th, 2017</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- Tags -->
                        <div class="widget">
                            <h3 class="widget-title">Tags</h3>
                            <ul class="list-tags">
                                <li><a href="#" class="btn v6 dark">Hotel</a></li>
                                <li><a href="#" class="btn v6 dark">Travel</a></li>
                                <li><a href="#" class="btn v6 dark">Living</a></li>
                                <li><a href="#" class="btn v6 dark">Eat &amp; Drink</a></li>
                                <li><a href="#" class="btn v6 dark">Luxury</a></li>
                                <li><a href="#" class="btn v6 dark">Food</a></li>
                                <li><a href="#" class="btn v6 dark">Restaurant</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Right Sidebar ends -->
                </div>
            </div>
        </div>
        <!--Blog section ends-->
        <!-- Scroll to top starts-->
        <span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
        <!-- Scroll to top ends-->
    </div>
    <!--Page Wrapper ends-->
    <!--Footer Starts-->
    <div class="footer-wrapper no-pad-tb v2">
        <div class="footer-top-area section-padding" >
            <div class="container">
                <div class="row nav-folderized">
                    <div class="col-lg-3 col-md-12" >
                        <div class="footer-logo">
                            <!-- <a href="index.html"> <img src="images/f.png" alt="logo"></a> -->
                            <a href="index.html"> <h1>Fun心遊台灣</h1></a>
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
                            <h2 class="title" >聯絡我們</h2>
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
                                        <div class="text"><a href="#">組員個人履歷</a></div>
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
            <a class="color green-theme" title="green"></a>
            <a class="color red-theme" title="red"></a>
            <a class="color blue-theme" title="blue"></a>
            <a class="color orange-theme" title="orange"></a>
            <a class="color pink-theme" title="pink"></a>
            <a class="color purple-theme" title="purple"></a>
            <a class="color violet-theme" title="violet"></a>
            <a class="color aqua-theme" title="aqua"></a>
        </div>
    </div>
    <!--Color switcher ends-->
    <!--Scripts starts-->
    <!--plugin js-->
    <script src="js/plugin.js"></script>
    <!--google maps-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
    <!--Main js-->
    <script src="js/main.js"></script>
    <!--Scripts ends-->
</body>

</html>
