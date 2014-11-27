<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<title>Goo-go</title>

<!-- Google Map Start-->
<style>
#map-canvas {
	height: 280px;
	width: 100%;
	margin: 10px;
	padding: 10px;
}
</style>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&language=zh-TW"></script>
<script>
// 用此程式需要從後端傳入以下:comAdressArray、comNameArray、rowsPerPage、whichPage、location(可參考reserch.jsp)
	function initialize() {
		initMapCenter();
	}//end function initialize()

	var comAdressArray = <%=request.getAttribute("comAdressArray")%>; //公司地址陣列
	var comNameArray =<%=request.getAttribute("comNameArray")%>;//公司名稱陣列
	function setMarkers(map, locations) {

		var image = {
			url : 'images/icon1.jpg',
			// This marker is 20 pixels wide by 32 pixels tall.
			size : new google.maps.Size(109, 106),
			// The origin for this image is 0,0.
			origin : new google.maps.Point(0, 0),
			// The anchor for this image is the base of the flagpole at 0,32.
			anchor : new google.maps.Point(0, 32)
		};

		var shape = {
			coords : [ 1, 1, 1, 20, 18, 20, 18, 1 ],
			type : 'poly'
		};
		var beach = locations;
		var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			// icon: image,
			shape : shape,
			title : beach[0],
		//zIndex : beach[3]
		});
	}//end function setMarkers(map, locations)
	function addressToLatLng(comName,addr, map) {//將中文地址轉為經緯度
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			"address" : addr
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var coordinate = [comName, results[0].geometry.location.lat(),
						results[0].geometry.location.lng() ]
				setMarkers(map, coordinate);
				//alert(position);
			} else {
				alert("查無經緯度");
			}
		});//end  geocoder.geocode
	}//end function addressToLatLng(addr) 
	function showTaiwan(){
		 var mapOptions = {
					zoom : 7, //zoom:10, 越大顯示區域越小(精細)
					center : new google.maps.LatLng(23.58, 121.00)
				}
		 var map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);
		 return map;
	}
	function findComMarkers(map) {
		if(comAdressArray.length==0){//若沒有商家地址資料
			showTaiwan();
		    alert("沒有商家地址資料");
		   //這地方要加入處理顯示沒有商家資料利用jQuery?
		   return;
		}
		var rowsPerPage = <%=request.getAttribute("rowsPerPage")%>;
		var whichPage= <%=request.getAttribute("whichPage")%>;//此頁第幾頁
		//alert("rowsPerPage="+rowsPerPage);
		//alert("whichPage="+whichPage);
		var startIndex=(whichPage-1)*rowsPerPage;//該頁起始筆數
		var endIndex = (whichPage*rowsPerPage-1); //該頁終止筆數
		if((comAdressArray.length-1)<endIndex){//當最後一頁顯示筆數不足rowsPerPage
			endIndex = comAdressArray.length-1; //則將剩餘的顯示
		}
		for (var i = startIndex; i <= endIndex ; i++) {	
			addressToLatLng(comNameArray[i],comAdressArray[i], map); //傳入地址陣列
		}
	}
	function initMapCenter(){ //先查詢縣市初步位置再將中心點設置在該地區
		var addr = comAdressArray[0]; //改了這裡偷吃步整個程式還需改善
		//搜尋時地區沒有設值
		if("<%=request.getAttribute("location")%>" == "null") {
			findComMarkers(showTaiwan());
			return;
		} else { //進入此else表示有根據地區搜尋
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				"address" : addr
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					var mapOptions = {
						zoom : 15, //zoom:10, 越大顯示區域越小(精細)
						center : new google.maps.LatLng(
								results[0].geometry.location.lat(),
								results[0].geometry.location.lng())
					//center : new google.maps.LatLng(-33.890542, 151.274856)
					}
					var map = new google.maps.Map(document
							.getElementById('map-canvas'), mapOptions);
					findComMarkers(map);
					//alert(position);
				} else {//代表地址轉換成經緯度失效
					alert("無法初始地圖中心點");
					showTaiwan(); //只show出台灣地圖
				}
			});//end  geocoder.geocode			
		}//end else 進入此else表示有根據地區搜尋	
	}//end function initMapCenter()
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- Google Map End-->


