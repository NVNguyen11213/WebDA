<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header>
<script src="${classpath}/frontend/slick/jquery-3.7.1.min.js"></script>
<script src="${classpath}/frontend/slick.css"></script>
<script src="${classpath}/frontend/slick.js"></script>
        <div class="conatiner">
            <div class="middle-header">
                <div class="header-top">
                    <div class="align-item-center">
                        <div class="logo">
                             <a href="">
                                <img src="${classpath }/frontend/img/logoweb.png" alt="">
                             </a>
                        </div>
                        <div class="menu">
                            <ul>
                                <li class="nav-item active">
                                    <a href="${classpath }/index">Trang chủ</a>
                                </li>
                                <li class="nav-item nav-hover">
                                    <a href="${classpath }/allproduct"">Sản phẩm
                                        <svg class="icon-menu" fill="black" xmlns="http://www.w3.org/2000/svg" height="16" width="10" viewBox="0 0 320 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="sub-li">
                                            <a href="">Giày Nam</a>
                                        </li>
                                        <li class="sub-li">
                                            <a href="">Giày Nữ</a>
                                        </li>
                                        <li class="sub-li">
                                            <a href="">Giày Trẻ Em</a>
                                        </li>
                                        <li class="sub-li">
                                            <a href="">Giày Nội Địa</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="${classpath }/Promotion">Khuyến mãi</a>
                                </li>
                                <li class="nav-item">
                                    <a href="${classpath }/news">Tin tức</a>
                                </li>
                                <li class="nav-item">
                                    <a href="${classpath }/contact">Liên hệ</a>
                                </li>
                            </ul>
                        </div>
                        <div class="header-right">
                            <div class="group-account">
                                <ul>
                                    <li class="block-search">
                                        <div class="icon" >
                                            <a href="">
                                                <svg class="icon-header" fill="black" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                                            </a>
                                        </div>
                                        <div class="nd-header-search nd-search">
                                            <form action="">
                                                <input type="text" placeholder="Tìm kiếm sản phẩm ">
                                                <button>
                                                    <svg class="icon-search" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                                                </button>
                                            </form>
                                        </div>
                                    </li>
                                    <li class="user">
                                        <div class="icon">
                                            <a href="${classpath }/profile" title="Đăng nhập/Đăng ký">
                                                <svg class="icon-header" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
                                        </div>
                                        <div class="drop-account">
                                            <a href="${classpath }/login">Đăng nhập</a>
                                            <a href="${classpath }/login">Đăng xuất</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="icon">
                                            <a href="" class="wishlist-header" title="Sản phẩm yêu thích">
                                                <svg class="icon-header" xmlns="http://www.w3.org/2000/svg" width="18" height="17" viewBox="0 0 18 17" fill="black"><path d="M1.34821 8.7354C0.330209 5.77575 1.60274 2.00897 4.40225 1.2018C5.92926 0.663681 7.96523 1.20177 8.98323 2.81612C10.0012 1.20177 12.0372 0.663681 13.5642 1.2018C16.6182 2.27803 17.6363 5.77575 16.6183 8.7354C15.3458 13.3094 10.2557 16 8.98323 16C7.71073 15.7309 2.87522 13.5784 1.34821 8.7354Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                                                <span class="headerwishlistcount">0</span>
                                            </a>
                                        </div>
                                    </li>
                                    <li class="cart-drop">
                                        <div class="icon">
                                            <a class="list-cart" href="${classpath }/cartview" title="Danh sách giỏ hàng">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>
                                            <span class="count-item" id="totalCartProductsId" >${totalCartProducts }</span>
                                            </a>
                                        </div>
                                       
                                    </li>
                                    <li class="d-lg-none d-inline-block" id="toggleMenu">
                                        <div class="category-action">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="12" viewBox="0 0 18 12" fill="none">
                                                <path d="M6 2V0H18V2H6Z" fill="#F97E6C"></path>
                                                <path d="M0 7H18V5H0V7Z" fill="#F97E6C"></path>
                                                <path d="M6 12H18V10H6V12Z" fill="#F97E6C"></path>
                                             </svg>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </header>