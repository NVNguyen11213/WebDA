<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon"
	href="${classpath }/backend/img/icons/icon-48x48.png" />

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-blank.html" />

<title>${title }</title>
<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<!-- Custome css resource file -->
<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">


</head>

<body>
	<div class="wrapper">
		<!-- Sidebar -->
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="${classpath}/admin/index"> <span
					class="align-middle">AdminKit</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">System administration</li>

					<li class="sidebar-item "><a class="sidebar-link"
						href="${classpath}/admin/index"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
					</a></li>

					<li class="sidebar-item "><a class="sidebar-link"
						href="${classpath}/admin/category/list"> <i
							class="align-middle" data-feather="tag"></i> <span
							class="align-middle">Categories</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${classpath}/admin/product/list"> <i
							class="align-middle" data-feather="message-square"></i> <span
							class="align-middle">Products</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="${classpath}/admin/user/list"> <i class="align-middle"
							data-feather="book"></i> <span class="align-middle">Users</span>
					</a></li>
					<li class="sidebar-item active"><a class="sidebar-link"
						href="${classpath}/admin/role/list"> <i class="align-middle"
							data-feather="book"></i> <span class="align-middle">Roles</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="${classpath}/admin/order/list"> <i class="align-middle"
							data-feather="book"></i> <span class="align-middle">Order</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-customer-contact.html"> <i class="align-middle"
							data-feather="message-circle"></i> <span class="align-middle">Customer
								contact</span>
					</a></li>

					<li class="sidebar-header">Authentication</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-sign-in.html"> <i class="align-middle"
							data-feather="log-in"></i> <span class="align-middle">Sign
								In</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-sign-up.html"> <i class="align-middle"
							data-feather="user-plus"></i> <span class="align-middle">Sign
								Up</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link" href="${classpath}/logout">
							<i class="align-middle" data-feather="log-out"></i> <span
							class="align-middle">Log out</span>
					</a></li>

				</ul>

			</div>
		</nav>
		<div class="main">
			<jsp:include page="/WEB-INF/views/backend/layout/navbar.jsp"></jsp:include>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h1 mb-3" style="font-weight: 700;">List Role</h1>

					<div class="container-fluid">
						<!-- ============================================================== -->
						<!-- Start Page Content -->
						<!-- ============================================================== -->
						<!-- basic table -->
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<!-- Column -->
											<div class="col-md-6 col-lg-3 col-xlg-3">
												<div class="card card-hover">
													<div class="p-2 bg-primary text-center">
														<h1 class="font-light text-white">${roleSearch.totalItems }</h1>
														<h6 class="text-white">Total Roles</h6>
													</div>
												</div>
											</div>
											<!-- Column -->
											<div class="col-md-6 col-lg-3 col-xlg-3">
												<div class="card card-hover">
													<div class="p-2 bg-info text-center">
														<h1 class="font-light text-white">1,738</h1>
														<h6 class="text-white">Responded</h6>
													</div>
												</div>
											</div>
											<!-- Column -->
											<div class="col-md-6 col-lg-3 col-xlg-3">
												<div class="card card-hover">
													<div class="p-2 bg-success text-center">
														<h1 class="font-light text-white">1100</h1>
														<h6 class="text-white">Resolve</h6>
													</div>
												</div>
											</div>
											<!-- Column -->
											<div class="col-md-6 col-lg-3 col-xlg-3">
												<div class="card card-hover">
													<div class="p-2 bg-danger text-center">
														<h1 class="font-light text-white">964</h1>
														<h6 class="text-white">Pending</h6>
													</div>
												</div>
											</div>
											<!-- Column -->
										</div>
										<div class="table-responsive">

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<a href="${classpath }/admin/role/add" role="button"
															class="btn btn-primary">Add New Role</a>
													</div>
												</div>
											</div>
											<table id="zero_config"
												class="table table-striped table-bordered no-wrap">
												<thead>
													<tr>
														<th scope="col">No.</th>
														<th scope="col">Id</th>
														<th scope="col">Name</th>
														<th scope="col">Create by</th>
														<th scope="col">Update by</th>
														<th scope="col">Create date</th>
														<th scope="col">Update date</th>
														<th scope="col">Status</th>
														<th scope="col">Description</th>
														<th scope="col">Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="role" items="${roles }" varStatus="loop">
														<tr>
															<td>${loop.index + 1 }</td>
															<td>${role.id }</td>
															<td>${role.name }</td>
															<td>${role.userCreateRole.username }</td>
															<td>${role.userUpdateRole.username }</td>
															<td><fmt:formatDate value="${role.createDate }"
																	pattern="dd-MM-yyyy" /></td>
															<td><fmt:formatDate value="${role.updateDate }"
																	pattern="dd-MM-yyyy" /></td>
															<td>${role.status }</td>
															<td>${role.description }</td>
															<td><a
																href="${classpath }/admin/role/edit/${role.id }"
																role="button" class="btn btn-primary">Edit</a> <a
																href="${classpath }/admin/role/delete/${role.id }"
																role="button" class="btn btn-secondary">Delete</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>

											<div class="row">
												<div class="col-md-12">
													<div class="pagination justify-content-center">
														<div id="paging"></div>
													</div>
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
			<jsp:include page="/WEB-INF/views/backend/layout/footer.jsp"></jsp:include>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
	<!-- pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			$("#paging").pagination({
				currentPage: ${roleSearch.currentPage}, //Trang hien tai
				items: ${roleSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${roleSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					 window.location.href = "${classpath}/admin/role/list?currentPage=" + pageNumber;
				},
			});
		});
	</script>
</body>

</html>