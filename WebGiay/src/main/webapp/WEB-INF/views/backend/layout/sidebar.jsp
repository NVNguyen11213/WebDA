<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="${classpath}/admin/index">
          <span class="align-middle">AdminKit</span>
        </a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						System administration
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="${classpath}/admin/index">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/category/list">
              <i class="align-middle" data-feather="tag"></i> <span class="align-middle">Categories</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/product/list">
              <i class="align-middle" data-feather="message-square"></i> <span class="align-middle">Products</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/user/list">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Users</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/role/list">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Roles</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/order/list">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Order</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-customer-contact.html">
              <i class="align-middle" data-feather="message-circle"></i> <span class="align-middle">Customer contact</span>
            </a>
					</li>

					<li class="sidebar-header">
						Authentication
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/login">
              <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Sign In</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/signup">
              <i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">Sign Up</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/logout">
              <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">Log out</span>
            </a>
					</li>

				
			</div>
		</nav>