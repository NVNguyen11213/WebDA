<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${classpath }/frontend/css/contact.css">
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
                            Liên hệ 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <main>
        <div class="local">
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d465.6194320675544!2d105.80761483058382!3d20.994422585805907!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac9677462ee9%3A0xdce503862294f556!2zMjc3IMSQLiBOZ3V54buFbiBUcsOjaSwgVGhhbmggWHXDom4gVHJ1bmcsIFRoYW5oIFh1w6JuLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1712146577246!5m2!1svi!2s" width="1240" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
        <div class="row">
            <div class="col medium-6 large-6">
                <div class="col-inner">
                    <div class="container section-title-container">
                        <h3 class="section-title section-title-normal">
                            <span class="section-title-main">THÔNG TIN LIÊN HỆ</span>
                        </h3>
                    </div>
                    <p>Hãy gọi đến HOTLINE : <strong style="font-size: 120%;">0905 692 314</strong></p>
                    <p>Hoặc gửi thư qua email : thuongdinhfootwear@gmail.com</p>
                    <p>để được tư vấn và giải đáp mọi thắc mắc của quý khách hàng !</p>
                    <p>Địa chỉ:  277 Đường Nguyễn Trãi, P. Thanh Xuân Trung, Q. Thanh Xuân, Hà Nội, Việt Nam</p>
                </div>
            </div>
            <div class="col medium-6 large-6">
                <div class="col-inner">
                    <div class="container section-title-container">
                        <h3 class="section-title section-title-normal">
                            <span class="section-title-main">GỬI TIN NHẤN</span>
                        </h3>
                    </div>
                    <div class="wpcf7" id="wpcf7-f8-p23-o1">
                        <form action="/lien-he#wpcf7-f8-p23-o1" method="post" class="wpcf7-form" novalidate="novalidate">
                            <div class="form-flat">
                                <span class="wpcf7-form-control-wrap your-name">
                                    <input type="text" name="your-name" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" aria-required="true" aria-invalid="false" placeholder="họ và tên">
                                </span>
                                <p></p>
                                <p>
                                    <span class="wpcf7-form-control-wrap your-email">
                                        <input type="email" name="your-email" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-required wpcf7-validates-as-email" aria-required="true" aria-invalid="false" placeholder="email">
                                    </span> 
                                </p>
                                <p>
                                    <span class="wpcf7-form-control-wrap your-message">
                                        <textarea name="your-message" cols="40" rows="10" class="wpcf7-form-control wpcf7-textarea" aria-invalid="false" placeholder="lời nhắn"></textarea>
                                    </span> 
                                </p>
                                <p>
                                    <input type="submit" value="Submit" class="wpcf7-form-control wpcf7-submit button">
                                    <span class="ajax-loader"></span>
                                </p>
                            </div>
                            <div class="wpcf7-response-output wpcf7-display-none"></div>
                        </form>
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
</body>
</html>