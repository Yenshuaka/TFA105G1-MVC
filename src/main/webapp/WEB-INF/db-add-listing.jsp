<%@page import="com.product.product.model.ProductBean"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

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
    <!-- Perfect scrollbar CSS-->
    <link href="css/perfect-scrollbar.css" rel="stylesheet">
    <!-- style CSS -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- Dashboard CSS -->
    <link href="css/dashboard.css" rel="stylesheet" />
     <!--color switcher css-->
    <link rel="stylesheet" href="css/switcher/skin-aqua.css" media="screen" id="style-colors" />
    <!-- Document Title -->
    <title>listagram - Directory Listing HTML Template</title>

</head>

<body>
    <div class="page-wrapper">

        <!--Sidebar Menu Starts-->
        <aside class="menu-sidebar js-right-sidebar d-block d-lg-none">
            <div class="logo">
                <a href="#">
                    <img src="images/logo-black.png" alt="Listagram" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar2">
                <div class="account-img">
                    <img src="images/clients/reviewer-4.png" alt="Steve Austin" />
                </div>
                <h4 class="name">Howdy, Steve!</h4>
                <nav class="navbar-sidebar2">
                    <ul class="list-unstyled navbar__list">
                        <li>
                            <a class="active" href="db.html">
                                <i class="ion-ios-gear-outline"></i>Dashboard
                            </a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="ion-social-buffer-outline"></i>My Listings
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="db-my-listing.html">Active</a>
                                    <span class="inbox-num active">6</span>
                                </li>
                                <li>
                                    <a href="db-my-listing.html">Pending</a>
                                    <span class="inbox-num pending">8</span>
                                </li>
                                <li>
                                    <a href="db-my-listing.html">Expired</a>
                                    <span class="inbox-num expired">12</span>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <a href="db-bookings.html">
                                <i class="ion-ios-copy-outline"></i>Bookings</a>
                        </li>
                        <li>
                            <a href="db-messages.html">
                                <i class="ion-ios-email-outline"></i>Inbox</a>
                            <span class="inbox-num pending">3</span>
                        </li>

                        <li>
                            <a href="db-favourites.html">
                                <i class="ion-ios-heart-outline"></i>Favourites</a>
                        </li>
                        <li>
                            <a href="db-add-listing.html">
                                <i class="ion-ios-plus-outline"></i>Add Listings</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="ion-ios-star-outline"></i>Reviews
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
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
                            </ul>
                        </li>
                        <li>
                            <a href="db-my-profile.html">
                                <i class="ion-ios-person-outline"></i>My profile</a>
                        </li>
                        <li>
                            <a href="db-invoices.html">
                                <i class="ion-ios-printer-outline"></i>Invoices</a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="ion-ios-upload-outline"></i>Logout</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!--Sidebar Menu ends-->

        <!--Dashboard content Wrapper starts-->
        <div class="dash-content-wrap">

            <!-- Top header starts-->
            <header class="db-top-header">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-9 col-sm-6 col-4">
                            <div class="site-navbar-wrap v2">
                                <div class="site-navbar">
                                    <div class="row align-items-center">
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
                                                    <li><a href="db-my-profile.html">User Profile</a></li>
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
                            <div class="header-button">
                                <div class="header-button-item has-noti js-item-menu">
                                    <i class="ion-ios-bell-outline"></i>
                                    <div class="notifi-dropdown js-dropdown">
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
                                            <div class="bg-c1 green">
                                                <i class="icofont-ui-message"></i>
                                            </div>
                                            <div class="content">
                                                <p>You have 3 unread Messages</p>
                                                <span class="date">5min ago</span>
                                            </div>
                                        </div>
                                        <div class="notify-bottom text-center pad-tb-20">
                                            <a href="#">View All Notification</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="header-button-item js-sidebar-btn">
                                    <img src="images/clients/reviewer-4.png" alt="...">
                                    <span>Steve <i class="ion-arrow-down-b"></i></span>
                                </div>
                                 <div class="setting-menu js-right-sidebar d-none d-lg-block">
                                    <div class="account-dropdown__body">
                                        <div class="account-dropdown__item">
                                            <a href="db.html">
                                                <i class="ion-ios-gear-outline"></i>Dashboard</a>
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
                                                <i class="ion-ios-star-outline"></i>Reviews</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="db-messages.html">
                                                <i class="ion-ios-email-outline"></i>Inbox</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="db-my-profile.html">
                                                <i class="ion-ios-person-outline"></i>Profile</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="#">
                                                <i class="ion-ios-upload-outline"></i>Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                            <li><a href="#">Dashboard</a></li>
                                            <li>Add Listing</li>
                                        </ul>
                                    </div>
                                </div>
                                <a class="btn v3" href="add-listing.html"><i class="ion-plus-round"></i>Add Listing </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Dashboard breadcrumb ends-->
            <!--Dashboard content starts-->
            <div class="dash-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="db-add-list-wrap">
                                <div class="act-title">
                                    <h5><i class="ion-ios-information"></i> General Information :</h5>
                                </div>
                                <div class="db-add-listing">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Listing Title</label>
                                                <input type="text" class="form-control filter-input" placeholder="Hotel Ocean paradise">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Category</label>
                                                <div class="nice-select filter-input" tabindex="0"><span class="current">Select Categories</span>
                                                    <ul class="list">
                                                        <li class="option selected focus">Hotels</li>
                                                        <li class="option">Restaurants</li>
                                                        <li class="option">Shopping</li>
                                                        <li class="option">Eat &amp; Drink</li>
                                                        <li class="option">Events</li>
                                                        <li class="option">Fitness</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Keywords</label>
                                                <input type="text" class="form-control filter-input" placeholder="Keywords should be separated by commas">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" class="form-control filter-input" placeholder="Address of your hotel">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <form>
                                                <div class="form-group">
                                                    <label for="list_info">Description</label>
                                                    <textarea class="form-control" id="list_info" rows="4" placeholder="Enter your text here"></textarea>
                                                </div>
                                            </form>
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
                                                    <a href="#" class="btn v7 mar-top-20">Add Facts</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="db-add-list-wrap">
                                <div class="act-title">
                                    <h5><i class="ion-image"></i> Gallery :</h5>
                                </div>
                                <div class="db-add-listing">
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

                            </div>
                            <div class="db-add-list-wrap">
                                <div class="act-title">
                                    <h5><i class="ion-ios-location"></i> Location/Contacts :</h5>
                                </div>
                                <div class="db-add-listing">
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

                            </div>
                            <div class="db-add-list-wrap">
                                <div class="act-title">
                                    <h5><i class="ion-ios-location"></i> Rooms/Pricing :</h5>
                                </div>
                                <div class="db-add-listing">
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
                            </div>
                            <div class="db-add-list-wrap">
                                <div class="act-title">
                                    <h5><i class="ion-clock"></i> Opening/Business Hours :</h5>
                                </div>
                                <div class="db-add-listing">
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
                                            <div class="nice-select filter-input mt-0" tabindex="0"><span class="current">Opening Time</span>
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
                                            <div class="nice-select filter-input mt-0" tabindex="0"><span class="current">Closing Time</span>
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
                            </div>
                            <div class="db-add-list-wrap">
                                <div class="act-title">
                                    <h5><i class="icofont-ui-social-link"></i>Social Networks:</h5>
                                </div>
                                <div class="db-add-listing">
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
            <!--Dashboard content ends-->

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
    <script src="js/plugin.js"></script>
    <!--Perfect Scrollbar JS-->
    <script src="js/perfect-scrollbar.min.js"></script>
    <!--google maps-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
    <!-- Main JS-->
    <script src="js/main.js"></script>
    <!-- Dashboard JS-->
    <script src="js/dashboard.js"></script>
</body>

</html>
