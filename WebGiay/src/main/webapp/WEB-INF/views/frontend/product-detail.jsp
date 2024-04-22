<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${classpath }/frontend/css/product_details.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="${classpath }/frontend/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${classpath }/frontend/slick/slick.css">
    <title>${title }</title>
</head>
<body>
    <!--header -->
    <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div class="shop-page-title category-page-title page-title ">
            <div class="page-title-inner flex-row  medium-flex-wrap container">
                <div class="flex-col flex-grow medium-text-center">
                    <div class="is-large">
                        <div class="woocommerce-breadcrumb breadcrumbs uppercase">
                            <a href="">Trang chủ</a>
                            <span class="divider">/</span>
                            Liên hệ 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <main>
        <div class="product details-main">
            <div class="container">
                <div class="row">
                    <div class="product-detail-left product-images col-12 col-md-12 col-lg-7 ">
                        <div class="product-image-detail relative">
                            <div class="product-image-btn">
                                <a href="" title="Thêm vào yêu thích" class="action btn-compare js-btn-wishlist setWishlist btn-views">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none"> <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </svg>
                                </a>
                                <div id="playvideo">
                                    <a href="" class="btn-views" title="Xem video">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                                            <path d="M1 11V13V14.2C1 15.7464 2.2536 17 3.8 17H14.2C15.7464 17 17 15.7464 17 14.2V3.8C17 2.2536 15.7464 1 14.2 1H3.8C2.2536 1 1 2.2536 1 3.8V5V7" stroke="#292D32" stroke-width="1.5" stroke-linecap="round"></path>
                                            <path d="M11.6707 8.42255C12.1145 8.71738 12.1087 9.35857 11.6594 9.64558L8.16385 11.8789C7.66101 12.2002 6.99465 11.8442 7.00003 11.2572L7.04156 6.72962C7.04694 6.1426 7.71972 5.79833 8.21659 6.12835L11.6707 8.42255Z" stroke="#292D32" stroke-width="1.5"></path>
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="swiper-container gallery-top margin-bottom-10" id="lightgallery">
                                <div class="swiper-wrapper">
                                    <a href="" class="swiper-slide 0" data-hash="0" title="Bấm vào để xem thư viện ảnh GIÀY Ultraboost 4.0 DNA">
                                        <img class="img-responsive mx-auto d-block lazy loading"  width="340px" height="340px" src="${classpath }/frontend/images/sp-trang-5-1.webp" alt="">
                                    </a>
                                    <a href="" class="swiper-slide 1" data-hash="1" title="Bấm vào để xem thư viện ảnh GIÀY Ultraboost 4.0 DNA">
                                        <img class="img-responsive mx-auto d-block lazy loading"  width="340px" height="340px" src="${classpath }/frontend/images/sp-trang-5-2.jpg" alt="">
                                    </a>
                                    <a href="" class="swiper-slide 2" data-hash="2" title="Bấm vào để xem thư viện ảnh GIÀY Ultraboost 4.0 DNA">
                                        <img class="img-responsive mx-auto d-block lazy loading" width="340px" height="340px" src="${classpath }/frontend/images/sp-trang-5-3.webp" alt="">
                                    </a>
                                    <a href="" class="swiper-slide 3" data-hash="3" title="Bấm vào để xem thư viện ảnh GIÀY Ultraboost 4.0 DNA">
                                        <img class="img-responsive mx-auto d-block lazy loading"  width="340px" height="340px" src="${classpath }/frontend/images/sp-trang-5-4.webp" alt="">
                                    </a>
                                    <a href="" class="swiper-slide 4" data-hash="4" title="Bấm vào để xem thư viện ảnh GIÀY Ultraboost 4.0 DNA">
                                        <img class="img-responsive mx-auto d-block lazy loading"  width="340px" height="340px" src="${classpath }/frontend/images/sp-trang-5-5.webp" alt="">
                                    </a>
                                    <a href="" class="swiper-slide 5" data-hash="5" title="Bấm vào để xem thư viện ảnh GIÀY Ultraboost 4.0 DNA">
                                        <img class="img-responsive mx-auto d-block lazy loading"  width="340px" height="340px" src="${classpath }/frontend/images/sp-trang-5-6.webp" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="swiper-container gallery-thumbs swiper-container-initialized swiper-container-vertical swiper-container-pointer-events">
                                <div class="swiper-wrapper scroll" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
                                    <div class="swiper-slide swiper-slide-visible" data-hash="0" style="height: 86px; margin-bottom: 10px;">
                                        <img class="lazy loading" src="${classpath }/frontend/images/sp-trang-5-1.webp" alt="">
                                    </div>
                                    <div class="swiper-slide swiper-slide-visible" data-hash="1" style="height: 86px; margin-bottom: 10px;">
                                        <img class="lazy loading" src="${classpath }/frontend/images/sp-trang-5-2.jpg" alt="">
                                    </div>
                                    <div class="swiper-slide swiper-slide-visible" data-hash="2" style="height: 86px; margin-bottom: 10px;">
                                        <img class="lazy loading" src="${classpath }/frontend/images/sp-trang-5-3.webp" alt="">
                                    </div>
                                    <div class="swiper-slide swiper-slide-visible" data-hash="3" style="height: 86px; margin-bottom: 10px;">
                                        <img class="lazy loading" src="${classpath }/frontend/images/sp-trang-5-4.webp" alt="">
                                    </div>
                                    <div class="swiper-slide swiper-slide-visible" data-hash="4" style="height: 86px; margin-bottom: 10px;">
                                        <img class="lazy loading" src="${classpath }/frontend/images/sp-trang-5-5.webp" alt="">
                                    </div>
                                    <div class="swiper-slide swiper-slide-visible" data-hash="5" style="height: 86px; margin-bottom: 10px;">
                                        <img class="lazy loading" src="${classpath }/frontend/images/sp-trang-5-6.webp" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <div class="col-12 col-md-12 col-lg-5 details-pro">
                        <div class="wrapright-content">
                            <h1 class="title-head">GIÀY Ultraboost 4.0 DNA</h1>
                            <div class="product-top clearfix">
                                <div class="sku-product clearfix">
                                    <span itemprop="brand">
                                        Thương hiệu
                                        <strong>Adidas</strong>
                                    </span>
                                    <span class="variant-sku" content="Ultraboost4.0">
                                        Mã
                                        <strong>Ultraboost4.0</strong>
                                    </span>
                                </div>
                            </div>
                            <div class="group-power">
                                <div class="price-box clearfix">
                                    <div class="special-price">
                                        <span class="price product-price">4.500.000₫</span>
                                    </div>
                                </div>
                            </div>
                            <form enctype="multipart/form-data" id="add-to-cart-form" action="/cart/add" class="wishItem" method="post">
                                <div class="form-product">
                                   <div class="select-swatch">
                                        <div class=" swatch clearfix">
                                            <div class="options-title">
                                                Kích thước: 
                                                <span class="var">40</span>
                                            </div>
                                            <div data-value="40" class="swatch-element 40 available">
                                                <input id="swatch-1-40" type="radio" name="option-1" value="40" checked="">
                                                <label title="40" for="swatch-1-40">
                                                    40
                                                </label>
                                            </div>
                                            <div data-value="41" class="swatch-element 41 available">
                                                <input id="swatch-1-41" type="radio" name="option-1" value="41">
                                                
                                                <label title="41" for="swatch-1-41">
                                                    41
                                                </label>
                                            </div>
                                            <div data-value="42" class="swatch-element 42 available">
                                                <input id="swatch-1-42" type="radio" name="option-1" value="42">
                                                
                                                <label title="42" for="swatch-1-42">
                                                    42
                                                </label>
                                            </div>
                                            <div data-value="43" class="swatch-element 43 available">
                                                <input id="swatch-1-43" type="radio" name="option-1" value="43">
                                                
                                                <label title="43" for="swatch-1-43">
                                                    43
                                                </label>
                                            </div>
                                            <div data-value="44" class="swatch-element 44 available">
                                                <input id="swatch-1-44" type="radio" name="option-1" value="44">
                                                
                                                <label title="44" for="swatch-1-44">
                                                    44
                                                </label>
                                            </div>
                                        </div>

                                   </div>
                                   <div class="clearfix from-action-addcart">
                                        <div class="qty-ant clearfix custom-btn-number">
                                            <label class="d-none">Số lượng:</label>
                                            <div class="custom custom-btn-numbers clearfix input_number_product">
                                                <button class="btn-minus btn-cts" type="button">-</button>
                                                <input type="text" class="qty input-text" id="qty" name="quantity" size="4" value="1">
                                                <button class="btn-plus btn-cts" type="button">+</button>
                                            </div>
                                        </div>
                                        <div class="btn-mua">
                                            <button type="submit" data-role="addtocart" class="btn btn-lg btn-gray btn-cart btn_buy add_to_cart">Thêm vào giỏ</button>
                                            <button type="button" class="btn btn-buy-now" data-id="56777157" data-qty="1">Mua ngay</button>
                                        </div>
                                   </div>
                                </div>
                            </form>
                            <div class="size-guide-box ">
                                <a href="" title="Xem hướng dẫn chọn size">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="19" viewBox="0 0 18 19" fill="none">
                                        <path d="M17 6V15.14C17 16.7969 15.6569 18.14 14 18.14H4C2.34315 18.14 1 16.7969 1 15.14V13.855V11.7125M12.2305 1H4C2.34315 1 1 2.34314 1 4V5.285V7.4275" stroke="#292D32" stroke-width="1.5" stroke-linecap="round"></path>
                                        <path d="M12.5595 1.09666L16.9033 5.44046C17.1098 5.64694 16.9636 6 16.6716 6H12.3278C12.1467 6 12 5.85325 12 5.67223V1.32843C12 1.03642 12.3531 0.890174 12.5595 1.09666Z" stroke="#292D32" stroke-width="1.5"></path>
                                        <line x1="6.75" y1="13.25" x2="11.25" y2="13.25" stroke="#292D32" stroke-width="1.5" stroke-linecap="round"></line>
                                        <line x1="5.75" y1="10.25" x2="12.25" y2="10.25" stroke="#292D32" stroke-width="1.5" stroke-linecap="round"></line>
                                    </svg>
                                    Xem hướng dẫn chọn size
                                </a>
                            </div>
                            <div class="product-summary">
                                <div class="rte">
                                    <ul>
                                        <li>Vừa vặn như đi tất</li>
                                        <li>Có dây buộc </li>
                                        <li>Thân giày adidas Primeknit</li>
                                        <li>Lớp lót bằng vải dệt</li>
                                        <li>Đệm gót giày nâng đỡ</li>
                                        <li>Đế giữa Boost</li>
                                        <li>Trọng lượng: 328 g</li>
                                        <li>Chênh lệch độ cao đế giữa: 10 mm (gót giày 22 mm / mũi giày 12 mm)</li>
                                        <li>Đế ngoài công nghệ Stretchweb làm từ cao su Continental™</li>
                                        <li>Primeblue</li>
                                        <li>Màu sản phẩm: Core Black / Core Black / Silver Metallic</li>
                                        <li>Mã sản phẩm: FZ4008</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-12">
                        <div class="product-tab e-tabs not-dqtab">
                            <ul class="tabs tabs-title clearfix">
                                <li class="tab-link current" data-tab="tab-1">
                                    <span>Thông tin chi tiết</span>
                                </li>
                                <li class="tab-link" data-tab="tab-2">
                                    <span>Thương hiệu</span>
                                </li>
                            </ul>
                            <div class="tab-1 tab-content content_extab current">
                                <div class="rte product_getcontent">
                                    <div class="ba-text-fpt">
                                        <p>Hãy chạy bộ hết mình. Vì tâm trí của bạn, cơ thể của bạn và vì hành tinh xanh. Mang tinh thần thân thiện với đại dương, đôi giày chạy bộ này làm từ chất liệu tái chế. Giày cũng tôn vinh công nghệ chạy bộ huyền thoại nhất của adidas. Thân giày bằng vải dệt kim thông thoáng, đế giữa Boost khai thác tác động của từng cú tiếp đất để thúc đẩy bạn tiến về phía trước, cùng đế giày linh hoạt cho sải bước mượt mà. Xỏ giày. Khởi động. Cất bước.</p>
                                        <p>Sản phẩm này may bằng vải công nghệ Primeblue, chất liệu tái chế hiệu năng cao có sử dụng sợi Parley Ocean Plastic. 50% thân giày làm bằng vải dệt, 75% vải dệt bằng sợi Primeblue. Không sử dụng polyester nguyên sinh.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-2 tab-content content_extab">
                                <div class="rte">
                                    Nội dung tùy chỉnh viết ở đây 	
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
    <script src="${classpath }/frontend/slick/jquery-3.7.1.min.js"></script>
    <script src="${classpath }/frontend/slick/slick.js"></script> 
    <script src="${classpath }/frontend/js/index.js"></script>
</body>
</html>