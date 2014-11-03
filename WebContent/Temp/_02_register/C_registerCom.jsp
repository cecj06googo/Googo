<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.company.model.*"%>

<%
	CompanyVO companyVO = (CompanyVO) request.getAttribute("companyVO");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <!--     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>register</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/css/modern-business.css" rel="st
    ylesheet">
	<link href="<%=request.getContextPath()%>/css/datepicker.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src='<%=request.getContextPath()%>/js/bootstrap-datepicker.js'></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="<%=request.getContextPath()%>/C_index.jsp" id="logo">
                    <i class="fa fa-car"></i><span class="light"> 租車網</span> Goo-go
                </a>

            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">註冊</a>
                    </li>
                    <li>
                        <a href="#">登入</a>
                    </li>
                    <li>
                        <a href="about.html">關於</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>會員專區<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                        	<li>
	                            <a href="#">收藏清單</a>
	                        </li>
                            <li>
	                            <a href="#">訂單查詢</a>
	                        </li>
	                        <li>
	                            <a href="#">修改會員資料</a>
	                        </li>
	                        <li class="divider"> </li>
	                        <li>
	                            <a href="#"><i class="fa fa-fw fa-power-off"> </i>登出</a>
	                        </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">
        <!--註冊 -->
        <div class="row">
        <br><br>
        	<!--標頭-->
            <div class="col-lg-12">
                <h2 class="page-header"> 註冊 </h2>
            </div><!--/.標頭-->
           <!--標籤與內容-->
            <div class="col-lg-12">
				<!--標籤-->
                <ul id="myTab" class="nav nav-tabs nav-justified">
                    <li class=""><a href="#register-one" data-toggle="tab"><i class="fa fa-user"></i> 註冊會員</a>
                    </li>
                    <li class="active"><a href="#register-two" data-toggle="tab"><i class="fa  fa-briefcase"></i> 註冊商家</a>
                    </li>
                   
                </ul><!--/.標籤-->
				<!--內容-->
                <div id="myTabContent" class="tab-content">
        		<!--標籤1內容-->
                <div class="tab-pane fade" id="register-one"><br>
                    <div class="col-lg-12">
               			<img class="img-responsive" src="http://placehold.it/1200x300" alt="">
        			</div>
            		<div class="col-lg-1"></div>
        		<div class="col-lg-5"><br>
            				
            	<!--註冊會員form-->
            	<form name="register_member" id="register_member" action="#" method="get" novalidate>
                     <div class="control-group form-group ">
                        <label>帳號:</label>
                        <div class="controls input-group">
                            <input type="tel" class="form-control" id="mem_account" placeholder="請輸入e-mail" >
                       	<span class="input-group-addon"><i class="fa fa-thumbs-o-up"></i></span><!-- fa fa-ban-->
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label>密碼:</label>
                        <div class="controls ">
                            <input type="tel" class="form-control" id="mem_pwd" placeholder="請輸入6~12，包含英文與數字" >
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label>姓名:</label>
                        <div class="controls ">
                            <input type="tel" class="form-control" id="mem_name"  required >
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label><input type="radio" name="optionsRadios" id="mem_gender" value="1">先生</label>
                        <label><input type="radio" name="optionsRadios" id="mem_gender" value="0">小姐</label>
                    </div>
                    <div class="control-group form-group">
                        <label>生日:</label>
                        <div class='input-group date' id='datetimepicker5'>
						<input type='text' class="form-control" data-date-format="YYYY/MM/DD"/>
						<span class="input-group-addon">
						<span class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
					<div class="control-group form-group">
                        <label>身分證:</label>
                        <div class="controls ">
                            <input type="tel" class="form-control" id="mem_idnumer">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label>電話:</label>
                        <div class="controls ">
                            <input type="tel" class="form-control" id="mem_tel">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label>行動電話:</label>
                        <div class="controls ">
                            <input type="tel" class="form-control" id="mem_phone">
                        </div>
                    </div>
                     <div class="control-group form-group">
                        <label>地址:</label>
                        <div class="controls ">
                            <input type="tel" class="form-control" id="mem_address">
                        </div>
                    </div>
                    <br>
                    
                    <button type="submit" class="btn btn-success">送出</button>
                    <button type="submit" class="btn btn-danger">取消 </button>
                 
                </form>
                </div>
                </div>
                </div><!--/.標籤1內容-->
                    
           <!--標籤2內容-->
           <div class="tab-pane fade active in" id="register-two">  <!-- 加上active in -->
                        <br>
            	<div class="col-lg-1"></div>
        		<div class="col-lg-5">
            			<br>
            		
            <!--  註冊商家form  -->
            	<form name="comForm" action="<%=request.getContextPath()%>/Company.Register" method="POST" >
                    <div class="control-group form-group ">
                        <label>帳號:</label>
                        <div class="controls input-group">
                            <input type="text" class="form-control" name="comAccount" id="com_account" 
                                   placeholder="請輸入e-mail" value="${companyVO.comAccount}" >
                       	<span class="input-group-addon"><i class="fa fa-thumbs-o-up"></i></span><!-- fa fa-ban-->
                        </div>
                        <span><font color="red" size="-1">${errorMsgs.errorAccountEmpty}${errorMsgs.errorAccountFormat}${errorMsgs.errorAccountDup}</font></span>
                    </div>
                    <div class="control-group form-group">
                        <label>密碼:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" name="comPwd" id="com_pwd" 
                                   placeholder="請輸入6~12，包含英文與數字" value="${companyVO.comPwd}">
                        </div>
                        <span><font color="red" size="-1">${errorMsgs.errorPwdEmpty}${errorMsgs.errorPwdFormat}</font> </span>
                    </div>
                    <div class="control-group form-group">
                        <label>商家名稱:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" name="comName" id="com_name" value="${companyVO.comName}">
                        </div>
                        <span><font color="red" size="-1">${errorMsgs.errorNameEmpty}${errorMsgs.errorNameFormat}</font></span>
                    </div>
                    <div class="control-group form-group">
                        <label>負責人:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" name="comOwner" id="com_owner" value="${companyVO.comOwner}">
                        </div>
                        <span><font color="red" size="-1">${errorMsgs.errorOwnerEmpty}${errorMsgs.errorOwnerFormat}</font></span>
                    </div>
					<div class="control-group form-group">
                        <label>地址:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" name="comAddr" id="com_address" value="${companyVO.comAddr}">
                        </div>
                        <span><font color="red" size="-1">${errorMsgs.errorAddrEmpty}${errorMsgs.errorAddrFormat}</font></span>
                    </div>
                    <div class="control-group form-group">
                        <label>電話:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" name="comTel" id="com_tel" value="${companyVO.comTel}">
                        </div>
                        <span><font color="red" size="-1">${errorMsgs.errorTelEmpty}${errorMsgs.errorTelFormat}</font></span>
                    </div>
                    <div class="control-group form-group">
                        <label>fax:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" name="comFax" id="com_fax" value="${companyVO.comFax}">
                        </div>
                        <span><font color="red" size="-1">${errorMsgs.errorFaxFormat}</font></span>
                    </div>
                    <div class="control-group form-group">
                        <label>營業統編:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" name="comVAT" id="com_vat"  value="${companyVO.comVAT}">
                        </div>
                        <span><font color="red" size="-1">${errorMsgs.errorVATEmpty}${errorMsgs.errorVATFormat}${errorMsgs.errorVATDup}</font></span>
                    </div>
                   
                    <br>
                    <button type="submit" class="btn btn-success">送出</button>
                    <input type="reset" class="btn" value="重填"/>
                 <!--   <button type="button" class="btn btn-danger">取消 </button> -->
                 <input type="button" class="btn btn-danger" value="取消" onclick="self.location.href='<%=request.getContextPath()%>/C_index.jsp'" />
                
                </form>
                </div>
                 <div class="col-lg-6">
               			<img id="comPicture" class="img-responsive" src='<%=request.getContextPath()%>/img/ComDefaultPic.jpg' alt="">
						
						<span></span>
        			</div>
                </div><!--/.標籤2內容-->
            </div><!--/.內容-->
                    
        </div><!--/.註冊-->

     </div> <!-- /.row -->
     

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery Version 1.11.0 -->
    <script src="<%=request.getContextPath()%>/js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script>
	 (function($){
	  $('#datetimepicker5').datetimepicker({
		pickTime: false});
	  
	 })(jQuery)
	</script>
</body>


</html>