<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date, com.member.model.*, com.member.controller.*"%>
<%@page import="com.product.productcomment.model.ProductCommentBean"%>
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
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800" rel="stylesheet">
    <!-- Plugins CSS -->
    <link href="css/plugin.css" rel="stylesheet" />
    <!-- style CSS -->
    <link href="css/style.css" rel="stylesheet" />
    <!--color switcher css-->
    <link rel="stylesheet" href="css/switcher/skin-aqua.css" media="screen" id="style-colors" />
    <!-- Document Title -->
    <title>${ProductBean.productname} </title>
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
                                                <a href="<%=request.getContextPath() %>/MVC/ProductDisplayController" style="color: white">產品分類</a>
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
                                                <a href="#" style="color: white"><%= session.getAttribute("memberid")==null ? "登入/註冊" : "登出" %></a>
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
                                    <a class="btn v8" href="<%=request.getContextPath() %>/MVC/ShoppingCart">購物車 <i class="icofont-shopping-cart">&nbsp3</i></a>
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
        <!--Listing Details Hero starts-->
        <div class="listing-details-wrapper bg-h" style="background-image: url(<%=request.getContextPath() %>/ProductImageReader?imgid=<%=((List)request.getAttribute("imgids")).get(0) %>)">
            <div class="overlay op-3"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="list-details-title v1">
                            <div class="row">
                                <div class="col-lg-6 col-md-7 col-sm-12">
                                    <div class="single-listing-title float-left">
                                        <p><a href="#" class="btn v6">Hotel</a></p>
                                        <h2>${ProductBean.productname}<i class="icofont-tick-boxed"></i></h2>
                                        <p><i class="ion-ios-location"></i> 864 W. Walnut Ave.
                                            Avon, IN 46123</p>
                                        <div class="list-ratings">
                                            <span class="ion-android-star"></span>
                                            <span class="ion-android-star"></span>
                                            <span class="ion-android-star"></span>
                                            <span class="ion-android-star"></span>
                                            <span class="ion-android-star-half"></span>
                                            <a href="#">(31 Reviews)</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-5 col-sm-12">
                                    <div class="list-details-btn text-right sm-left">
                                        <div class="save-btn">
                                            <a href="#" class="btn v3 white"><i class="ion-heart"></i> Save</a>
                                        </div>
                                        <div class="share-btn">
                                            <a href="#" class="btn v3 white"><i class="ion-android-share-alt"></i> Share</a>
                                            <ul class="social-share">
                                                <li class="bg-fb"><a href="#"><i class="ion-social-facebook"></i></a></li>
                                                <li class="bg-tt"><a href="#"><i class="ion-social-twitter"></i></a></li>
                                                <li class="bg-ig"><a href="#"><i class="ion-social-instagram"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Listing Details Hero ends-->
        <!--Listing Details Info starts-->
        <div class="list-details-section section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <div id="list-menu" class="list_menu">
                            <ul class="list-details-tab fixed_nav">
                                <li class="nav-item active"><a href="#overview" class="active">商品介紹</a></li>
                                <li class="nav-item"><a href="#gallery">商品圖片</a></li>
                                <li class="nav-item"><a href="#rooms">注意事項</a></li>
                                <li class="nav-item"><a href="#reviews">商品評論</a></li>
                                <!-- <li class="nav-item"><a href="#add_review"></a></li> -->
                            </ul>
                        </div>
                        <!--Listing Details starts-->
                        <div class="list-details-wrap">
                            <div id="overview" class="list-details-section">
                                <h4>商品介紹</h4>
                                <div class="overview-content">
                                		 <p>${ProductBean.productintro}</p>
