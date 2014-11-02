<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<title>Goo-go</title>
</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top1.jsp" />
	<!-- Page Content -->
	<div class="container">
		<br>
		<!-- Search bar -->
		<jsp:include page="/_03_research/researchBar.jsp" />
		<!-- 搜尋結果 -->
		<div class="row">
			<!-- 地圖-->
			<div class="col-md-5">
				<img class="img-responsive"
					src="${pageContext.request.contextPath}/img/06.jpg"> <br>
			</div>
			<!-- /.地圖-->
			<!-- 商家列表 -->
			<!-- 右Projects Row -->
			<div class="col-md-7">
				<c:forEach var="SearchComVO" items="${comList}" begin="1" end="6">
						<!-- 第1筆商家 -->
						<div class="col-md-6 img-portfolio">
							<a href="<c:url value='/_05_company/company.jsp'/>"> <img
								class="img-responsive img-hover"
								src="${pageContext.request.contextPath}/img/13.jpg" alt="">
							</a>
							<h3>
								<a href="<c:url value='/_05_company/company.jsp'/>">${SearchComVO.com_name}</a>
							</h3>
							<p>位於北市信義路上，可愛的租車鋪，機車車齡三年內，提供租車服務以及機車托運，也讓您選擇自己喜愛的優良車種，擁有超值的機車租賃。
							</p>
						</div>
				</c:forEach>
				<!-- Projects Row -->

				<!--/.商家列表 -->

			</div>
			<!-- /.搜尋結果-->
			<br>

			<!-- 頁數 -->
			<div class="row text-center">
				<div class="col-lg-12">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.頁數-->

		<br>

		<!-- Footer -->
		<jsp:include page="/_00_fragment/footer.jsp" />

	</div>
	<!-- /.container -->


	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</body>

</html>