</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top1.jsp" />

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<!-- 				在此comVO是用振瑋的VO -->
					${comVO.comName} <small>租車小舖</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- Intro Content -->
		<div class="row">
			<!-- 店家圖片 -->
			<div class="col-md-6">
				<img class="img-responsive"
					src='${pageContext.servletContext.contextPath}/image?comID=${comId}'
					alt="">
			</div>
			<!-- /店家圖片 -->
			<div class="col-md-6">
				<div class="col-lg-12">
					<!-- 標籤 -->
					<ul id="myTab" class="nav nav-tabs nav-justified">
						<li class="active"><a href="#service-one" data-toggle="tab"><i
								class="fa fa-tag"></i> 店家位置</a></li>
						<li class=""><a href="#service-two" data-toggle="tab"><i
								class="fa  fa-phone"></i> 店家資訊</a></li>
						<li class=""><a href="#service-three" data-toggle="tab"><i
								class="fa fa-book"></i> 優惠方案</a></li>
					</ul>
					<!-- /標籤 -->
					<!-- 標籤內容 -->
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="service-one">
							<div id="map-canvas"></div>
						</div>
						<div class="tab-pane fade" id="service-two">
							<ul>
								<li><h3>商店名稱:&nbsp${comVO.comName}</h3></li>
								<li><h3>地址:&nbsp${comVO.comAddr}</h3></li>
								<li><h3>聯絡電話:&nbsp${comVO.comTel}</h3></li>
								<li><h3>聯絡人:&nbsp${comVO.comOwner}</h3></li>
							</ul>
						</div>
						<div class="tab-pane fade" id="service-three">
							<h4>Service</h4>
							<p>目前尚無優惠方案的欄位，是商家上架還是配件上架??</p>
							<a href="#accessoriesRoW">配件配件配件</a>
						</div>
					</div>
					<!-- /標籤內容 -->
				</div>
			</div>
		</div>
		<!-- /.row -->
		<!-- Team Members -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">商品</h2>
			</div>
			<!-- 價格搜尋bar -->
			<div class="col-md-12 text-center">
				<div class="row">
					<form class="form-inline" role="form" name="searchMoney"
						id="searchMoney" action="" method="post">
						<div class="form-group">
