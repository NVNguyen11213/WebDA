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
    <link rel="stylesheet" href="${classpath }/frontend/css/login.css">
    <link rel="stylesheet" href="${classpath }/frontend/bootstrap/bootstrap.min.css">
    <title>Login</title>
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
                            <a href="${classpath }/index">Trang chủ</a>
                            <span class="divider">/</span>
                            Đăng nhập
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
                                    <li class="active">
                                        <a href="#">Đăng nhập</a>
                                    </li>
                                    <li>
                                        <a href="${classpath }/signup">Đăng ký</a>
                                    </li>
                                </ul>
                                <div id="nd-login">
                                    <form method="POST" action="${classpath }/login_processing_url" id="customer_login" accept-charset="utf-8">
                                        <input type="hidden" name="FormType" value="customer_login">
                                        <input type="hidden" name="utf8" value="true">
                                        <div class="form-signup"></div>
                                        <div class="form-signup clearfix">
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="">
                                                    Tài khoản
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="username" type="text" autocomplete="off" placeholder="Nhập tài khoản"
                                                class="form-control form-control-lg" id="username">
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-0">
                                                <label for="">
                                                    Mật khẩu
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="password" type="password" autocomplete="off" placeholder="Nhập mật khẩu"
                                                class="form-control form-control-lg" id="password">
                                            </fieldset>
                                            <div class="clearfix">

                                            </div>
                                            <p class="text-right recover">
                                                <a href="" title="Quên mật khẩu" class="btn-link-style" onclick="showRecoverPasswordForm();">Quên mật khẩu?</a>
                                            </p>
                                            <div class="pull-xs-left text-center">
                                                <button class="btn btn-style btn-blues" type="submit" value="Đăng nhập">&nbspĐăng nhập&nbsp</button>
                                            </div>
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
	//JS LOGIN SHOW/HIDE PASSWORD AND CHECK INPUT
	let input = document.querySelector('#password');
	let eyePassword = document.querySelector('.eye-password');

	function change() {
		if (input.type === 'password') {
			input.type = 'text';
			eyePassword.src = '${classpath }/frontend/img/icon/visible.png';
		} else {
			input.type = 'password';
			eyePassword.src = '${classpath }/frontend/img/icon/hide.png';
		}
	}
</script>
<script src="${classpath }/frontend/js/validator.js"></script>
<script>
	// Mong muốn của chúng ta
	Validator({
		form : '#login-form',
		errorSelector : '.form-message',
		rules : [ Validator.isRequired('#username'),
				Validator.isRequired('#password'),
				Validator.minLength('#password', 3), ]
	});
</script>
</html>