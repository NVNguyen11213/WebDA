<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${classpath }/frontend/css/index.css">
    <link rel="stylesheet" href="${classpath }/frontend/bootstrap/bootstrap.min.css">
    <title>${title }</title>
</head>
<body>
    <!--header -->
    <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="${classpath }/frontend/img/slider1a.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="${classpath }/frontend/img/slider1b.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="${classpath }/frontend/img/slider1c.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="${classpath }/frontend/img/slider1d.jpg" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
    </nav>
    <main>
        <!-- Section-bg -->
        <section class="section" id="section_1602075946">
            <div class="bg section-bg fill bg-fill  bg-loaded">

            </div>
            <div class="section-content relative">
                <div class="row align-center icon-dm" id="row-1829521801">
                    <div class="col icon-dm-left medium-12 small-12 large-6">
                        <div class="col-inner">
                            <div class="row row-solid" id="row-1999089823">
                                <div class="col medium-3 small-6 large-3">
                                    <div class="col-inner text-center">
                                        <a href="" class="plan">
                                            <div class="icon-box featured-box icon-box-center text-center">
                                                <div class="icon-box-img" style="width: 60px">
                                                    <div class="icon">
                                                        <div class="icon-inner">
                                                            <img src="${classpath }/frontend/img/ico_1.jpg" width="65" height="40" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="icon-box-text last-reset">
                                                    <h5 style="text-align: center;">Bộ sư tập</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col medium-3 small-6 large-3">
                                    <div class="col-inner text-center">
                                        <a href="" class="plan">
                                            <div class="icon-box featured-box icon-box-center text-center">
                                                <div class="icon-box-img" style="width: 60px">
                                                    <div class="icon">
                                                        <div class="icon-inner">
                                                            <img src="${classpath }/frontend/img/ico_2.jpg" width="65" height="40" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="icon-box-text last-reset">
                                                    <h5 style="text-align: center;">Boots</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col medium-3 small-6 large-3">
                                    <div class="col-inner text-center">
                                        <a href="" class="plan">
                                            <div class="icon-box featured-box icon-box-center text-center">
                                                <div class="icon-box-img" style="width: 60px">
                                                    <div class="icon">
                                                        <div class="icon-inner">
                                                            <img src="${classpath }/frontend/img/ico_3.jpg" width="65" height="40" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="icon-box-text last-reset">
                                                    <h5 style="text-align: center;">Cao gót</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col medium-3 small-6 large-3">
                                    <div class="col-inner text-center">
                                        <a href="" class="plan">
                                            <div class="icon-box featured-box icon-box-center text-center">
                                                <div class="icon-box-img" style="width: 60px">
                                                    <div class="icon">
                                                        <div class="icon-inner">
                                                            <img src="${classpath }/frontend/img/ico_4.jpg" width="65" height="40" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="icon-box-text last-reset">
                                                    <h5 style="text-align: center;">Thể thao</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col icon-dm-left medium-12 small-12 large-6">
                        <div class="col-inner">
                            <div class="row row-solid" id="row-1999089823">
                                <div class="col icon-dm-nam medium-3 small-6 large-3">
                                    <div class="col-inner text-center">
                                        <a href="" class="plan">
                                            <div class="icon-box featured-box icon-box-center text-center">
                                                <div class="icon-box-img" style="width: 60px">
                                                    <div class="icon">
                                                        <div class="icon-inner">
                                                            <img src="${classpath }/frontend/img/ico_5.jpg" width="65" height="40" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="icon-box-text last-reset">
                                                    <h5 style="text-align: center;">Đế gỗ</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col medium-3 small-6 large-3">
                                    <div class="col-inner text-center">
                                        <a href="" class="plan">
                                            <div class="icon-box featured-box icon-box-center text-center">
                                                <div class="icon-box-img" style="width: 60px">
                                                    <div class="icon">
                                                        <div class="icon-inner">
                                                            <img src="${classpath }/frontend/img/ico_6.jpg" width="65" height="40" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="icon-box-text last-reset">
                                                    <h5 style="text-align: center;">Đế bệt</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col medium-3 small-6 large-3">
                                    <div class="col-inner text-center">
                                        <a href="" class="plan">
                                            <div class="icon-box featured-box icon-box-center text-center">
                                                <div class="icon-box-img" style="width: 60px">
                                                    <div class="icon">
                                                        <div class="icon-inner">
                                                            <img src="${classpath }/frontend/img/ico_7.jpg" width="65" height="40" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="icon-box-text last-reset">
                                                    <h5 style="text-align: center;">Giày bup bê</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col medium-3 small-6 large-3">
                                    <div class="col-inner text-center">
                                        <a href="" class="plan">
                                            <div class="icon-box featured-box icon-box-center text-center">
                                                <div class="icon-box-img" style="width: 60px">
                                                    <div class="icon">
                                                        <div class="icon-inner">
                                                            <img src="${classpath }/frontend/img/ico_8.jpg" width="65" height="40" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="icon-box-text last-reset">
                                                    <h5 style="text-align: center;">Sneaker</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="conatiner">
            <div class="section_product_new">
                <div class="container3">
                    <div class="block-title">
                        <h2><a href="" title="Sản phẩm mới">Sản phẩm mới</a></h2>
                        <p class="title-des">Các sản phẩm mới có tại cửa hàng</p>
                    </div>
                    <div class="block-product">
                        <div class="row">
                        <c:forEach items="${products }" var="product" varStatus="loop">
                            <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                <div class = "pro">
                                    <div class="card">
                                        <div class="btn-action">
                                            <a href="" title="Sản phẩm yêu thích">
                                                <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                    <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                            <div class="action-cart">    
                                                <button title="Thêm vào giỏ hàng">
                                                <a onclick="addToCart(${product.id}, 1, '${product.name }')">
                                                    <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                        <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                    </svg>
                                                </a>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="images" style="height:200px">
                                        <a href="${classpath }/product-detail/${product.id}"></a>
                                            <img src="${classpath }/FileUploads/${product.avatar }" class="card-img-top card-img" alt="..." style="height: 100%">
                                        </div>
                                        <c:if test="${product.salePrice > 0}">
								<div class="sale-flash">
									<fmt:formatNumber
										value="${discountsForAllProducts[loop.index] * -1}"
										type="number" pattern="#,##0'%'" />
								</div>
							</c:if>
                                        <div class="card-body">
                                          <h3 class="card-title"><a href="${classpath }/product-detail/${product.id}">${product.name }</a></h3>
                                          <!-- <span class="brand">Niken</span> -->
                                          <div class="bottom-action">
													<c:choose>
														<c:when test="${product.salePrice > 0}">
															<span class="price-box"><fmt:formatNumber
																	value="${product.salePrice}" pattern="#,##0₫" /> </span>
															<span class="old-price"><fmt:formatNumber
																	value="${product.price}" pattern="#,##0₫" /> </span>
														</c:when>
														<c:otherwise>
															<span class="price-box"><fmt:formatNumber
																	value="${product.price}" pattern="#,##0₫" /> </span>
														</c:otherwise>
													</c:choose>
												</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        <div class="view-more">
                            <a href="${classpath }/allproduct" title="Xem tất cả">Xem tất cả</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="awe-section-4">
            <div class="section_best_sellers">
                <div class="container3">
                    <div class="block-title">
                        <h2><a href="" title="Sản phẩm mới">Sản phẩm bán chạy</a></h2>
                        <p class="title-des">Các sản phẩm bán chạy tại cửa hàng</p>
                    </div>
                    <div class="block-product">
                        <div class="row">
                        <c:forEach items="${isHotProducts }" var="product" varStatus="loop">
                            <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                <div class = "pro">
                                    <div class="card">
                                        <div class="btn-action">
                                            <a href="" title="Sản phẩm yêu thích">
                                                <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                    <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                            <div class="action-cart">    
                                                <button title="Thêm vào giỏ hàng">
                                                <a onclick="addToCart(${product.id}, 1, '${product.name }')">
                                                    <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                        <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                    </svg>
                                                </a>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="images" style="height:200px">
                                        <a href="${classpath }/product-detail/${product.id}"></a>
                                            <img src="${classpath }/FileUploads/${product.avatar }" class="card-img-top card-img" alt="..." style="height: 100%">
                                        </div>
                                        <c:if test="${product.salePrice > 0}">
								<div class="sale-flash">
									<fmt:formatNumber
										value="${discountsForAllProducts[loop.index] * -1}"
										type="number" pattern="#,##0'%'" />
								</div>
							</c:if>
                                        <div class="card-body">
                                          <h3 class="card-title"><a href="${classpath }/product-detail/${product.id}">${product.name }</a></h3>
                                          <!-- <span class="brand">Niken</span> -->
                                          <div class="bottom-action">
													<c:choose>
														<c:when test="${product.salePrice > 0}">
															<span class="price-box"><fmt:formatNumber
																	value="${product.salePrice}" pattern="#,##0₫" /> </span>
															<span class="old-price"><fmt:formatNumber
																	value="${product.price}" pattern="#,##0₫" /> </span>
														</c:when>
														<c:otherwise>
															<span class="price-box"><fmt:formatNumber
																	value="${product.price}" pattern="#,##0₫" /> </span>
														</c:otherwise>
													</c:choose>
												</div>
                                        </div>
                                    </div>
                                    </div>
                            </div>
                            </c:forEach>
                    </div>
                </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-content relative">
            <div class="row" id="row-news">
                <div class="col small-12 large-12">
                    <div class="col-inner text-center">
                        <div class="title_module">
                            <h2 class="bf_flower">
                                <a href=""># Tin mới nhất</a>
                                <span>
                                    Nơi cập nhập những xu hướng thời trang mới nhất cho bạn
                                </span>
                            </h2>
                        </div>
                        <div class="row" id="row-content-new">
                            <div class="col medium-6 small-12 large-6">
                                <div class="col-inner">
                                    <div class="row large-columns-1 medium-columns-1 small-columns-1">
                                        <div class="col post-item">
                                            <div class="col-inner">
                                                <a href="">
                                                    <div class="box box-default box-text-bottom box-blog-post has-hover">
                                                        <div class="box-image">
                                                            <div class="image-cover" >
                                                                <img width="533" height="400" src="${classpath }/frontend/img/Giới-trẻ-Việt-rộ-mốt-đi-dép-cá-rô-phi-533x400.jpg" alt="">
                                                            </div>
                                                        </div>
                                                        <div class="box-text text-left">
                                                            <div class="box-text-inner blog-post-inner">
                                                                <h5 class="post-title is-large ">Giới trẻ Việt rộ mốt đi dép cá rô phi</h5>
                                                                <div class="post-meta is-small op-8">22 Tháng Mười, 2023</div>
                                                                <div class="is-divider"></div>
                                                                <p class="from_the_blog_excerpt ">Trào lưu của giới trẻ thường bất ngờ xuất hiện mà chẳng cần lý do. Một bài hát, một câu nói, thậm chí một chiếc áo… cũng có thể trở thành xu hướng. Mới đây, ảnh chụp đôi&nbsp;dép&nbsp;nhựa màu xanh, [...]					</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col medium-6 small-12 large-6">
                                <div class="col-inner">
                                    <div class="row large-columns-2 medium-columns-1 small-columns-1">
                                        <div class="col post-item">
                                            <a href="">
                                                <div class="box box-normal box-text-bottom box-blog-post has-hover">
                                                    <div class="box-image">
                                                        <div class="image-cover">
                                                            <img width="553" height="400" src="${classpath }/frontend/img/Chọn-giày-dép-lúc-nào-cũng-vừa-in-chân-533x400.jpg" alt="">
                                                        </div>
                                                    </div>
                                                    <div class="box-text text-left">
                                                        <div class="box-text-inner blog-post-inner">
                                                            <h5 class="post-title is-large ">Chọn giày dép lúc nào cũng vừa in chân</h5>
                                                            <div class="post-meta is-small op-8">22 Tháng Mười, 2023</div>
                                                            <div class="is-divider"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col post-item">
                                            <a href="">
                                                <div class="box box-normal box-text-bottom box-blog-post has-hover">
                                                    <div class="box-image">
                                                        <div class="image-cover">
                                                            <img width="553" height="400" src="${classpath }/frontend/img/Thêm-5-đôi-sneaker-màu-ngọt-lịm-533x400.jpg" alt="">
                                                        </div>
                                                    </div>
                                                    <div class="box-text text-left">
                                                        <div class="box-text-inner blog-post-inner">
                                                            <h5 class="post-title is-large ">Thêm 5 đôi sneaker màu ngọt lịm</h5>
                                                            <div class="post-meta is-small op-8">22 Tháng Mười, 2023</div>
                                                            <div class="is-divider"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col post-item">
                                            <a href="">
                                                <div class="box box-normal box-text-bottom box-blog-post has-hover">
                                                    <div class="box-image">
                                                        <div class="image-cover">
                                                            <img width="553" height="400" src="${classpath }/frontend/img/Dép-Puma-Fenty-mẫu-mới-nhất-của-Rihanna-533x400.jpg" alt="">
                                                        </div>
                                                    </div>
                                                    <div class="box-text text-left">
                                                        <div class="box-text-inner blog-post-inner">
                                                            <h5 class="post-title is-large ">Dép Puma Fenty mẫu mới nhất của Rihanna</h5>
                                                            <div class="post-meta is-small op-8">22 Tháng Mười, 2023</div>
                                                            <div class="is-divider"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col post-item">
                                            <a href="">
                                                <div class="box box-normal box-text-bottom box-blog-post has-hover">
                                                    <div class="box-image">
                                                        <div class="image-cover">
                                                            <img width="553" height="400" src="${classpath }/frontend/img/Choáng-ngợp-với-tủ-giày-hàng-trăm-đôi-533x400.jpg" alt="">
                                                        </div>
                                                    </div>
                                                    <div class="box-text text-left">
                                                        <div class="box-text-inner blog-post-inner">
                                                            <h5 class="post-title is-large ">Choáng ngợp với tủ giày hàng trăm đôi</h5>
                                                            <div class="post-meta is-small op-8">22 Tháng Mười, 2023</div>
                                                            <div class="is-divider"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
   	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
    <script src="${classpath }/frontend/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="${classpath }/frontend/bootstrap/popper.min.js"></script>
    <script src="${classpath }/frontend/bootstrap/bootstrap.min.js"></script>
    <script src="${classpath }/frontend/js/index.js"></script>
    

	<!-- Add to cart -->
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName) {		
			//alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: _quantity,
				productName:_productName,
			};
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message); 
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script> 
</body>
</html>