<!--                                     <p class="mar-bot-10">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta consectetur et porro voluptatem maiores quidem inventore harum explicabo deserunt fuga minima sed, sit nemo expedita. Dolor aliquid rerum recusandae excepturi.</p> -->
<!--                                     <p class="mar-bot-10">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse, dicta, impedit. Eveniet incidunt provident minima totam aut facilis tenetur quam officia omnis dolorem! Autem iste fugit mollitia rerum quae, veritatis perferendis voluptas magni aliquam consequuntur, minima repellendus eveniet laboriosam iure.</p> -->
                                </div>
                                <div class="mar-top-20">
                                    <h6>Amenities</h6>
                                    <ul class="listing-features">
                                        <li><i class="icofont-rocket-alt-1"></i> Elevator in building</li>
                                        <li><i class="icofont-wifi"></i> Free Wi Fi</li>
                                        <li><i class="icofont-car-alt-3"></i> Free Parking on premises</li>
                                        <li><i class="icofont-snow"></i>Air Conditioned</li>
                                        <li><i class="icofont-gym-alt-1"></i>Fitness Center</li>
                                        <li><i class="icofont-search-restaurant"></i> Instant Book</li>
                                        <li><i class="icofont-architecture-alt"></i> Friendly workspace</li>
                                        <li><i class="icofont-wheelchair"></i> Wheelchair Friendly</li>
                                        <li><i class="icofont-paw"></i> Pet Friendly </li>
                                    </ul>
                                </div>
                            </div>
                            <div id="gallery" class="list-details-section">
                                <h4>商品圖片</h4>
                                <!--Carousel Wrapper-->
                                <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails list-gallery" data-ride="carousel">
                                    <!--Slides-->
                                    <div class="carousel-inner" role="listbox">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100" src="<%=request.getContextPath() %>/ProductImageReader?imgid=<%=((List)request.getAttribute("imgids")).get(0) %>" alt="slide">
                                        </div>
                                        <% List imgids = (List)request.getAttribute("imgids"); %>
                                        <% for(int i =1; i<imgids.size();i++){%>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="<%=request.getContextPath() %>/ProductImageReader?imgid=<%=((List)request.getAttribute("imgids")).get(i) %>" alt="slide">
                                        </div>
                                        <% } %>
<!--                                         <div class="carousel-item"> -->
<!--                                             <img class="d-block w-100" src="images/single-listing/gallery-3.jpg" alt="slide"> -->
<!--                                         </div> -->
<!--                                         <div class="carousel-item"> -->
<!--                                             <img class="d-block w-100" src="images/single-listing/gallery-4.jpg" alt="slide"> -->
<!--                                         </div> -->
<!--                                         <div class="carousel-item"> -->
<!--                                             <img class="d-block w-100" src="images/single-listing/gallery-5.jpg" alt="slide"> -->
<!--                                         </div> -->
<!--                                         <div class="carousel-item"> -->
<!--                                             <img class="d-block w-100" src="images/single-listing/gallery-6.jpg" alt="slide"> -->
<!--                                         </div> -->
<!--                                         <div class="carousel-item"> -->
<!--                                             <img class="d-block w-100" src="images/single-listing/gallery-7.jpg" alt="slide"> -->
<!--                                         </div> -->
<!--                                         <div class="carousel-item"> -->
<!--                                             <img class="d-block w-100" src="images/single-listing/gallery-8.jpg" alt="slide"> -->
<!--                                         </div> -->
                                    </div>
                                    <!--Controls starts-->
                                    <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                                        <span class="ion-arrow-left-c" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                                        <span class="ion-arrow-right-c" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                    <!--Controls ends-->
                                    <ol class="carousel-indicators  list-gallery-thumb">
                                    	<% for(int i =0; i<imgids.size();i++){%>
                                        <li data-target="#carousel-thumb" data-slide-to="<%=i %>"><img class="img-fluid d-block w-100" src="<%=request.getContextPath() %>/ProductImageReader?imgid=<%=((List)request.getAttribute("imgids")).get(i) %>" alt="..."></li>
                                        <% } %>
<%--                                         <li data-target="#carousel-thumb" data-slide-to="1"><img class="img-fluid d-block w-100" src="<%=request.getContextPath() %>/ProductImageReader?imgid=<%=((List)request.getAttribute("imgids")).get(1) %>" alt="..."></li> --%>
<%--                                         <li data-target="#carousel-thumb" data-slide-to="2"><img class="img-fluid d-block w-100" src="<%=request.getContextPath() %>/ProductImageReader?imgid=<%=((List)request.getAttribute("imgids")).get(2) %>" alt="..."></li> --%>
<%--                                         <li data-target="#carousel-thumb" data-slide-to="3"><img class="img-fluid d-block w-100" src="<%=request.getContextPath() %>/ProductImageReader?imgid=<%=((List)request.getAttribute("imgids")).get(3) %>" alt="..."></li> --%>
<%--                                         <li data-target="#carousel-thumb" data-slide-to="4"><img class="img-fluid d-block w-100" src="<%=request.getContextPath() %>/ProductImageReader?imgid=<%=((List)request.getAttribute("imgids")).get(4) %>" alt="..."></li> --%>
<!--                                         <li data-target="#carousel-thumb" data-slide-to="5"><img class="img-fluid d-block w-100" src="images/single-listing/gallery-5.jpg" alt="..."></li> -->
<!--                                         <li data-target="#carousel-thumb" data-slide-to="6"><img class="img-fluid d-block w-100" src="images/single-listing/gallery-6.jpg" alt="..."></li> -->
<!--                                         <li data-target="#carousel-thumb" data-slide-to="7"><img class="img-fluid d-block w-100" src="images/single-listing/gallery-7.jpg" alt="..."></li> -->
                                    </ol>
                                </div>
                                <!--/.Carousel Wrapper-->
                            </div>
                            <div id="rooms" class="list-details-section mar-top-75">
                                <h4>注意事項</h4>
                                <div class="overview-content">
                                		 <p>${ProductBean.attention}</p>
