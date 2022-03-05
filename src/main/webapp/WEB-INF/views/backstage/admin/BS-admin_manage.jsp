<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.admin.model.*"%>


<html lang="en">

<head>
<!-- Metas -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="NickWu" content="LionCoders" />
<!-- Links -->
<link rel="icon" type="image/png" href="#" />
<!-- google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800"
	rel="stylesheet">
<!-- Plugins CSS -->
<link href="<%=request.getContextPath()%>/download/css/plugin.css"
	rel="stylesheet" />
<!-- Perfect scrollbar CSS-->
<link
	href="<%=request.getContextPath()%>/download/css/perfect-scrollbar.css"
	rel="stylesheet">
<!-- style CSS -->
<link href="<%=request.getContextPath()%>/download/css/style.css"
	rel="stylesheet" />
<!-- Dashboard CSS -->
<link href="<%=request.getContextPath()%>/download/css/dashboard.css"
	rel="stylesheet" />
<!--color switcher css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/download/css/switcher/skin-aqua.css"
	media="screen" id="style-colors" />
<!-- Document Title -->
<title>會員管理</title>

</head>

<body>

	<div class="page-wrapper">
		<!--Sidebar Menu Starts-->
		<%@include file="/download/file/BS_Sidebar Menu.file"%>
		<!--Sidebar Menu ends-->

		<!--Dashboard content Wrapper starts-->
		<div class="dash-content-wrap">

			<!-- Top header starts-->
			<%@include file="/download/file/BS_Top header.file"%>
			<!-- Top header ends-->

			<!--Dashboard breadcrumb starts-->
			<div class="dash-breadcrumb">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="dash-breadcrumb-content">
								<div class="dash-breadcrumb-left">
									<div class="breadcrumb-menu text-right sm-left">
										<ul>
											<li class="active"><a href="#">Home</a></li>
											<li>管理員管理</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>				
			</div>
			<!--Dashboard breadcrumb ends-->
			<!--Dashboard content starts-->
			<div class="dash-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12 ">
							<div class="invoice-panel">
								<div class="act-title">
									<h5>
										<i class="ion-person"></i>管理員列表 <a class="btn v2"
											href="<%=request.getContextPath()%>/MVC/MemberDispacher/AddMember">新增</a>										
									</h5>
								</div>
								<div class="invoice-body">
									<div class="table-responsive">
										<table class="invoice-table">
											<thead>
												<tr class="invoice-headings" style="text-align: center">
													<th>No.</th>
													<th>姓名</th>
													<th>帳號</th>							
												</tr>
											</thead>
											<c:forEach var="adminVO" items="${AdminList}">
												<tbody>
													<tr style="text-align: center; padding: 10 0">
														<td>${adminVO.empno}</td>
														<td>${adminVO.ename}</td>
														<td>${adminVO.account}</td>
														<td>
															<FORM METHOD="post"
																ACTION="<%=request.getContextPath()%>/member/member.do">
																<input type="submit" class="btn v2" value="編輯">
																<input type="hidden" name="memberid"
																	value="${adminVO.empno}"> <input
																	type="hidden" name="action" value="getOne_For_Update">
															</FORM>
														</td>
														<td>
															<FORM METHOD="post"
																ACTION="<%=request.getContextPath()%>/member/member.do">
																<input type="submit" class="btn v2" value="刪除">
																<input type="hidden" name="memberid"
																	value="${adminVO.empno}"> <input
																	type="hidden" name="action" value="delete">
															</FORM>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Dashboard content ends-->

			<!--Dashboard footer starts-->
			<%@include file="/download/file/BS_footer.file"%>
			<!--Dashboard footer ends-->
		</div>
		<!--Dashboard content Wrapper ends-->
	</div>
	<!-- Plugin JS-->
	<script src="<%=request.getContextPath()%>/download/js/plugin.js"></script>
	<!--Perfect Scrollbar JS-->
	<script
		src="<%=request.getContextPath()%>/download/js/perfect-scrollbar.min.js"></script>
	<!-- Main JS-->
	<script src="<%=request.getContextPath()%>/download/js/main.js"></script>
	<!-- Dashboard JS-->
	<script src="<%=request.getContextPath()%>/download/js/dashboard.js"></script>
</body>

</html>
