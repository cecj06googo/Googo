<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.products.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- top2 -->
		<jsp:include page="/_00_fragment/top2.jsp" />
<jsp:include page="/_00_fragment/css2.jsp" />

<link
	href="${pageContext.request.contextPath}/css/bootstrapValidator.css"
	rel="stylesheet" />

<title>Goo-go</title>
<style>
#pic2 {
	display: none
}

#pic3 {
	display: none
}

#pic4 {
	display: none
}

#c1 {
	display: inline
}

#cc1 {
	display: inline
}

#cnl1 {
	display: inline
}

/* #img1 { */
/* 	display: none */
/* } */
#img2 {
	display: none
}

#img3 {
	display: none
}

#img4 {
	display: none
}
</style>

</head>
<body>
	<div id="wrapper">
		<!-- page-wrapper -->
		<div id="page-wrapper">
			<div class="container-fluid">

				<!--標頭-->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">
							<i class="fa  fa-briefcase"></i> 商品上架 <small>modification</small>
						</h2>
					</div>
				</div>
				<!--/.標頭-->
				<!--上架商品-->


				<!--上架商品form===============================================-->
				<form name="prodInsert" id="prodInsertForm"
					action="<%=request.getContextPath()%>/prod.in"
					enctype="multipart/form-data" method="post">

					<div class="row">
						<div class="col-md-6">
							<br> <label class="control-label">${MsgOK.InsertOK}</label>
							<div class="control-group form-group">
								<label class="control-label">商品種類</label>
								<!--              //安泰要的 -->
								<input type="hidden" id="type" value="${ProductVO.prodType}" />
								<label class="control-label"><input type="radio" id="t1"
									name="prodType" value="1">汽車</label> <label
									class="control-label"><input type="radio" id="t2"
									name="prodType" value="2">機車</label> <label
									class="control-label"><input type="radio" id="t3"
									name="prodType" value="3">腳踏車</label> <br> <font size="-1"
									color="#FF0000">${ErrorMsg.errorProdType}</font>
							</div>
							<div class="control-group form-group ">
								<label class="control-label">商品名稱:</label>
								<div class="controls">
									<input type="text" class="form-control" name="prodName"
										value="${ProductVO.prodName}" placeholder="請輸入商品名稱"
										data-toggle="tooltip" data-placement="top"
										title="<h5>請輸入商品名稱<h5>">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
								<div id="div1"></div>
							</div>
							<div class="control-group form-group ">
								<label class="control-label">商品車號:</label>
								<div class="controls">
									<input type="text" class="form-control" name="prodPlate"
										value="${ProductVO.prodPlate}" placeholder="請輸入商品車號"
										data-toggle="tooltip" data-placement="top"
										title="<h5>請輸入商品名稱<h5>">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
								<div id="div1"></div>
							</div>
							<div class="control-group form-group">
								<label class="control-label">商品價格:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="prodPrice"
										value="${ProductVO.prodPrice}" placeholder="請輸入商品價格"
										data-toggle="tooltip" data-placement="top"
										title="<h5>請輸入商品價格<h5>">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdPrice}</font>
							</div>
							<div class="control-group form-group">
								<label>商品優惠:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="prodDisc"
										value="${ProductVO.prodDisc}" placeholder="請輸入商品優惠"
										data-toggle="tooltip" data-placement="top"
										title="<h5>請輸入商品優惠<h5>">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdDisc}</font>
							</div>
							<div class="control-group  form-group">
								<label>車輛類型:</label> <input type="hidden" id="kind"
									value="${ProductVO.prodKind}" /> <select class="form-control"
									name="prodKind" id="prodKind" data-toggle="tooltip"
									data-placement="top" title="<h5>請輸入商品類型<h5>">
									<!--                 	不知道為啥不會顯示 -->
									<%--                 	<c:if test="${ProductVO.prodType== '2'} "> --%>
									<!--                 		<option class="pKind" value="3">大型重型機車</option> -->
									<!--                 		<option class="pKind" value="4">普通重型機車</option> -->
									<!--                 		<option class="pKind" value="5">普通輕型機車</option> -->
									<%--                 	</c:if> --%>
									<%--                 	<c:if test="${ProductVO.prodType== '3'} "> --%>
									<%--                 		<c:out value=' --%>
									<%--                 		<option class="pKind" value="6">越野腳踏車</option> --%>
									<%--                 		<option class="pKind" value="7">摺疊腳踏車</option> --%>
									<%--                 		<option class="pKind" value="8">電動腳踏車</option> --%>
									<%--                 		<option class="pKind" value="9">一般腳踏車</option>'/>         	 --%>
									<%--                 	</c:if> --%>
								</select> <font size="-1" color="#FF0000">${ErrorMsg.errorProdKind}</font>
							</div>
							<div class="control-group  form-group" id="c1">
								<label class="show1">乘載人數:</label> <input type="hidden"
									id="carrier" value="${ProductVO.prodCarrier}" /> <select
									class="form-control" name="prodCarrier" data-toggle="tooltip"
									data-placement="top" title="<h5>請選擇乘載人數<h5>">
									<option class="carrier" value="2">2</option>
									<option class="carrier" value="3">3</option>
									<option class="carrier" value="4">4</option>
									<option class="carrier" value="5">5</option>
									<option class="carrier" value="6">6</option>
									<option class="carrier" value="7">7</option>
									<option class="carrier" value="8">8</option>
								</select> <font size="-1" color="#FF0000">${ErrorMsg.errorProdCarrier}</font>
							</div>
							<div class="control-group form-group" id="cc1">
								<label>排氣量:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="prodCc"
										value="${ProductVO.prodCc}" placeholder="請輸入排氣量"
										data-toggle="tooltip" data-placement="top"
										title="<h5>請輸入排氣量<h5>">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdCc}</font>
							</div>
							<div class="control-group form-group" id="cnl1">
								<label>手自排:</label>
								<div class="controls ">
									<input type="hidden" id="control"
										value="${ProductVO.prodControl}" /> <select
										name="prodControl">
										<option class="control" value="1" selected>手排</option>
										<option class="control" value="2">自排</option>
										<option class="control" value="3">手自排</option>
									</select> <font size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font>
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font>
							</div>
							<div class="control-group form-group">
								<label>商品說明:</label>
								<div class="controls ">
									<textarea rows="5" class="form-control" name="prodArticle">${ProductVO.prodArticle}</textarea>
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdArticle}</font>
							</div>
						</div>

						<div class="col-md-6">
							<br> <br> <br> <br>
							<div class="control-group form-group" id="pic1">
								<label>商品封面圖片:</label>
								<div>
									<img class="img-responsive" id="img1">
								</div>
								<input type="file" name="prodPic" id="prodPic"
									multiple="multiple" onchange="fileShow();" accept="image/*">
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdPic}</font>
							</div>
							<div class="control-group form-group" id="pic2">
								<label>商品圖片:</label>
								<div>
									<img class="img-responsive" id="img2">
								</div>
								<input type="file" name="prodSubPic1" id="prodSubPic1"
									multiple="multiple" onchange="fileShow2();" accept="image/*">
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdPic}</font><br>
							</div>
							<div class="control-group form-group" id="pic3">
								<label>商品圖片:</label>
								<div>
									<img class="img-responsive" id="img3">
								</div>
								<input type="file" name="prodSubPic2" id="prodSubPic2"
									multiple="multiple" onchange="fileShow3();"
									accept="image/*                                                                                      ">
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdPic}</font><br>
							</div>
							<div class="control-group form-group" id="pic4">
								<label>商品圖片:</label>
								<div>
									<img class="img-responsive" id="img4">
								</div>
								<input type="file" name="prodSubPic3" id="prodSubPic3"
									multiple="multiple" onchange="fileShow4();"
									accept="image/*                                                                                      ">
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdPic}</font><br>
							</div>
							<br>
							<button type="submit" class="btn btn-success">新增</button>
							<button type="reset" class="btn btn-danger">取消</button>
							<font size="-1" color="#FF0000">${ErrorMsg.errTitle}</font>
						</div>
					</div>
				</form>

				<c:if test="${ProductVO.prodType == '1'}">
					<script>
						$("#prodKind")
								.html(
										'<option class="pKind" value="1">轎車</option><option class="pKind" value="2">休旅車</option>');
						document.getElementById('c1').style.display = "inline";
						document.getElementById('cc1').style.display = "inline";
						document.getElementById('cnl1').style.display = "inline";
					</script>
				</c:if>
				<c:if test="${ProductVO.prodType == '2'}">
					<script>
						$("#prodKind")
								.html(
										'<option class="pKind" value="3">大型重型機車</option><option class="pKind" value="4">普通重型機車</option><option class="pKind" value="5">普通輕型機車</option>');
						document.getElementById('c1').style.display = "none";
						document.getElementById('cc1').style.display = "inline";
						document.getElementById('cnl1').style.display = "none";
					</script>
				</c:if>
				<c:if test="${ProductVO.prodType == '3'}">
					<script>
						$("#prodKind")
								.html(
										'<option class="pKind" value="6">越野腳踏車</option><option class="pKind" value="7">摺疊腳踏車</option><option class="pKind" value="8">電動腳踏車</option><option class="pKind" value="9">一般腳踏車</option>');
						document.getElementById('c1').style.display = "none";
						document.getElementById('cc1').style.display = "none";
						document.getElementById('cnl1').style.display = "none";
						$("#cc1").val("0");
					</script>
				</c:if>




			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
