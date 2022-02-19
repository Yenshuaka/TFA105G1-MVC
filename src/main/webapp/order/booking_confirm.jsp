<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.order.order.model.* , com.order.order.model.hibernate.* , org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.Transaction "%>

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
    <link href="css_scuess/plugin.css" rel="stylesheet" />
    <!-- style CSS -->
    <link href="css_scuess/style.css" rel="stylesheet" />
    <!--color switcher css-->
    <link rel="stylesheet" href="css_scuess/switcher/skin-aqua.css" media="screen" id="style-colors" />
    <!-- Document Title -->
    <title>listagram - Directory Listing HTML Template</title>
</head>

<style>
/* .footer-wrapper no-pad-tb v20{ */
/* 	margin-top:600px; */
/* } */
</style>

<body>
    <!--Page Wrapper starts-->
    <div class="page-wrapper fixed-footer">
        <!--header starts-->
     <%@ include file="file/Header_main.file"%>
        <!--Header ends-->
        <!--Booking confirmation starts-->
        <div class="list-details-section section-padding add_list mar-top-40">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="booking-confirmation-page">
                            <i class="ion-android-checkmark-circle"></i>
                            <h2 class="margin-top-30">謝謝您的訂購!</h2>
                            <p>您可於信箱內查看購買行程的確認信</p>
                            <a href="invoice.html" class="button margin-top-30">查看訂單</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Booking confirmation ends-->
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
<!--     <div class="color-switcher hide-color-switcher"> -->
<!--         <a class="switcher-button"><i class="ion-android-settings"></i></a> -->
<!--         <div class="color-switcher-title text-center"> -->
<!--             <h5>Switch Colors</h5> -->
<!--         </div> -->
<!--         <div class="color-list text-center"> -->
<!--             <a class="color green-theme" title="green"></a> -->
<!--             <a class="color red-theme" title="red"></a> -->
<!--             <a class="color blue-theme" title="blue"></a> -->
<!--             <a class="color orange-theme" title="orange"></a> -->
<!--             <a class="color pink-theme" title="pink"></a> -->
<!--             <a class="color purple-theme" title="purple"></a> -->
<!--             <a class="color violet-theme" title="violet"></a> -->
<!--             <a class="color aqua-theme" title="aqua"></a> -->
<!--         </div> -->
<!--     </div> -->
    <!--Footer ends-->
   <!--Color switcher starts-->
<!--     <div class="color-switcher hide-color-switcher"> -->
<!--         <a class="switcher-button"><i class="ion-android-settings"></i></a> -->
<!--         <div class="color-switcher-title text-center"> -->
<!--             <h5>Switch Colors</h5> -->
<!--         </div> -->
<!--         <div class="color-list text-center"> -->
<!--             <a class="color green-theme" title="green"></a> -->
<!--             <a class="color red-theme" title="red"></a> -->
<!--             <a class="color blue-theme" title="blue"></a> -->
<!--             <a class="color orange-theme" title="orange"></a> -->
<!--             <a class="color pink-theme" title="pink"></a> -->
<!--             <a class="color purple-theme" title="purple"></a> -->
<!--             <a class="color violet-theme" title="violet"></a> -->
<!--             <a class="color aqua-theme" title="aqua"></a> -->
<!--         </div> -->
<!--     </div> -->
    <!--Color switcher ends-->
    <!--Scripts starts-->
    <!--plugin js-->
    <script src="js_scuess/plugin.js"></script>
    <!--google maps-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
    <!--Main js-->
    <script src="js_scuess/main.js"></script>
    <!--Scripts ends-->
</body>

</html>
