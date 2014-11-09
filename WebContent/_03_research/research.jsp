<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.search.model.*"%>
<%@ page import="com.search.controller.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<title>Goo-go</title>

<!-- Google Map Start-->
<style>
html, body, #map-canvas {
	height: 100px;
	width: 100px;
	margin: 100px;
	padding: 100px;
}
</style>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script>
	// The following example creates complex markers to indicate beaches near
	// Sydney, NSW, Australia. Note that the anchor is set to
	// (0,32) to correspond to the base of the flagpole.

	function initialize() {
		var mapOptions = {
			zoom : 10,
			center : new google.maps.LatLng(-33.9, 151.2)
		}
		var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);

		setMarkers(map, beaches);
	}

	/**
	 * Data for the markers consisting of a name, a LatLng and a zIndex for
	 * the order in which these markers should display on top of each
	 * other.
	 */
	var beaches = [ [ 'Bondi Beach', -33.890542, 151.274856, 4 ],
			[ 'Coogee Beach', -33.923036, 151.259052, 5 ],
			[ 'Cronulla Beach', -34.028249, 151.157507, 3 ],
			[ 'Manly Beach', -33.80010128657071, 151.28747820854187, 2 ],
			[ 'Maroubra Beach', -33.950198, 151.259302, 1 ] ];

	function setMarkers(map, locations) {
		// Add markers to the map

		// Marker sizes are expressed as a Size of X,Y
		// where the origin of the image (0,0) is located
		// in the top left of the image.

		// Origins, anchor positions and coordinates of the marker
		// increase in the X direction to the right and in
		// the Y direction down.
		var image = {
			url : 'images/icon1.jpg',
			// This marker is 20 pixels wide by 32 pixels tall.
			size : new google.maps.Size(109, 106),
			// The origin for this image is 0,0.
			origin : new google.maps.Point(0, 0),
			// The anchor for this image is the base of the flagpole at 0,32.
			anchor : new google.maps.Point(0, 32)
		};
		// Shapes define the clickable region of the icon.
		// The type defines an HTML &lt;area&gt; element 'poly' which
		// traces out a polygon as a series of X,Y points. The final
		// coordinate closes the poly by connecting to the first
		// coordinate.
		var shape = {
			coords : [ 1, 1, 1, 20, 18, 20, 18, 1 ],
			type : 'poly'
		};
		for (var i = 0; i < locations.length; i++) {
			var beach = locations[i];
			var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
			var marker = new google.maps.Marker({
				position : myLatLng,
				map : map,
				// icon: image,
				shape : shape,
				title : beach[0],
				zIndex : beach[3]
			});
		}
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- Google Map Start-->

</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top1.jsp" />
	<!-- Page Content -->
	<div class="container">
		<br>
			<!-- Search bar -->
		<div class="well">
		<div class="row">
		<div class="col-lg-12 text-center">
     	<jsp:include page="/_03_research/researchBar.jsp" />
		</div>
		</div>
		</div>
		<!-- /.Search bar -->
		<!-- 搜尋結果 -->
		<div class="row">
			<!-- 地圖-->
			<div class="col-md-5" id="map-canvas">

<!-- 				<div id="map-canvas"></div> -->
				<!-- 				<img class="img-responsive" -->
				<%-- 					src="${pageContext.request.contextPath}/img/06.jpg"> <br> --%>
			</div>
			<!-- /.地圖-->
			<!-- 商家列表 -->
			<!-- 右Projects Row -->
			<div class="col-md-7">
				<%@ include file="page1.file"%>
				<c:forEach var="SearchComVO" items="${comList}"
					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					<!-- 第1筆商家 -->
					<div class="col-md-6 img-portfolio">
						<a href="<c:url value='/_05_company/company.jsp'/>"> <img
							class="img-responsive img-hover"
							src="${pageContext.request.contextPath}/img/13.jpg" alt="">
						</a>
						<h3>
							<a href="<c:url value='/_05_company/company.jsp'/>">${SearchComVO.com_name}</a>
						</h3>
						<p>${SearchComVO.com_name}，地點位於${SearchComVO.com_address}，是一家信賴的商家。
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
						<c:forEach var="i" begin="1" end="<%=pageNumber%>">
							<c:if test="${i == whichPage}">
								<li class="active"><a
									href="${pageContext.request.contextPath}/SearchServlet.do?whichPage=${i}&location=${location}&prod_type=${prod_type}&keySearch=${keySearch}">${i}</a></li>
							</c:if>
							<c:if test="${i != whichPage}">
								<li><a
									href="${pageContext.request.contextPath}/SearchServlet.do?whichPage=${i}&location=${location}&prod_type=${prod_type}&keySearch=${keySearch}">${i}</a></li>
							</c:if>
						</c:forEach>
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