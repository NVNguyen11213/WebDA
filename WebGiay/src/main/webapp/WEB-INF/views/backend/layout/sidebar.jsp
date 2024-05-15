<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="${classpath}/admin/index">
          <span class="align-middle">Quản trị viên</span>
        </a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Quản trị hệ thống
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="${classpath}/admin/index">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Thống kê</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/category/list">
              <i class="align-middle" data-feather="tag"></i> <span class="align-middle">Thể loại</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/product/list">
              <i class="align-middle" data-feather="message-square"></i> <span class="align-middle">Sản phẩm</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/user/list">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Người dùng</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/role/list">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Quyền</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/order/list">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Đơn hàng</span>
            </a>
					</li>
					

					<li class="sidebar-header">
						
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/login">
              <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Đăng nhập</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/signup">
              <i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">Đăng ký</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/logout">
              <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">Đăng xuất</span>
            </a>
					</li>

				
			</div>
		</nav>