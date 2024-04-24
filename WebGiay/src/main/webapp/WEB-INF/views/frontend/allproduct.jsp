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
                            Cửa hàng
                        </div>
                    </div>
                </div>
                <div class="flex-col medium-text-center">
                    <p class="woocommerce-result-count hide-for-medium">Showing all 11 results</p>
                    <form class="woocommerce-ordering" method="get">
                        <select name="orderby" class="orderby">
                            <option value="popularity">Thứ tự theo mức độ phổ biến</option>
                            <option value="rating">Thứ tự theo điểm đánh giá</option>
                            <option value="date" selected="selected">Mới nhất</option>
                            <option value="price">Thứ tự theo giá: thấp đến cao</option>
                            <option value="price-desc">Thứ tự theo giá: cao xuống thấp</option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
    </nav>
    <main>
        <div class="container cate-content">
            <div class="row">
                <div class="sidebar left-content col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="aside-filter clearfix">
                        <div class="aside-hidden-mobile">
                            <div class="filter-container">
                                <div class="aside-item filter-type">
                                    <div class="aside-title">
                                        Loại
                                        <span class="nd-svg collapsible-plus">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                            </svg>
                                        </span>
                                    </div>
                                    <div class="aside-content filter-group">
                                        <ul class="filter-type">
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <label for="filter-giay-bong-ro" data-filter="giày bóng rổ">
                                                    <input type="checkbox" id="filter-giay-bong-ro" data-text="Giày bóng rổ">
                                                    <i class="fa"></i>
                                                    Giày Nam
                                                </label>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <label for="filter-giay-chay-bo" data-filter="giày chạy bộ">
                                                    <input type="checkbox" id="filter-giay-chay-bo" data-text="Giày chạy bộ">
                                                    <i class="fa"></i>
                                                    Giày Nữ
                                                </label>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <label for="filter-giay-nam" data-filter="giày nam">
                                                    <input type="checkbox" id="filter-giay-nam" data-text="Giày nam">
                                                    <i class="fa"></i>
                                                    Giày Trẻ Em
                                                </label>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <label for="filter-thoi-trang" data-filter="thời trang">
                                                    <input type="checkbox" id="filter-thoi-trang" data-text="Thời trang">
                                                    <i class="fa"></i>
                                                    Giày Nội Địa
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="aside-item filter-tag-style-1 tag-size">
                                    <div class="aside-title">
                                        Kích thước
                                        <span class="nd-svg collapsible-plus">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                            </svg>
                                        </span>
                                    </div>
                                    <div class="aside-content filter-group">
                                        <ul>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-35">
                                                        <input type="checkbox" id="filter-35" data-text="35" data-group="tag1" value="(35)">
                                                        <span class="span-tag">35</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-36">
                                                        <input type="checkbox" id="filter-36" data-text="36" data-group="tag1" value="(36)">
                                                        <span class="span-tag">36</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-37">
                                                        <input type="checkbox" id="filter-37" data-text="37" data-group="tag1" value="(37)">
                                                        <span class="span-tag">37</span>
                                                    </label>
                                                </span>
                                            </li>                                           
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-38">
                                                        <input type="checkbox" id="filter-38" data-text="38" data-group="tag1" value="(38)">
                                                        <span class="span-tag">38</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-39">
                                                        <input type="checkbox" id="filter-39" data-text="39" data-group="tag1" value="(39)">
                                                        <span class="span-tag">39</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-40">
                                                        <input type="checkbox" id="filter-40" data-text="40" data-group="tag1" value="(40)">
                                                        <span class="span-tag">40</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-41">
                                                        <input type="checkbox" id="filter-41" data-text="41" data-group="tag1" value="(41)">
                                                        <span class="span-tag">41</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-42">
                                                        <input type="checkbox" id="filter-42" data-text="42" data-group="tag1" value="(42)">
                                                        <span class="span-tag">42</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-43">
                                                        <input type="checkbox" id="filter-43" data-text="43" data-group="tag1" value="(43)">
                                                        <span class="span-tag">43</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-44">
                                                        <input type="checkbox" id="filter-44" data-text="44" data-group="tag1" value="(44)">
                                                        <span class="span-tag">44</span>
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-45">
                                                        <input type="checkbox" id="filter-45" data-text="45" data-group="tag1" value="(45)">
                                                        <span class="span-tag">45</span>
                                                    </label>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="aside-item filter-tag-style-2 tag-gender">
                                    <div class="aside-title">
                                        Giới tính
                                        <span class="nd-svg collapsible-plus">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                            </svg>
                                        </span>
                                    </div>
                                    <div class="aside-content filter-group">
                                        <ul>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-nam">
                                                        <input type="checkbox" id="filter-nam" value="Nam" data-text="Nam">
                                                        <i class="fa"></i>
                                                        Nam
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-nu">
                                                        <input type="checkbox" id="filter-nu" value="Nu" data-text="Nu">
                                                        <i class="fa"></i>
                                                        Nữ
                                                    </label>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="aside-item filter-price">
                                    <div class="aside-title">
                                        Giá sản phẩm
                                        <span class="nd-svg collapsible-plus">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                            </svg>
                                        </span>
                                    </div>     
                                    <div class="aside-content filter-group">
                                        <ul>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-duoi-1-000-000d">
                                                        <input type="checkbox" id="filter-duoi-1-000-000d" data-text="Duoi-1000000">
                                                        <i class="fa"></i>
                                                        Giá dưới 500.000đ
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-1-000-000d-3-000-000d">
                                                        <input type="checkbox" id="filter-1-000-000d-3-000-000d" data-text="1.000.000đ - 3.000.000đ">
                                                        <i class="fa"></i>
                                                        500.000đ - 1.000.000đ
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-3-000-000d-5-000-000d">
                                                        <input type="checkbox" id="filter-3-000-000d-5-000-000d" data-text="3.000.000đ - 5.000.000đ">
                                                        <i class="fa"></i>
                                                        1.000.000đ - 1.500.000đ
                                                    </label>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main_container collection col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="category-products products category-products-grids clearfix">
                        <div class="products-view products-view-grid row">
                        <c:forEach items="${products }" var="product">
                            <div class=" mb-3 col-lg-4 col-md-4 col-sm-6 col-6 product-col">
                                <a href="${classpath }/product-detail/${product.id}">
                                    <div class="card">
                                        <div class="btn-action">
                                            <a href="" title="Sản phẩm yêu thích">
                                                <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                    <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                            <div class="action-cart">
                                            <a onclick="addToCart(${product.id}, 1, '${product.name }')">
                                                <button title="Thêm vào giỏ hàng">
                                                    <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                        <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="images">
                                            <img src="${classpath }/FileUploads/${product.avatar }" class="card-img-top card-img" alt="...">
                                        </div>
                                        <div class="card-body">
                                          <h3 class="card-title"><a href="${classpath }/product-detail/${product.id}">${product.name }</a></h3>
                                          <!-- <span class="brand">Nike</span> -->
                                          <div class="bottom-action">
                                            <div class="price-box">${product.price }</div>
                                          </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            </c:forEach>
                        </div>
                        <div class="row ">
                            <div class="col-lg-12 col-sm-12 col-12 margin-top-20 fix-pag">
                                <div class="text-center custom-center">
                                    <ul class="pagination clearfix">
                                        <li class="page-item disabled">
                                            <a href="#" title="«" class="page-link">«</a>
                                        </li>
                                        <li class="active page-item disabled">
                                            <a href="#" title="1" class="page-link">1</a>
                                        </li>
                                        <li class="page-item">
                                            <a href="#" title="2" class="page-link">2</a>
                                        </li>
                                        <li class="page-item">
                                            <a href="#" title="»" class="page-link">»</a>
                                        </li>
                                    </ul>
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