<!--                                     <p class="mar-bot-10">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta consectetur et porro voluptatem maiores quidem inventore harum explicabo deserunt fuga minima sed, sit nemo expedita. Dolor aliquid rerum recusandae excepturi.</p> -->
<!--                                     <p class="mar-bot-10">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse, dicta, impedit. Eveniet incidunt provident minima totam aut facilis tenetur quam officia omnis dolorem! Autem iste fugit mollitia rerum quae, veritatis perferendis voluptas magni aliquam consequuntur, minima repellendus eveniet laboriosam iure.</p> -->
                                </div>
                                <!-- <div class="room-type-wrapper">
                                    <div class="room-type-item">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <a href="images/category/hotel/single-room-1.jpg" data-lightbox="single-1">
                                                    <img src="images/category/hotel/single-room-1.jpg" alt="...">
                                                </a>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="feature-left float-left">
                                                            <h3>Standard Single Room</h3>
                                                            <p>Max : <span> 2 Persons</span>
                                                            </p>
                                                            <div class="facilities-list">
                                                                <ul>
                                                                    <li><i class="icofont-wifi"></i><span>Free WiFi</span></li>
                                                                    <li><i class="icofont-bathtub"></i><span>1 Bathroom</span></li>
                                                                    <li><i class="icofont-energy-air"></i><span>Air conditioner</span></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="feature-right float-right">
                                                            <span class="price-amt">$80</span>
                                                            Total for 1 room, 2 nights
                                                            <div class="clear"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="room-type-item">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <a href="images/category/hotel/single-room-2.jpg" data-lightbox="single-1">
                                                    <img src="images/category/hotel/single-room-2.jpg" alt="...">
                                                </a>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="feature-left float-left">
                                                            <h3>Deluxe Room</h3>
                                                            <p>Max : <span> 3 Persons</span>
                                                            </p>
                                                            <div class="facilities-list">
                                                                <ul>
                                                                    <li><i class="icofont-wifi"></i><span>Free WiFi</span></li>
                                                                    <li><i class="icofont-bathtub"></i><span>1 Bathroom</span></li>
                                                                    <li><i class="icofont-energy-air"></i><span>Air conditioner</span></li>
                                                                    <li><i class="icofont-monitor"></i><span> Tv Inside</span></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="feature-right float-right">
                                                            <span class="price-amt">$150</span>
                                                            Total for 1 room, 2 nights
                                                            <div class="clear"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="room-type-item">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <a href="images/category/hotel/single-room-3.jpg" data-lightbox="single-1">
                                                    <img src="images/category/hotel/single-room-3.jpg" alt="...">
                                                </a>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="feature-left float-left">
                                                            <h3>Signature Room</h3>
                                                            <p>Max : <span> 4 Persons</span>
                                                            </p>
                                                            <div class="facilities-list">
                                                                <ul>
                                                                    <li><i class="icofont-wifi"></i><span>Free WiFi</span></li>
                                                                    <li><i class="icofont-bathtub"></i><span>1 Bathroom</span></li>
                                                                    <li><i class="icofont-energy-air"></i><span>Air conditioner</span></li>
                                                                    <li><i class="icofont-monitor"></i><span> Tv Inside</span></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="feature-right float-right">
                                                            <span class="price-amt">$110</span>
                                                            Total for 1 room, 2 nights
                                                            <div class="clear"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                            </div>