<!-- 	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>

 -->
	<script>
		$("[data-toggle='tooltip']").tooltip({
			html : true
		});

		(function($) {
			$(document).ready(function() {
						$("#prodInsertForm").bootstrapValidator({
					    	feedbackIcons: {
					    		valid : 'glyphicon glyphicon-ok',
								invalid: 'glyphicon glyphicon-remove',
								validating: 'glyphicon glyphicon-refresh'
					    	},
					    	
					    	fields: {
					    		prodName: {
									trigger: 'keyup blur',
									validators: {
										notEmpty: {
											message: '商品名稱不可空白'
										},
										stringLength: {
											min: 1,
											max: 16,
											message: '名稱長度限1~16字數'
										},
										regexp : {
											regexp: /^[(\u4e00-\u9fa5)\-(a-zA-Z0-9)]+$/,
											message: '只能是中、英文字母、數字和-'
										},
									} // end validators
								}, // end prodName
								
								prodPlate: {
									trigger: 'keyup blur',
									validators: {
										notEmpty: {
											message:'商品車號請勿空白'
										},
										stringLength: {
											min: 4,
											max: 10,
											message: '車號長度限4~10字數'
										},
										regexp : {
											regexp: /^[(\u4e00-\u9fa5)\-(a-zA-Z0-9)]+$/,
											message: '只能是中、英文字母、數字和-'
										},
									} // end validators
								}, // end prodPlate
								
								prodPrice: {
									trigger: 'keyup blur',
									validators: {
										notEmpty: {
											message:'請勿空白'
										},
										stringLength: {
											min: 2,
											max: 8,
											message: '2~8數字'
										},
										regexp : {
											regexp: /^[(\.0-9)]{2,8}$/,
											message: '格式錯誤, 只能是數字'
										},
									} // end validators
								}, // end comAddr
								prodDisc: {
									trigger: 'keyup blur',
									validators: {
										notEmpty: {
					                        message: '優惠請勿空白'
					                    },
					                    stringLength: {
											min: 2,
											max: 6,
											message: '2~6數字'
										},
					                    regexp: {
					                        regexp:  /^[(\.0-9)]{2,6}$/,
					                        message: '格式錯誤, 只能是數字'
					                    },
									} // end validators
								}, // end prodDisc
								prodCc: {
									trigger: 'keyup blur',
									validators: {
										notEmpty: {
					                        message: '排氣量請勿空白'
					                    },
										stringLength: {
											min: 0,
											max: 4,
											message: '最多四位數'
										},
					                    regexp: {
					                        regexp:  /^[(0-9)-]{0,4}$/,
					                        message: '格式錯誤, 只能是數字'
					                    },
									} // end validators
								}, // end prodPCc
								
					    	} // end fields
					    }); // end bootstrapValidator

			document.getElementById("prodPic").addEventListener("change",
					clickDiv1, false);
			document.getElementById("prodSubPic1").addEventListener("change",
					clickDiv2, false);
			//onclick oninput onsubmit
			document.getElementById("prodSubPic2").addEventListener("change",
					clickDiv3, false);

			document.getElementById("t1").addEventListener("change", hide1, false)
			document.getElementById("t2").addEventListener("change", hide2, false)
			document.getElementById("t3").addEventListener("change", hide3, false)

			var type = $("#type").val();//安泰要的
			var kind = $("#kind").val();
			var carrier = $("#carrier").val();
			var control = $("#control").val();
			$("input[name='prodType'][value='" + type + "']").prop("checked", true);//安泰要的
			$("option[class='pKind'][value='" + kind + "']").prop("selected", true);
			$("option[class='carrier'][value='" + carrier + "']").prop("selected",
					true);
			$("option[class='control'][value='" + control + "']").prop("selected",
					true);
			
			})
		})(jQuery)

	// 	動態顯示第一、二、三張圖片的欄位
	function clickDiv1() {
		document.getElementById('pic2').style.display = "inline";
		// 		alert("show SubPic1");
	}
	function clickDiv2() {
		document.getElementById('pic3').style.display = "inline";
		// 		alert("show SubPic2");
	}
	function clickDiv3() {
		document.getElementById('pic4').style.display = "inline";
		// 		alert("show SubPic3");
	}

	function hide1() {
		$("#prodKind").empty();
		$("#prodKind")
				.html(
						'<option class="pKind" value="1">轎車</option>	<option class="pKind" value="2">休旅車</option>');
		document.getElementById('c1').style.display = "inline";
		document.getElementById('cc1').style.display = "inline";
		document.getElementById('cnl1').style.display = "inline";
	}
	function hide2() {
		$("#prodKind").empty();
		$("#prodKind")
				.html(
						'<option class="pKind" value="3">大型重型機車</option><option class="pKind" value="4">普通重型機車</option><option class="pKind" value="5">普通輕型機車</option>');
		document.getElementById('c1').style.display = "none";
		document.getElementById('cc1').style.display = "inline";
		document.getElementById('cnl1').style.display = "none";
	}
	function hide3() {
		$("#prodKind").empty();
		$("#prodKind")
				.html(
						'<option class="pKind" value="6">越野腳踏車</option><option class="pKind" value="7">摺疊腳踏車</option><option class="pKind" value="8">電動腳踏車</option><option class="pKind" value="9">一般腳踏車</option>');
		document.getElementById('c1').style.display = "none";
		document.getElementById('cc1').style.display = "none";
		document.getElementById('cnl1').style.display = "none";
		$("#cc1").val("0");
	}
	
	function fileShow() {
		document.getElementById('img1').style.display = "inline";
		var reader = new FileReader();
		reader.onload = function(e) {
			var fileContent = e.target.result;
			var show = document.getElementById("img1");
			show.setAttribute("src", fileContent);
		}
		file = document.getElementById("prodPic").files[0];
		reader.readAsDataURL(file);
	}
	function fileShow2() {
		document.getElementById('img2').style.display = "inline";
		var reader = new FileReader();
		reader.onload = function(e) {
			var fileContent = e.target.result;
			var show = document.getElementById("img2");
			show.setAttribute("src", fileContent);
		}
		file = document.getElementById("prodSubPic1").files[0];
		reader.readAsDataURL(file);
	}
	
	function fileShow3() {
		document.getElementById('img3').style.display = "inline";
		var reader = new FileReader();
		reader.onload = function(e) {
			var fileContent = e.target.result;
			var show = document.getElementById("img3");
			show.setAttribute("src", fileContent);
		}
		file = document.getElementById("prodSubPic2").files[0];
		reader.readAsDataURL(file);
	}
	
	function fileShow4() {
		document.getElementById('img4').style.display = "inline";
		var reader = new FileReader();
		reader.onload = function(e) {
			var fileContent = e.target.result;
			var show = document.getElementById("img4");
			show.setAttribute("src", fileContent);
		}
		file = document.getElementById("prodSubPic3").files[0];
		reader.readAsDataURL(file);
	}
</script>

</body>
</html>