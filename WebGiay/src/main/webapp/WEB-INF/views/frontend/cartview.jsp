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
    <link rel="stylesheet" href="${classpath }/frontend/css/cartview.css">
    <link rel="stylesheet" href="${classpath }/frontend/bootstrap/bootstrap.min.css">
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
                            Giỏ hàng của bạn
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <main>
        <div class="main-cart-page main-container col1-layout">
            <div class="main container cartpcstyle">
                <div class="wrap_background_aside margin-bottom-40">
                    <div class="header-cart">
                        <div class="title-block-page">
                            <h1 class="title_cart">
                                <span>Giỏ hàng của bạn</span>
                            </h1>
                        </div>
                    </div>
                    <div class="cart-page d-xl-block">
                        <div class="drawer__inner">
                            <div class="CartPageContainer">
                                <form action="/cart" method="post" class="cart ajaxcart cartpage">
                                    <div class="cart-header-info">
                                        <div>Thông tin sản phẩm</div>
                                        <div>Đơn giá</div>
                                        <div>Số lượng</div>
                                        <div>Thành tiền</div>
                                    </div>
                                    <div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">
                                        <div class="ajaxcart__row">
                                            <div class="ajaxcart__product cart_product">
                                                <a href="" class="ajaxcart__product-image cart_image" title="Nike">
                                                    <img src="${classpath }/frontend/img/sp1.jpg" alt="">
                                                </a>
                                                <div class="grid__item cart_info">
                                                    <div class="ajaxcart__product-name-wrapper cart_name">
                                                        <a href="" class="ajaxcart__product-name h4" title="Nike Air Force 1 07 LV8">Nike Air Force 1 07 LV8</a>
                                                        <span class="ajaxcart__product-meta variant-title">Đen / 40</span>
                                                        <a href="" class="cart__btn-remove remove-item-cart ajaxifyCart--remove">Xóa</a>
                                                    </div>
                                                    <div class="grid">
                                                        <div class="grid__item one-half text-right cart_prices">
                                                            <span class="cart-price">4.000.000đ</span>
                                                        </div>
                                                    </div>
                                                    <div class="grid">
                                                        <div class="grid__item one-half cart_select">
                                                            <div class="ajaxcart__qty input-group-btn">
                                                                <button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" 
                                                                >-</button>
                                                                <input type="text" name="update[]" class="ajaxcart__qty-num number-sidebar" value="0"
                                                                data-line="1" aria-label="quantity" maxlength="3">
                                                                <button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" 
                                                                >+</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="grid">
                                                        <div class="grid__item one-half text-right cart_prices">
                                                            <span class="cart-price">4.000.000đ</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ajaxcart__row">
                                            <div class="ajaxcart__product cart_product">
                                                <a href="" class="ajaxcart__product-image cart_image" title="Nike">
                                                    <img src="${classpath }/frontend/img/sp1.jpg" alt="">
                                                </a>
                                                <div class="grid__item cart_info">
                                                    <div class="ajaxcart__product-name-wrapper cart_name">
                                                        <a href="" class="ajaxcart__product-name h4" title="Nike Air Force 1 07 LV8">Nike Air Force 1 07 LV8</a>
                                                        <span class="ajaxcart__product-meta variant-title">Đen / 40</span>
                                                        <a href="" class="cart__btn-remove remove-item-cart ajaxifyCart--remove">Xóa</a>
                                                    </div>
                                                    <div class="grid">
                                                        <div class="grid__item one-half text-right cart_prices">
                                                            <span class="cart-price">3.900.000đ</span>
                                                        </div>
                                                    </div>
                                                    <div class="grid">
                                                        <div class="grid__item one-half cart_select">
                                                            <div class="ajaxcart__qty input-group-btn">
                                                                <button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" 
                                                                data-qty="0" data-line="1" aria-label="-">-</button>
                                                                <input type="text" name="update[]" class="ajaxcart__qty-num number-sidebar" value="1"
                                                                data-line="1" aria-label="quantity" maxlength="3">
                                                                <button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" 
                                                                data-qty="2" data-line="1" aria-label="+">+</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="grid">
                                                        <div class="grid__item one-half text-right cart_prices">
                                                            <span class="cart-price">3.900.000đ</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">
                                        <div class="row">
                                            <div class="col-lg-4 col-12 offset-lg-8 offset-xl-8">
                                                <div class="ajaxcart__subtotal">
                                                    <div class="cart__subtotal">
                                                        <div class="cart__col-6">
                                                            Tổng tiền:
                                                        </div>
                                                        <div class="text-right cart__totle">
                                                            <span class="total-price">7.900.000đ</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="page-breadcrumb">
                                    <div class="row">
                                        <div class="main__products-title">
                                            <p>Thông tin khách hàng</p>
                                        </div>
                                    </div>
                                    <form action="/cart-view" method="get">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="form-body">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group mb-4">
                                                                    <label for="name">Customer name (*)</label>
                                                                    <input type="text" class="form-control" id="txtName" name="txtName" placeholder="your name" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group mb-4">
                                                                    <label for="mobile">Customer mobile (*)</label>
                                                                    <input type="text" class="form-control" id="txtMobile" name="txtMobile" placeholder="your phone number" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group mb-4">
                                                                    <label for="phone">Customer email</label>
                                                                    <input type="email" class="form-control" id="txtEmail" name="txtEmail" placeholder="your email" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group mb-4">
                                                                    <label for="phone">Customer address</label>
                                                                    <input type="text" class="form-control" id="txtAddress" name="txtAddress" placeholder="your address" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group mb-4">
                                                                    <a href="/index" class="btn btn-primary active" role="button" aria-pressed="true"> Back to shop </a>
                                                                    <button class="btn btn-primary" onclick="_placeOrder()">Place orders</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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
    
    	<script type="text/javascript">
		updateProductQuantity = function(_productId, _quantity) {
			let data = {
				productId : _productId, //lay theo id
				quantity : _quantity
			};

			//$ === jQuery
			jQuery.ajax({
				url : "/update-product-quantity",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					let totalProducts = jsonResult.totalCartProducts; 
					//Viet lai so luong sau khi bam nut -, +
					$("#productQuantity_" + jsonResult.productId).html(jsonResult.newQuantity); 
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
	
		<script type="text/javascript">
		function _placeOrder() {
			//javascript object
			let data = {				
				txtName : jQuery("#txtName").val(),
				txtEmail : jQuery("#txtEmail").val(), //Get by Id
				txtMobile : jQuery("#txtMobile").val(),
				txtAddress : jQuery("#txtAddress").val(),
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/place-order",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#placeOrderSuccess").html(jsonResult.message);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
    
</body>
</html>