<!--                             <div id="reviews" class="list-details-section mar-top-10"> -->
<!--                                 <h4>商品評論 <span>(15)</span></h4> -->
<!--                                 <div class="review-box"> -->
<!--                                     <ul class="review_wrap"> -->
<!--                                         <li> -->
<!--                                             <div class="customer-review_wrap"> -->
<!--                                                 <div class="reviewer-img"> -->
<!--                                                     <img src="images/clients/reviewer-1.png" class="img-fluid" alt="..."> -->
<!--                                                     <p>Frank Jane</p> -->
<!--                                                     <span>35 Reviews</span> -->
<!--                                                 </div> -->
<!--                                                 <div class="customer-content-wrap"> -->
<!--                                                     <div class="customer-content"> -->
<!--                                                         <div class="customer-review"> -->
<!--                                                             <h6>Best hotel in the Newyork city</h6> -->
<!--                                                             <p>Posted 2 days ago</p> -->
<!--                                                         </div> -->
<!--                                                         <div class="customer-rating">5.0</div> -->
<!--                                                     </div> -->
<!--                                                     <p class="customer-text">I love the hotel here but it is so rare that I get to come here. Tasty Hand-Pulled hotel is the best type of whole in the wall restaurant. The staff are really nice, and you should be seated quickly. -->
<!--                                                     </p> -->
<!--                                                     <div class="review-img"> -->
<!--                                                         <img src="images/single-listing/gallery-1.jpg" alt="..."> -->
<!--                                                         <img src="images/single-listing/gallery-2.jpg" alt="..."> -->
<!--                                                         <img src="images/single-listing/gallery-3.jpg" alt="..."> -->

<!--                                                     </div> -->

<!--                                                     <div class="like-btn mar-top-40"> -->
<!--                                                         <a href="#" class="rate-review float-left"><i class="icofont-thumbs-up"></i> Helpful Review <span>2</span></a> -->
<!--                                                         <a href="#" class="rate-review float-right"><i class="icofont-reply"></i>Reply</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                             <ul class="has-child"> -->
<!--                                                 <li> -->
<!--                                                     <div class="customer-review_wrap"> -->
<!--                                                         <div class="reviewer-img"> -->
<!--                                                             <img src="images/clients/reviewr-2.png" class="img-fluid" alt="#"> -->
<!--                                                             <p>Amanda G</p> -->
<!--                                                             <span>35 Reviews</span> -->
<!--                                                         </div> -->
<!--                                                         <div class="customer-content-wrap"> -->
<!--                                                             <div class="customer-content"> -->
<!--                                                                 <div class="customer-review"> -->
<!--                                                                     <h6>Best hotel in the Newyork city</h6> -->
<!--                                                                     <p>Posted 1 day ago</p> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <p class="customer-text">I love the hotel here but it is so rare that I get to come here. Tasty Hand-Pulled hotel is the best type of whole in the wall restaurant. The staff are really nice, and you should be seated quickly. -->
<!--                                                             </p> -->
<!--                                                             <div class="like-btn mar-top-40"> -->
<!--                                                                 <a href="#" class="rate-review float-left"><i class="icofont-thumbs-up"></i> Helpful Review <span>2</span></a> -->
<!--                                                                 <a href="#" class="rate-review float-right"><i class="icofont-reply"></i>Reply</a> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
<!--                                                 <li> -->
<!--                                                     <div class="customer-review_wrap"> -->
<!--                                                         <div class="reviewer-img"> -->
<!--                                                             <img src="images/clients/reviewer-1.png" class="img-fluid" alt="#"> -->
<!--                                                             <p>Frank Jane</p> -->
<!--                                                             <span>35 Reviews</span> -->
<!--                                                         </div> -->
<!--                                                         <div class="customer-content-wrap"> -->
<!--                                                             <div class="customer-content"> -->
<!--                                                                 <div class="customer-review"> -->
<!--                                                                     <h6>Best hotel in the Newyork city</h6> -->
<!--                                                                     <p>Posted 10 hours ago</p> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <p class="customer-text">I love the hotel here but it is so rare that I get to come here. Tasty Hand-Pulled hotel is the best type of whole in the wall restaurant. The staff are really nice, and you should be seated quickly. -->
<!--                                                             </p> -->
<!--                                                             <div class="like-btn mar-top-40"> -->
<!--                                                                 <a href="#" class="rate-review float-left"><i class="icofont-thumbs-up"></i> Helpful Review <span>2</span></a> -->
<!--                                                                 <a href="#" class="rate-review float-right"><i class="icofont-reply"></i>Reply</a> -->
<!--                                                             </div> -->

