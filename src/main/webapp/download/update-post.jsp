<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.post.model.* , org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.Transaction "%>

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
    <title>listagram - Directory Listing HTML Template</title>
</head>

<body>
   <!--Preloader starts-->
<!--     <div class="preloader js-preloader"> -->
<!--         <img src="images/preloader.gif" alt="..."> -->
<!--     </div> -->
    <!--Preloader ends-->
    <!--Page Wrapper starts-->
    <div class="page-wrapper fixed-footer">
        <!--header starts-->
        <header class="header transparent scroll-hide">
            <!--Main Menu starts-->
            <div class="site-navbar-wrap v2">
                <div class="container">
                    <div class="site-navbar">
                        <div class="row align-items-center">
                            <div class="col-md-4 col-6">
                                <a class="navbar-brand" href="#"><img src="images/logo-black.png" alt="logo" class="img-fluid"></a>
                            </div>
                            <div class="col-md-8 col-6">
                                 <nav class="site-navigation float-left">
                                    <div class="container">
                                        <ul class="site-menu js-clone-nav d-none d-lg-block">
                                            <li class="has-children">
                                                <a href="#">Home</a>
                                                <ul class="dropdown">
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
                                                </ul>
                                            </li>
                                            <li class="has-children">
                                                <a href="#">Listings</a>
                                                <ul class="dropdown">
                                                    <li class="has-children">
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
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="has-children">
                                                <a href="#">Pages</a>
                                                <ul class="dropdown">
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

                                                </ul>
                                            </li>
                                            <li class="has-children">
                                                <a href="#">User Panel</a>
                                                <ul class="dropdown">
                                                    <li><a href="db.html">Dashboard</a></li>
                                                    <li><a href="db-my-listing.html">My Listings</a></li>
                                                    <li><a href="db-bookings.html">Bookings</a></li>
                                                    <li><a href="db-messages.html">Inbox</a></li>
                                                    <li><a href="db-favourites.html">Favourite Listing</a></li>
                                                    <li><a href="db-add-listing.html">Add Listing</a></li>
                                                    <li><a href="db-recieve-reviews.html">Reviews</a></li>
                                                    <li><a href="db-my-profile.html">User  Profile</a></li>
                                                    <li><a href="db-invoices.html">Invoices </a></li>

                                                </ul>
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
                                    <a class="btn v8" href="add-listing.html">Add Listing <i class="ion-plus-round"></i></a>
                                </div>
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
        <div class="breadcrumb-section" style="background-image: url(images/breadcrumb/breadcrumb-1.jpg)">
            <div class="overlay op-5"></div>
            <div class="container">
                <div class="row align-items-center  pad-top-80">
                    <div class="col-md-6 col-12">
                        <div class="breadcrumb-menu">
                            <h2 class="page-title">Add Listing</h2>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="breadcrumb-menu text-right sm-left">
                            <ul>
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#">Add Listing</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Breadcrumb section ends-->
        <!--Add Listing starts-->
        <div class="list-details-section section-padding add_list pad-top-90">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="nav nav-tabs list-details-tab">
                            <li class="nav-item active">
                                <a data-toggle="tab" href="#general_info">General Information</a>
                            </li>
                            <li class="nav-item ">
                                <a data-toggle="tab" href="#gallery">Gallery</a>
                            </li>
                            <li class="nav-item">
                                <a data-toggle="tab" href="#location">Location /Contacts<span class="text-grey"></span></a>
                            </li>
                            <li class="nav-item">
                                <a data-toggle="tab" href="#open_time">Business Hours</a>
                            </li>
                            <li class="nav-item">
                                <a data-toggle="tab" href="#rooms">Rooms/Pricing</a>
                            </li>
                            <li class="nav-item">
                                <a data-toggle="tab" href="#social_network">Social Networks <span class="text-grey"></span></a>
                            </li>
                        </ul>
                        <div class="tab-content mar-tb-30 add_list_content">
                            <div class="tab-pane fade show active" id="general_info">
                                <h4> <i class="ion-ios-information"></i> 發表新文章 :</h4>
                                <% 
                                	List list = (List)session.getAttribute("list");
                                	PostBean bean = (PostBean)list.get(0); 
                                	session.setAttribute("postid", bean.getPostid());
                                %>
                                <form METHOD="post" ACTION="<%=request.getContextPath()%>/PostManage" name="form1">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>文章標題</label>
                                            <input type="text" class="form-control filter-input" placeholder="Hotel Ocean paradise" name="posttitle" value="<%=bean.getPosttitle()%>"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>文章分類</label>
                                            <div class="nice-select filter-input" tabindex="0"><span class="current">Select Categories</span>
                                                
                                                    <select name="posttypeid">
                                                        <option value="1">心情</option>
                                                        <option value="2">遊記</option>
                                                        <option value="3">購物</option>
                                                        <option value="4">美食</option>
                                                        <option value="5">其他</option>
                                                    </select>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>會員編號</label>
                                            <input type="text" class="form-control filter-input" placeholder="Keywords should be separated by commas" name="memberid" value="<%=bean.getMemberid()%>"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" class="form-control filter-input" placeholder="Address of your hotel">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
