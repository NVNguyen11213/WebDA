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
<link rel="stylesheet" href="${classpath }/frontend/css/product.css">
<link rel="stylesheet"
	href="${classpath }/frontend/bootstrap/bootstrap.min.css">
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
							<a href="">Trang chủ</a> <span class="divider">/</span> Cửa hàng
						</div>
					</div>
				</div>
				<div class="flex-col medium-text-center">
					<form class="woocommerce-ordering" method="get">
						<select class="orderby" id="sortOption" name="sortOption">
							<option value="" selected>Mặc định</option>
							<option value="priceASC"
								<c:if test="${productSearch.sortOption.equals('priceASC')}">selected</c:if>>Thứ
								tự theo giá: thấp đến cao</option>
							<option value="priceDESC"
								<c:if test="${productSearch.sortOption.equals('priceDESC')}">selected</c:if>>Thứ
								tự theo giá: cao xuống thấp</option>
							<input type="submit" value="Submit">
						</select>
					</form>
				</div>
			</div>
		</div>
	</nav>
	<main>
		<div class="container cate-content">
			<div class="row">
				<div
					class="main_container collection col-lg-12 col-md-12 col-sm-12 col-12">
					<div
						class="category-products products category-products-grids clearfix">
						<div class="products-view products-view-grid row">
							<c:forEach items="${products }" var="product" varStatus="loop">
								<div class=" mb-3 col-lg-3 col-md-4 col-sm-6 col-6 product-col">
									<div class="pro">
										<div class="card">
											<div class="btn-action">
												<a href="" title="Sản phẩm yêu thích"> <svg
														class="icon-heart" xmlns="http://www.w3.org/2000/svg"
														width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                    <path
															d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z"
															stroke="#949494" stroke-width="1.5"
															stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
												</a>
												<div class="action-cart">
													<a
														onclick="addToCart(${product.id}, 1, '${product.name }')">
														<button title="Thêm vào giỏ hàng">
															<svg class="action-icon-cart"
																xmlns="http://www.w3.org/2000/svg" width="19"
																height="17" viewBox="0 0 19 17" fill="none">
                                                        <circle cx="9"
																	cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <circle
																	cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <path
																	d="M2.68421 6.05273L1.8421 6.05273" stroke="white"
																	stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path
																	d="M3.52631 11.1055L2.6842 11.1055" stroke="white"
																	stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path
																	d="M3.52632 8.5791L1 8.5791" stroke="white"
																	stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path
																	d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105"
																	stroke="white" stroke-width="1.5"
																	stroke-linecap="round"></path>
                                                    </svg>
														</button>
												</div>
											</div>
											<div class="images" style="height:200px">
												<a href="${classpath }/product-detail/${product.id}"></a> <img
													src="${classpath }/FileUploads/${product.avatar }"
													class="card-img-top card-img" alt="..." style="height: 100%">
											</div>

											<c:if test="${product.salePrice > 0}">
												<div class="sale-flash">
													<fmt:formatNumber
														value="${discountsForAllProducts[loop.index] * -1}"
														type="number" pattern="#,##0'%'" />
												</div>
											</c:if>
											<div class="card-body">
												<h3 class="card-title">
													<a href="${classpath }/product-detail/${product.id}">${product.name }</a>
												</h3>
												<!-- <span class="brand">Nike</span> -->

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
						<div class="row">
							<div class="col-lg-12 col-sm-12 col-12 margin-top-20 fix-pag">
								<div class="text-center custom-center">
									<div id="paging"></div>
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
				productName: _productName,
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

	<!-- Sort Select -->
	<script>
	$(document).ready(function() {
    	$('#sortOption').change(function() {
        	$('#productSearchForm').submit();
    	});
	});
	</script>

	<!-- pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			
			//Dat gia tri cua category ung voi dieu kien search truoc do
			/* $("#keyword").val(${searchModel.keyword}); */
			
			/* $("#sortOption").val(${searchModel.sortOption});
					
			 $("#paging").pagination("destroy"); // Xóa phân trang cũ */
			$("#paging").pagination({
				currentPage: ${searchModel.currentPage}, //Trang hien tai
				items: ${searchModel.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${searchModel.sizeOfPage}, // số sản phẩm trên 1 trang
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					event.preventDefault();
					$('#currentPage').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>

</body>
</html>