<!--                                                         </div> -->

<!--                                                     </div> -->
<!--                                                 </li> -->
<!--                                             </ul> -->
<!--                                         </li> -->
<!--                                         <li> -->
<!--                                             <div class="customer-review_wrap"> -->
<!--                                                 <div class="reviewer-img"> -->
<!--                                                     <img src="images/clients/reviewer-3.png" class="img-fluid" alt="#"> -->
<!--                                                     <p>Lee Priest</p> -->
<!--                                                     <span>35 Reviews</span> -->
<!--                                                 </div> -->
<!--                                                 <div class="customer-content-wrap"> -->
<!--                                                     <div class="customer-content"> -->
<!--                                                         <div class="customer-review"> -->
<!--                                                             <h6>Best hotel in the Newyork city</h6> -->
<!--                                                             <p>Posted 2 days ago</p> -->
<!--                                                         </div> -->
<!--                                                         <div class="customer-rating">5.0</div> -->
<!--                                                     </div> -->
<!--                                                     <p class="customer-text">I love the hotel here but it is so rare that I get to come here. Tasty Hand-Pulled hotel is the best type of whole in the wall restaurant. The staff are really nice, and you should be seated quickly. -->
<!--                                                     </p> -->
<!--                                                     <div class="like-btn mar-top-40"> -->
<!--                                                         <a href="#" class="rate-review float-left"><i class="icofont-thumbs-up"></i> Helpful Review <span>2</span></a> -->
<!--                                                         <a href="#" class="rate-review float-right"><i class="icofont-reply"></i>Reply</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </div> -->
                            
                            <!-- 上方為原本的商品評論code 我自己先註解 下方為自己增加的商品評論code -->
                            
                            <% List<ProductCommentBean> comments = (List<ProductCommentBean>)request.getAttribute("comments");%>
                            <%	if(comments!=null && comments.size()!=0){ %>
                            <div id="reviews" class="list-details-section mar-top-10">
                                <h4>商品評論 <span>(<%=comments.size() %>)</span></h4>
                                
                                 
                                <% List<MemberVO> members = (List<MemberVO>)request.getAttribute("members"); %>
                                <%	for(int i =0; i<comments.size(); i++){ %>
                                
                                
                                <div class="review-box">
                                    <ul class="review_wrap">
                                        <li>
                                            <div class="customer-review_wrap">
                                                <div class="reviewer-img">

                                             <% for(int j =0; j < members.size(); j++){ 
                                                    if(comments.get(i).getMemberid()== members.get(j).getMemberid() ){ 
                                             %>
                                                   	<img src="<%=request.getContextPath() %>/member/member.pic?memberid=<%=members.get(j).getMemberid() %>"  >
                                          
                                             <% } }%>   
                                                    
                                                          
                                                    <%	for(int j =0; j < members.size(); j++){
                                                    	if (comments.get(i).getMemberid()== members.get(j).getMemberid()){ 
                                                    		if(members.get(j).getNickname()!=null){
                                                    			out.write("<p>"+  members.get(j).getNickname()   +"</p>");
                                                    		}else{
                                                    			out.write("<p>"+  members.get(j).getEmail()   +"</p>");
                                                    		}
                                                    	
                                                      } }%>
<!--                                                     		<p>Frank Jane</p> -->
<!--                                                     <span>35 Reviews</span> -->
                                                </div>
                                                <div class="customer-content-wrap">
                                                    <div class="customer-content">
                                                        <div class="customer-review">
                                                            <h6><%=comments.get(i).getCommentcontext() %></h6>
<!--                                                             <p>Posted 2 days ago</p> --> 
																<% DateFormat df = new SimpleDateFormat("yyyy/MM/dd");%>
																 <p>於&nbsp<%= df.format(comments.get(i).getCommenttime()) %>&nbsp評論</p>			
                                                        </div>
                                                        <div class="customer-rating"><%=comments.get(i).getScore() %></div>
                                                    </div>
<!--                                                     <p class="customer-text">I love the hotel here but it is so rare that I get to come here. Tasty Hand-Pulled hotel is the best type of whole in the wall restaurant. The staff are really nice, and you should be seated quickly. -->
                                                    </p>

                                                    <div class="like-btn mar-top-40">
                                                        <a href="#" class="rate-review float-left"><i class="icofont-thumbs-up"></i> Helpful Review <span>2</span></a>
                                                        <a href="#" class="rate-review float-right"><i class="icofont-reply"></i>Reply</a>
                                                    </div>
                                                </div>
                                            </div>                                             
                                	</div>
                                	<% } } %>
                            </div>
                            
                            
                            
                            <div id="add_review" class="list-details-section mar-top-10">
                                <h4>留下評論</h4>
                                <form id="leave-review" class="contact-form" >
                                    <h4 class="contact-form__title">
                                        請為此商品留下評論
                                    </h4>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-7 col-12">
                                            <p class="contact-form__rate">
                                                您對此商品的評分等級:
                                            </p>
                                            <p class="contact-form__rate-bx">
                                                <i class="ion-ios-star"></i>
                                                <i class="ion-ios-star"></i>
                                                <i class="ion-ios-star"></i>
                                                <i class="ion-ios-star"></i>
                                                <i class="ion-ios-star"></i>
                                            </p>
                                            <p class="contact-form__rate-bx-show">
                                                <span class="rate-actual">0</span> / 5
                                            </p>
                                        </div>
                                        <div class="col-md-6 col-sm-5 col-12">
                                            <!-- <div class="contact-form__upload-btn xs-left">
                                                <input class="contact-form__input-file" type="file" name="photo-upload" id="photo-upload">
                                                <span>
                                                    <i class="icofont-upload-alt"></i>
                                                    Upload Photos
                                                </span>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input class="contact-form__input-text" type="text" name="name" id="name" placeholder="姓名:">
                                        </div>
                                        <div class="col-md-6">
                                            <input class="contact-form__input-text" type="text" name="mail" id="mail" placeholder="Email:">
                                        </div>
                                    </div>
                                    <textarea class="contact-form__textarea" name="comment" id="comment" placeholder="評論:"></textarea>
                                    <input class="btn v1" type="submit" name="submit-contact" id="submit_contact" value="提交">
                                </form>
                            </div>
                        </div>
                        <!--Listing Details ends-->
                        <!--Similar Listing Starts-->
                        <div class="similar-listing">
                            <div class="similar-listing-title">
                                <h3>類似的商品</h3>
                            </div>
                            <div class="swiper-container similar-list-wrap">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide similar-item">
                                        <img src="images/single-listing/park-hyatt.jpg" alt="...">
                                        <div class="similar-title-box">
                                            <h5><a href="#">Park Hyatt</a></h5>
                                            <p><span class="price-amt">$89</span>/Avg</p>
                                        </div>
                                        <div class="customer-review">
                                            <div class="rating-summary">
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
                                            <p><i class="ion-ios-location"></i> 31st North St, Sydney, Australia</p>
                                        </div>
                                    </div>
                                    <div class="swiper-slide similar-item">
                                        <img src="images/single-listing/hilton.jpg" class="img-fluid" alt="...">
                                        <div class="similar-title-box">
                                            <h5><a href="#">Hilton Moorea</a></h5>
                                            <p><span class="price-amt">$109</span>/Avg</p>
                                        </div>
                                        <div class="customer-review">
                                            <div class="rating-summary">
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
                                            <p><i class="ion-ios-location"></i> Hilton Ave, Miami, USA</p>
                                        </div>
                                    </div>
                                    <div class="swiper-slide similar-item">
                                        <img src="images/single-listing/lagoon-resort.jpg" class="img-fluid" alt="...">
                                        <div class="similar-title-box">
                                            <h5><a href="#">Lagoon Resort &amp; Spa</a></h5>
                                            <p><span class="price-amt">$75</span>/Avg</p>
                                        </div>
                                        <div class="customer-review">
                                            <div class="rating-summary">
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
                                            <p><i class="ion-ios-location"></i> 75 Prince St, NY, USA</p>
                                        </div>

                                    </div>
                                    <div class="swiper-slide similar-item">
                                        <img src="images/single-listing/westin.jpg" class="img-fluid" alt="...">
                                        <div class="similar-title-box">
                                            <h5><a href="#">The Westin Excelsior</a></h5>
                                            <p><span class="price-amt">$89</span>/Avg</p>
                                        </div>
                                        <div class="customer-review">
                                            <div class="rating-summary">
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
                                            <p><i class="ion-ios-location"></i>21st Queens park,London UK</p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="slider-btn v3 similar-next"><i class="ion-arrow-right-c"></i></div>
                            <div class="slider-btn v3 similar-prev"><i class="ion-arrow-left-c"></i></div>
                        </div>
                        <!--Similar Listing ends-->
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="listing-sidebar">
                            <div class="sidebar-widget info">
                                <h3><i class="ion-android-calendar"></i>訂購</h3> <span class='showarea'></span>
