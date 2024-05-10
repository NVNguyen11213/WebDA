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
    <link rel="stylesheet" href="${classpath }/frontend/css/signup.css">
    <link rel="stylesheet" href="${classpath }/frontend/bootstrap/bootstrap.min.css">
    <title>Signup</title>
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
                            Đăng ký
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <main>
        <div class="container margin-bottom-40 margin-top-40">
            <div class="d-none">
                <h1 class="title-head">Đăng nhập tài khoản</h1>
            </div>
            <div class="row justify-content-md-center">
                <div class="col-lg-7 col-md-12">
                    <div class="page-login account-box-shadow">
                        <div id="login" class="row">
                            <div class="col-lg-12 col-md-12 account-content order-lg-last order-md-last order-sm-first order-first">
                                <ul class="auth-block__menu-list">
                                    <li>
                                        <a href="${classpath }/login">Đăng nhập</a>
                                    </li>
                                    <li  class="active">
                                        <a href="">Đăng ký</a>
                                    </li>
                                </ul>
                                <div id="nd-login">
                                    <form method="post" action="${classpath }/register" id="customer_login" accept-charset="utf-8">
                                        <input type="hidden" name="FormType" value="customer_login">
                                        <input type="hidden" name="utf8" value="true">
                                        <div class="form-signup"></div>
                                        <div class="form-signup clearfix">
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="username">
                                                    username
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="username" type="text" autocomplete="off" placeholder="Username"
                                                class="form-control form-control-lg" id="username">
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="password">
                                                    Password
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="password" type="password" autocomplete="off" placeholder="Password"
                                                class="form-control form-control-lg" id="password">
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="retypepassword">
                                                    Retype password
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="retypepassword" type="password" autocomplete="off" placeholder="Retypepassword"
                                                class="form-control form-control-lg" id="retypepassword">
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="name">
                                                    Name
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="name" type="text" autocomplete="off" placeholder="Name"
                                                class="form-control form-control-lg" id="name">
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="email">
                                                    Email
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="email" type="email" autocomplete="off" placeholder="Email"
                                                class="form-control form-control-lg" id="email">
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-0">
                                                <label for="mobile">
                                                    Mobile
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="mobile" type="text" autocomplete="off" placeholder="Mobile"
                                                class="form-control form-control-lg" id="mobile">
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-0">
                                                <label for="address">
                                                    Address
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="address" type="text" autocomplete="off" placeholder="Address"
                                                class="form-control form-control-lg" id="address">
                                            </fieldset>
                                            <div class="clearfix">

                                            </div>
                                            <p class="text-right recover">
                                                <a href="" title="Quên mật khẩu" class="btn-link-style" onclick="showRecoverPasswordForm();">Quên mật khẩu?</a>
                                            </p>
                                            <div class="pull-xs-left text-center">
                                                <button class="btn btn-style btn-blues" type="submit" value="Đăng nhập">Đăng ký</button>
                                            </div>
                                            <p class="login--notes">
                                                ND Shoes cam kết bảo mật và sẽ không bao giờ đăng <br>
                                                hay chia sẻ thông tin mà chưa có được sự đồng ý của bạn.
                                            </p>
                                        </div>
                                    </form>
                                    <div class="clearfix"></div>
                                    <div class="line-break">
                                        <span>hoặc qua đăng nhập</span>
                                    </div>
                                    <div class="social-login text-center">
                                        <a href="" class="social-login--facebook" onclick="loginFacebook()">
                                            <img src="${classpath }/frontend/img/fb-btn.svg" alt="">
                                        </a>
                                        <a href="" class="social-login--google" onclick="loginGoogle()">
                                            <img src="${classpath }/frontend/img/gp-btn.svg" alt="">
                                        </a>
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
</body>
<script>
//Lấy các phần tử cần thiết từ DOM
let passwordInput = document.querySelector('#password');
let retypePasswordInput = document.querySelector('#retypepassword');
let eyePassword = document.querySelector('.eye-password');
let eyeRetypePassword = document.querySelector('.eye-retypepassword');

// Định nghĩa hàm để xử lý sự kiện khi click vào biểu tượng mắt
function togglePasswordVisibility(input, eyeIcon) {
    if (input.type === 'password') {
        input.type = 'text';
        eyeIcon.src = '${classpath}/frontend/img/icon/visible.png';
    } else {
        input.type = 'password';
        eyeIcon.src = '${classpath}/frontend/img/icon/hide.png';
    }
}

// Lắng nghe sự kiện click vào biểu tượng mắt cho password
eyePassword.addEventListener('click', () => {
    togglePasswordVisibility(passwordInput, eyePassword);
});

// Lắng nghe sự kiện click vào biểu tượng mắt cho retype password
eyeRetypePassword.addEventListener('click', () => {
    togglePasswordVisibility(retypePasswordInput, eyeRetypePassword);
});

</script>
<script src="${classpath }/frontend/js/validator.js"></script>
<script>
// Mong muốn của chúng ta
Validator({
	form: '#register-form',
	errorSelector: '.form-message',
	rules: [
		Validator.isRequired('#name'),
		Validator.isRequired('#email'),
		Validator.isEmail('#email'),
		Validator.isRequired('#mobile'),
		Validator.isMobile('#mobile'),
		Validator.isRequired('#address'),
		Validator.isRequired('#username'),
		Validator.isRequired('#password'),
		Validator.minLength('#password', 3),
		Validator.isRequired('#retypepassword'),
		Validator.isConfirmed('#retypepassword', function(){
			return document.querySelector('#register-form #password').value;
		}, 'Mật khẩu nhập lại không chính xác'),
	]
});
</script>
</html>