<!--                                         <form> -->
                                            <div class="form-group">
                                                <label for="list_info">文章內容</label>
                                                <textarea class="form-control" id="list_info" rows="4" placeholder="Enter your text here" name="postcontent" > <%=bean.getPostcontent()%></textarea>
                                            </div>
<!--                                         </form> -->
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Features</label>
                                            <div class="filter-checkbox">
                                                <input id="check-a" type="checkbox" name="check">
                                                <label for="check-a">Elevator in building</label>
                                                <input id="check-b" type="checkbox" name="check">
                                                <label for="check-b">Air Conditioned</label>
                                                <input id="check-c" type="checkbox" name="check">
                                                <label for="check-c">Free Wi Fi</label>
                                                <input id="check-d" type="checkbox" name="check">
                                                <label for="check-d">Free Parking on premises</label>
                                                <input id="check-f" type="checkbox" name="check">
                                                <label for="check-f">Instant Book</label>
                                                <input id="check-e" type="checkbox" name="check">
                                                <label for="check-e">Pet Friendly </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Title</label>
                                                <input type="text" class="form-control filter-input" placeholder="Title">
                                            </div>

                                            <div class="col-md-6">
                                                <label>Icon</label>
                                                <input type="text" class="form-control filter-input" placeholder="Icon">
                                            </div>
                                            <div class="col-md-4">
                                                <input type="hidden" name="action" value="update">
												<input type="submit" value="送出修改">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="gallery">
                                <h4><i class="ion-image"></i> Gallery :</h4>
                                <div class="form-group">
                                    <form class="photo-upload">
                                        <div class="form-group">
                                            <div class="add-listing__input-file-box">
                                                <input class="add-listing__input-file" type="file" name="file" id="file">
                                                <div class="add-listing__input-file-wrap">
                                                    <i class="ion-ios-cloud-upload"></i>
                                                    <p>Click here to upload your images</p>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="add-btn">
                                    <a href="#" class="btn v8 mar-top-20">Add Images</a>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="location">
                                <h4><i class="ion-ios-location"></i> Location/Contacts :</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select City</label>
                                            <div class="nice-select filter-input" tabindex="0"><span class="current">Select City</span>
                                                <ul class="list">
                                                    <li class="option selected focus">New York</li>
                                                    <li class="option">Chicago</li>
                                                    <li class="option">Las Vegas</li>
                                                    <li class="option">Los Angeles</li>
                                                    <li class="option">Austin</li>
                                                    <li class="option">Downturn</li>
                                                    <li class="option">DownturnSan Diago</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" class="form-control filter-input" placeholder="ex. 250, Fifth Avenue...">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>State</label>
                                            <input type="text" class="form-control filter-input" placeholder="ex. New York">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Zip Code</label>
                                            <input type="text" class="form-control filter-input" placeholder="ex. 5858">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                Longitude (Drag marker on the map)</label>
                                            <input type="text" class="form-control filter-input" placeholder="Map Longitude">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                Latitude (Drag marker on the map) </label>
                                            <input type="text" class="form-control filter-input" placeholder="Map Latitude">
                                        </div>
                                    </div>
                                    <div class="col-md-12 no-padding">
                                        <div id="map"></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mar-top-15">
                                            <label>Website </label>
                                            <input type="text" class="form-control filter-input">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mar-top-15">
                                            <label>Phone </label>
                                            <input type="text" class="form-control filter-input">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="rooms">
                                <h4><i class="ion-ios-location"></i> Rooms/Pricing :</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Room Title</label>
                                            <input type="text" class="form-control filter-input" placeholder="Standard family Room">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Capacity</label>
                                            <input type="text" class="form-control filter-input" placeholder="2 persons">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input type="text" class="form-control filter-input" placeholder="$180">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Room Details</label>
                                            <input type="text" class="form-control filter-input" placeholder="Total for 1 room, 2 nights">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <form class="photo-upload">
                                                <div class="form-group">
                                                    <div class="add-listing__input-file-box">
                                                        <input class="add-listing__input-file" type="file" name="file" id="file">
                                                        <div class="add-listing__input-file-wrap">
                                                            <i class="ion-ios-cloud-upload"></i>
                                                            <p>Click here to upload your images</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="#" class="btn v8 mar-top-15">Add Images</a>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Features</label>
                                            <div class="filter-checkbox">
                                                <input id="check-m" type="checkbox" name="check">
                                                <label for="check-m">Tv inside</label>
                                                <input id="check-n" type="checkbox" name="check">
                                                <label for="check-n">Air Conditioned</label>
                                                <input id="check-o" type="checkbox" name="check">
                                                <label for="check-o">Free Wi Fi</label>
                                                <input id="check-p" type="checkbox" name="check">
                                                <label for="check-p">Breakfast</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>Title</label>
                                                <input type="text" class="form-control filter-input" placeholder="Title">
                                            </div>
                                            <div class="col-md-4">
                                                <label>Number</label>
                                                <input type="text" class="form-control filter-input" placeholder="Number">
                                            </div>
                                            <div class="col-md-4">
                                                <label>Icon</label>
                                                <input type="text" class="form-control filter-input" placeholder="Icon">
                                            </div>
                                            <div class="col-md-4">
                                                <a href="#" class="btn v8 mar-top-20">Add Facts</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="open_time">
                                <h4><i class="ion-clock"></i> Opening/Business Hours :</h4>
                                <div class="row mar-bot-30">
                                    <div class="col-md-2">
                                        <label class="fix_spacing">Monday</label>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Closing Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mar-bot-30">
                                    <div class="col-md-2">
                                        <label class="fix_spacing">Tuesday</label>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Closing Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="row mar-bot-30">
                                    <div class="col-md-2">
                                        <label class="fix_spacing">Wednesday</label>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Closing Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="row mar-bot-30">
                                    <div class="col-md-2">
                                        <label class="fix_spacing">Thursday</label>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Closing Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="row mar-bot-30">
                                    <div class="col-md-2">
                                        <label class="fix_spacing">Friday</label>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Closing Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="row mar-bot-30">
                                    <div class="col-md-2">
                                        <label class="fix_spacing">Saturday</label>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Closing Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="row mar-bot-30">
                                    <div class="col-md-2">
                                        <label class="fix_spacing">Sunday</label>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Closing Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4><i class="ion-clock"></i> Event Date :</h4>
                                    </div>
                                </div>
                                <div class="row mar-bot-30">
                                    <div class="col-sm-4 col-12">
                                        <div id="datepicker-from" class="input-group date" data-date-format="dd-mm-yyyy">
                                            <input class="form-control" type="text" placeholder="Select date">
                                            <span class="input-group-addon"><i class="icofont-ui-calendar"></i></span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-12">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-12">
                                        <div class="nice-select filter-input" tabindex="0"><span class="current">Opening Time</span>
                                            <ul class="list">
                                                <li class="option selected focus">7.00 am</li>
                                                <li class="option">8.00 am</li>
                                                <li class="option">9.00 am</li>
                                                <li class="option">10.00 am</li>
                                                <li class="option">11.00 am</li>
                                                <li class="option">12.00 am</li>
                                                <li class="option">1.00 pm</li>
                                                <li class="option">2.00 pm</li>
                                                <li class="option">3.00 pm</li>
                                                <li class="option">4.00 pm</li>
                                                <li class="option">5.00 pm</li>
                                                <li class="option">6.00 pm</li>
                                                <li class="option">7.00 pm</li>
                                                <li class="option">8.00 pm</li>
                                                <li class="option">9.00 pm</li>
                                                <li class="option">10.00 pm</li>
                                                <li class="option">11.00 pm</li>
                                                <li class="option">12.00 pm</li>
                                                <li class="option">00.00 am</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="social_network">
                                <h4><i class="icofont-ui-social-link"></i>Social Networks:</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Facebook link (Optional)</label>
                                            <input type="text" class="form-control filter-input" placeholder="Facebook url">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Pinterest (Optional)</label>
                                            <input type="text" class="form-control filter-input" placeholder="Pinterest url">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Twitter link (Optional)</label>
                                            <input type="text" class="form-control filter-input" placeholder="Twitter url">
                                        </div>
                                    </div>
                                    <div class="col-md-6 text-left">
                                        <div class="res-box mar-top-10">
                                            <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                            <label for="remember">I've read and accept <a href="terms.html">terms &amp; conditions</a></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 text-right sm-left">
                                        <button class="btn v8" type="submit">Preview</button>
                                        <button class="btn v8" type="submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Add Listing ends-->
        <!-- Scroll to top starts-->
        <span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
        <!-- Scroll to top ends-->
    </div>
    <!--Page Wrapper ends-->
    <!--Footer Starts-->
     <div class="footer-wrapper no-pad-tb footer-fixed v1" style="background-image: url(images/bg/footer-bg-1.png)">
       <div class="overlay op-1"></div>
        <div class="footer-top-area section-padding" >
            <div class="container">
                <div class="row nav-folderized">
                    <div class="col-lg-3 col-md-12">
                        <div class="footer-logo">
                            <a href="index.html"> <img src="images/logo-black.png" alt="logo"></a>
                            <div class="company-desc">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio excepturi nam totam sequi, ipsam consequatur repudiandae libero illum.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-12">
                        <div class="footer-content nav">
                            <h2 class="title">Helpful Links</h2>
                            <ul class="list">
                                <li><a class="link-hov style2" href="#">Login</a></li>
                                <li><a class="link-hov style2" href="#">My Account</a></li>
                                <li><a class="link-hov style2" href="#">Add Listing</a></li>
                                <li><a class="link-hov style2" href="#">Privacy policy</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-12">
                        <div class="footer-content nav">
                            <h2 class="title">Category</h2>
                            <ul class="list">
                                <li><a class="link-hov style2" href="#">Shop</a></li>
                                <li><a class="link-hov style2" href="#">Travel</a></li>
                                <li><a class="link-hov style2" href="#">Sport</a></li>
                                <li><a class="link-hov style2" href="#">Restaurant</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-12">
                        <div class="footer-content nav">
                            <h2 class="title">Contact us</h2>
                            <ul class="list footer-list">
                                <li>
                                    <div class="contact-info">
                                        <div class="icon">
                                            <i class="ion-ios-location"></i>
                                        </div>
                                        <div class="text">13th North Ave, Florida, USA</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="contact-info">
                                        <div class="icon">
                                            <i class="ion-email"></i>
                                        </div>
                                        <div class="text"><a href="#">info@listagram.com</a></div>
                                    </div>
                                </li>
                                <li>
                                    <div class="contact-info">
                                        <div class="icon">
                                            <i class="ion-ios-telephone"></i>
                                        </div>
                                        <div class="text">+44 078 767 595</div>
                                    </div>
                                </li>
                            </ul>
                            <ul class="social-buttons style2">
                                <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                                <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                                <li><a href="#"><i class="ion-social-pinterest"></i></a></li>
                                <li><a href="#"><i class="ion-social-youtube"></i></a></li>
                                <li><a href="#"><i class="ion-social-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2 text-center">
                        <p>&copy; 2019 listagram. All Rights Reserved.</p>
                    </div>
                </div>
            </div>
        </div>
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