<!-- 							<select class="form-control input-lg" name="prod_type"> -->
<!-- 								<option value="1">汽車</option> -->
<!-- 								<option value="2">機車</option> -->
<!-- 								<option value="3">腳踏車</option> -->
<!-- 							</select>     -->
                                <input type="hidden" class="form-control input-lg" name="prod_type" value="1">						     
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg"
								name="SearchMoneyLow" placeholder="金額下限(低)">
						</div>
						~
						<div class="form-group">
							<input type="text" class="form-control input-lg"
								name="SearchMoneyHigh" placeholder="金額上限(高)">
						</div>
						<button class="btn btn-default btn-lg" type="button"
							id="SearchButton">
							<i class="fa fa-search"></i>
						</button>
						<div>
							<Font color="red">${ErrMsg}</Font>
						</div>
					</form>
					<br>
				</div>
			</div>
			<!-- 價格搜尋bar End -->
			<!-- 標籤 -->
			<div class="col-lg-12">
				<ul id="prodsTab" class="nav nav-tabs nav-justified">
					<li class="active" id="car-li"><a href="#car-content"
						data-toggle="tab" id=car-a><i class="fa fa-carx"></i>汽車(${numOfCar})</a></li>
					<li class="" id="motor-li"><a href="#mortor-content"
						data-toggle="tab" id=motor-a><i class="fa fa-motorcycle"></i>
							機車(${numOfMotor})</a></li>
					<li class="" id="bike-li"><a href="#bike-content"
						data-toggle="tab" id=bike-a><i class="fa fa-bicycle"></i>
							腳踏車(${numOfBike})</a></li>
				</ul>
			</div>
			<!-- /標籤 -->
			<!-- 標籤內容 -->
			<div id="prodsTabContent" class="tab-content">
				<div class="tab-pane fade active in" id="car-content">
					<!-- 			foreach也還是遵照Java index從0開始，因為Java物件從後端丟到這裡 -->
					<c:forEach var="ProductVO" items="${prodsVos}" begin="0"
						end="${prodsVos.size()-1}">
						<c:if test="${ProductVO.prodType == 1}">
							<!-- 車車1 -->
							<div class="col-md-4 text-center" id="car-${ProductVO.prodId}" name = "content-prod">
								<div class="thumbnail">
									<a href="" data-toggle="modal" data-target="#prod_detail">
										<img class="img-responsive"
										src='${pageContext.servletContext.contextPath}/ComFirstPageImg?comID=${comId}&prodId=${ProductVO.prodId}'
										alt="">
										<div class="caption">
											<h3>${ProductVO.prodName}</h3>
											<p>價錢:${ProductVO.prodPrice}台幣/日</p>
											<p>${ProductVO.prodArticle}</p>
										</div>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<!-- car content -->
				<div class="tab-pane fade " id="mortor-content">
					<c:forEach var="ProductVO" items="${prodsVos}" begin="0"
						end="${prodsVos.size()-1}">
						<c:if test="${ProductVO.prodType == 2}">
							<!-- 機車2 -->
							<div class="col-md-4 text-center" id="motor-${ProductVO.prodId}" name = "content-prod">
								<div class="thumbnail">
									<a href="" data-toggle="modal" data-target="#prod_detail">
										<img class="img-responsive"
										src='${pageContext.servletContext.contextPath}/ComFirstPageImg?comID=${comId}&prodId=${ProductVO.prodId}'
										alt="">
										<div class="caption">
											<h3>${ProductVO.prodName}</h3>
											<p>價錢:${ProductVO.prodPrice}台幣/日</p>
											<p>${ProductVO.prodArticle}</p>
										</div>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<!-- motor content -->
				<div class="tab-pane fade" id="bike-content">
					<c:forEach var="ProductVO" items="${prodsVos}" begin="0"
						end="${prodsVos.size()-1}">
						<c:if test="${ProductVO.prodType == 3}">
							<!-- 腳踏車3 -->
							<div class="col-md-4 text-center" id="bike-${ProductVO.prodId}" name = "content-prod">
								<div class="thumbnail">
									<a href="" data-toggle="modal" data-target="#prod_detail">
										<img class="img-responsive"
										src='${pageContext.servletContext.contextPath}/ComFirstPageImg?comID=${comId}&prodId=${ProductVO.prodId}'
										alt="">
										<div class="caption">
											<h3>${ProductVO.prodName}</h3>
											<p>價錢:${ProductVO.prodPrice}台幣/小時</p>
											<p>${ProductVO.prodArticle}</p>
										</div>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<!-- motor content -->
			</div>
			<!-- /標籤內容 -->
		</div>
		<!-- /.row -->

		<!-- 配件 -->
        <!--有配件才會顯示配件否則隱形 -->
		<c:if test="${accsVos.size() > 0}">
			<div class="row" id="accessoriesRoW">
				<div class="col-lg-12">
					<h2 class="page-header">配件</h2>
				</div>			
				<c:forEach var="AccessoryVO" items="${accsVos}" begin="0" end="${accsVos.size()-1}">
						<!-- 配件1 500*400-->
						<div class="col-md-3 col-sm-6">
							<div class="thumbnail">
								<img class="img-responsive"
									src='${pageContext.servletContext.contextPath}/ShowAccsPicturs.do?comID=${comId}&accID=${AccessoryVO.accId}' alt="">
								<div class="caption">
									<h4>${AccessoryVO.accName}</h4>
								</div>
							</div>
						</div>
			    </c:forEach>
			</div>
		</c:if>
		<!-- /.配件 -->
		<!-- 商品明細 -->
		<jsp:include page="/_05_company/prod_detail.jsp" />
		<hr>
		<!-- Footer -->
		<jsp:include page="/_00_fragment/footer.jsp" />

	</div>
	<!-- /.container -->

	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<!-- 	Antai Test jQuery Test-->
	<script>
		//-------變數區------------
		var numOfCar =<%=request.getAttribute("numOfCar")%>;
		var numOfMotor =<%=request.getAttribute("numOfMotor")%>;
		var numOfBike =<%=request.getAttribute("numOfBike")%>;
		//---------函數區--------------
		function hideTab() { //如果是空的就把Tab隱藏起來
			if (numOfCar == 0) {
				$("#car-li").hide();
			}
			if (numOfMotor == 0) {
				$("#motor-li").hide();
			}
			if (numOfBike == 0) {
				$("#bike-li").hide();
			}
		}
		function showActive() {
			//car 已經預設是active，按照順序如果不是空的就設為Active
			if (numOfCar > 0) {
				return;
			}
			if (numOfMotor > 0) {
				$("#motor-li").attr("class", "active");
				$("#mortor-content").attr("class", "tab-pane fade active in");
				return;
			}
			if (numOfBike > 0) {
				$("#bike-li").attr("class", "active");
				$("#bike-content").attr("class", "tab-pane fade active in");
				return;
			}
		}
		function SearchMoneyRange() {
			$("#car-li").click(function(){
				 $("input[name='prod_type']").val(1);
			});
			$("#motor-li").click(function(){
				 $("input[name='prod_type']").val(2);
			});
			$("#bike-li").click(function(){
				 $("input[name='prod_type']").val(3);
			});
			$("#SearchButton").click(function() {
				var prod_type = $("input[name='prod_type']").val();
				var SearchMoneyLow = $("input[name='SearchMoneyLow']").val();
				var SearchMoneyHigh = $("input[name='SearchMoneyHigh']").val();
				var jsonString= <%=request.getAttribute("jsonString")%>;
				if(SearchMoneyLow=="" || SearchMoneyHigh==""){
					alert("價格搜尋上下限不可空白");
					return;
				}
				//--------根據不同車種及價格範圍決定需要顯示的車子--------
				numOfCar=0;
				numOfMotor=0;
				numOfBike=0;
				for(var i=0; i<jsonString.length;i++){ 
					if(jsonString[i]["prod_type"] == prod_type){ //只有當要過濾的車種與該商品車種符合才要進行動作
						if( (jsonString[i]["prod_price"] >= SearchMoneyLow) && (jsonString[i]["prod_price"] <= SearchMoneyHigh) ){
							//符合搜尋價格範圍
							switch(prod_type){
							case "1": //汽車
								$("#car-"+jsonString[i]["prod_id"]).show();
								numOfCar++;
								break;
							case "2"://機車
								$("#motor-"+jsonString[i]["prod_id"]).show();
								numOfMotor++;
								break;
							case "3"://腳踏車
								$("#bike-"+jsonString[i]["prod_id"]).show();
								numOfBike++;
								break;
							default:
								alert("價格搜尋prod_type超出範圍");
								break;
							}
						}else{
							//不符合搜尋範圍
							switch(prod_type){
							case "1": //汽車
								$("#car-"+jsonString[i]["prod_id"]).hide();
								break;
							case "2"://機車
								$("#motor-"+jsonString[i]["prod_id"]).hide();
								break;
							case "3"://腳踏車
								$("#bike-"+jsonString[i]["prod_id"]).hide();
								break;
							default:
								alert("價格搜尋prod_type超出範圍");
								break;
							}//end switch(prod_type)
						}//end else	不符合搜尋範圍
					}//end 	if(jsonString[i]["prod_type"] == prod_type){ //只有當要過濾的車種與該商品車種符合才要進行動作		
					else{ //沒有選到的車種則恢復
						//alert(jsonString[i]["prod_type"]);
						switch(jsonString[i]["prod_type"]){
						case 1: //汽車
							$("#car-"+jsonString[i]["prod_id"]).show();
							numOfCar++;
							break;
						case 2://機車
							$("#motor-"+jsonString[i]["prod_id"]).show();
							numOfMotor++;
							break;
						case 3://腳踏車
							$("#bike-"+jsonString[i]["prod_id"]).show();
							numOfBike++;
							break;
						default:
							alert("價格搜尋prod_type超出範圍");
							break;
						}
					}
				}//end for(var i=0; i<jsonString.length;i++)
				//if(prod_type == 1){//汽車
					$("#car-a").html("<i class='fa fa-carx'></i>汽車("+numOfCar+")");	
				//}else if(prod_type == 2){//機車
					$("#motor-a").html("<i class='fa fa-motorcycle'></i>機車("+numOfMotor+")");	
				//}else if(prod_type == 3){//腳踏車
					$("#bike-a").html("<i class='fa fa-bicycle'></i>腳踏車("+numOfBike+")");
				//}
			});//end $("#SearchButton").click(function() 
		}//end function SearchMoneyRange()


			$("div[name='content-prod']").click(function(){
				var prodIdStr= this.id;
				var prodId = prodIdStr.split("-")[1];	
				//寫入价林需要的prod_id 在05的prod_detail
				$("input[name='detail_prod_id']").val(prodId);
// 				alert("prodId="+prodId);
			});


		//------執行區--------
		hideTab();
		showActive();
		SearchMoneyRange();
	</script>
</body>
</html>