<!--                                 <div class="row"> -->
<!--                                     <div class="col-md-12 mar-bot-15"> -->
<!--                                         <div class="nice-select filter-input mar-top-0" tabindex="0"><span class="current">Select Room</span> -->
<!--                                             <ul class="list"> -->
<!--                                                 <li class="option selected focus">Standard Single Room </li> -->
<!--                                                 <li class="option">Deluxe Room</li> -->
<!--                                                 <li class="option">Signature Room</li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6 mar-bot-15"> -->
<!--                                         <div id="datepicker-from" class="input-group date" data-date-format="dd-mm-yyyy"> -->
<!--                                             <input class="form-control" type="text" placeholder="Check In"> -->
<!--                                             <span class="input-group-addon"><i class="icofont-ui-calendar"></i></span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6 mar-bot-15"> -->
<!--                                         <div id="datepicker-to" class="input-group date" data-date-format="dd-mm-yyyy"> -->
<!--                                             <input class="form-control" type="text" placeholder="Check Out"> -->
<!--                                             <span class="input-group-addon"><i class="icofont-ui-calendar"></i></span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6 mar-bot-15"> -->
<!--                                         <div class="book-amount"> -->
<!--                                             <label>Adult</label> -->
<!--                                             <div class="input-group"> -->
<!--                                                 <span class="input-group-btn"> -->
<!--                                                     <button type="button" class="quantity-left-minus btn"> -->
<!--                                                         <span class="ion-minus"></span> -->
<!--                                                     </button> -->
<!--                                                 </span> -->
<!--                                                 <input type="text" class="form-control input-number" value="1"> -->
<!--                                                 <span class="input-group-btn"> -->
<!--                                                     <button type="button" class="quantity-right-plus btn"> -->
<!--                                                         <span class="ion-plus"></span> -->
<!--                                                     </button> -->
<!--                                                 </span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6 mar-bot-15"> -->
<!--                                         <div class="book-amount"> -->
<!--                                             <label>Children</label> -->
<!--                                             <div class="input-group"> -->
<!--                                                 <span class="input-group-btn"> -->
<!--                                                     <button type="button" class="quantity-left-minus btn"> -->
<!--                                                         <span class="ion-minus"></span> -->
<!--                                                     </button> -->
<!--                                                 </span> -->
<!--                                                 <input type="text" class="form-control input-number" value="1"> -->
<!--                                                 <span class="input-group-btn"> -->
<!--                                                     <button type="button" class="quantity-right-plus btn"> -->
<!--                                                         <span class="ion-plus"></span> -->
<!--                                                     </button> -->
<!--                                                 </span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <div class="book-btn text-center">
                                    <a href="#"> 立即訂購</a>
                                </div>
                                <div class="book-btn text-center">
                                    <a onclick='addCart(event)'> 加入購物車</a>
                                    <input type='hidden' value='${ProductBean.productid}'>
                                </div>
                            </div>
                            <div class="sidebar-widget">
                                <div id="map"></div>
                                <div class="address">
                                    <span class="ion-ios-location"></span>
                                    <p> 864 W. Walnut Ave. Avon, IN 46123 St James Pl,
                                        Brooklyn</p>
                                </div>
                                <div class="address">
                                    <span class="ion-ios-telephone"></span>
                                    <p> +44 20 7336 8898</p>
                                </div>
                                <div class="address">
                                    <span class="ion-android-globe"></span>
                                    <p>www.oceanparadise.com</p>
                                </div>
                            </div>
                            <div class="sidebar-widget">
                                <div class="business-time">
                                    <div class="business-title">
                                        <h6><i class="ion-android-alarm-clock"></i> Business Hours</h6>
                                        <span class="float-right">Open Now</span>
                                    </div>
                                    <ul class="business-hours">
                                        <li class="business-open">
                                            <span class="day">Saturday</span>
                                            <div class="atbd_open_close_time">
                                                <span class="time">11:00 am</span> - <span class="time">06:00 pm</span>
                                            </div>
                                        </li>
                                        <li class="business-open trend-closed">
                                            <span class="day">Sunday</span>
                                            <div class="atbd_open_close_time">
                                                <span class="time">Closed</span>
                                            </div>
                                        </li>
                                        <li class="business-open">
                                            <span class="day">Monday</span>
                                            <div class="atbd_open_close_time">
                                                <span class="time">10:00 am</span> - <span class="time">06:00 pm</span>
                                            </div>
                                        </li>
                                        <li class="business-open">
                                            <span class="day">Tuesday</span>
                                            <div class="atbd_open_close_time">
                                                <span class="time">10:00 am</span> - <span class="time">06:30 pm</span>
                                            </div>
                                        </li>
                                        <li class="business-open">
                                            <span class="day">Wednesday</span>
                                            <div class="atbd_open_close_time">
                                                <span class="time">09:00 am</span> - <span class="time">05:00 pm</span>
                                            </div>
                                        </li>
                                        <li class="business-open">
                                            <span class="day">Thursday</span>
                                            <div class="atbd_open_close_time">
                                                <span class="time">10:00 am</span> - <span class="time">07:00 pm</span>
                                            </div>
                                        </li>
                                        <li class="business-open">
                                            <span class="day">Friday</span>
                                            <div class="atbd_open_close_time">
                                                <span class="time">11:00 am</span> - <span class="time">06:00 pm</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sidebar-widget">
                                <div class="coupon-widget" style="background-image: url(images/category/coupon/coupon-bg-1.jpg);">
                                    <div class="overlay op-5"></div>
                                    <a href="#" class="coupon-top">
                                        <span class="coupon-link-icon"></span>
                                        <h3>Book Now &amp; get 20% discount</h3>
                                        <div class="daily-deals-wrap v1">
                                            <!-- countdown start -->
                                            <div class="countdown-deals text-center" data-countdown="2019/12/01"></div>
                                            <!-- countdown end -->
                                        </div>
                                    </a>
                                    <div class="coupon-bottom">
                                        <p>Coupon Code</p>
                                        <div class="coupon-code">DL76T</div>
                                    </div>
                                </div>
                            </div>
                            <div class="sidebar-widget follow">
                                <div class="follow-img">
                                    <img src="images/clients/reviewer-1.png" class="img-fluid" alt="#">
                                    <h6>Christine Evans</h6>
                                    <span>New York</span>
                                </div>
                                <ul class="social-counts">
                                    <li>
                                        <h6>26</h6>
                                        <span>Listings</span>
                                    </li>
                                    <li>
                                        <h6>326</h6>
                                        <span>Followers</span>
                                    </li>
                                    <li>
                                        <h6>12</h6>
                                        <span>Following</span>
                                    </li>
                                </ul>
                                <div class="text-center mar-bot-25">
                                    <a href="#" class="btn v3"><i class="icofont-eye-alt"></i> Follow</a>
                                </div>
                            </div>
                            <div class="sidebar-widget ad-box">
                                <a href="#"><img src="images/others/ad-1.jpg" alt="..."></a>
                            </div>
                            <div class="sidebar-widget listing-tags">
                                <h4>Tags</h4>
                                <ul class="list-tags">
                                    <li><a href="#" class="btn v6 dark">Restaurant</a></li>
                                    <li><a href="#" class="btn v6 dark">Hotel</a></li>
                                    <li><a href="#" class="btn v6 dark">Travel</a></li>
                                    <li><a href="#" class="btn v6 dark">Food</a></li>
                                    <li><a href="#" class="btn v6 dark">Living</a></li>
                                    <li><a href="#" class="btn v6 dark">Luxury</a></li>
                                    <li><a href="#" class="btn v6 dark">Eat &amp; Drink</a></li>
                                </ul>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Listing Details Info ends-->
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
    
    <!-- AJAX部分 -->
    <script>
    function addCart(e){
		console.log($(e.target).next().val());
		$.ajax({
         url: '<%=request.getContextPath() %>/AddShoppingCart',
         type: 'POST',
         data: {
         	productid: $(e.target).next().val()
         },
         dataType: "html",
         success: function(res){
             console.log("成功");
             $('.showarea').html(res);
             
         }
     });    		
	}

    </script>
</body>

</html>
