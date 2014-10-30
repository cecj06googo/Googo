<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
     	<jsp:include page="/_03_research/researchBar.jsp"/>
 	<!-- 搜尋結果 -->
        <div class="row">
        <!-- 地圖-->
        <div class="col-md-5">
        		<img class="img-responsive" src="${pageContext.request.contextPath}/img/06.jpg" >
        		<br>
        </div>
        <!-- /.地圖-->
        <!-- 商家列表 -->	
        <!-- 右Projects Row -->	
        <div class="col-md-7">
        <div class="row">
        	<!-- 第1筆商家 -->
            <div class="col-md-6 img-portfolio">
                <a href="<c:url value='/_05_company/company.jsp'/>">
                    <img class="img-responsive img-hover" src="${pageContext.request.contextPath}/img/13.jpg" alt="">
                </a>
                <h3>
                    <a href="<c:url value='/_05_company/company.jsp'/>">拉拉租車鋪</a>
                </h3>
                <p>位於北市信義路上，可愛的租車鋪，機車車齡三年內，提供租車服務以及機車托運，也讓您選擇自己喜愛的優良車種，擁有超值的機車租賃。 </p>
            </div>
            <!-- 第2筆商家 -->
            <div class="col-md-6 img-portfolio">
                <a href="<c:url value='/_05_company/company.jsp'/>">
                    <img class="img-responsive img-hover" src="${pageContext.request.contextPath}/img/14.jpg" alt="">
                </a>
                <h3>
                    <a href="<c:url value='/_05_company/company.jsp'/>">Project Two</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
        	<!-- 第3筆商家 -->
            <div class="col-md-6 img-portfolio">
                <a href="<c:url value='/_05_company/company.jsp'/>">
                    <img class="img-responsive img-hover" src="${pageContext.request.contextPath}/img/15.jpg" alt="">
                </a>
                <h3>
                    <a href="<c:url value='/_05_company/company.jsp'/>">Project Three</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <!-- 第4筆商家 -->
            <div class="col-md-6 img-portfolio">
                <a href="<c:url value='/_05_company/company.jsp'/>">
                    <img class="img-responsive img-hover" src="${pageContext.request.contextPath}/img/16.jpg" alt="">
                </a>
                <h3>
                    <a href="<c:url value='/_05_company/company.jsp'/>">Project Four</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
        	<!-- 第5筆商家 -->
            <div class="col-md-6 img-portfolio">
                <a href="<c:url value='/_05_company/company.jsp'/>">
                    <img class="img-responsive img-hover" src="${pageContext.request.contextPath}/img/17.jpg" alt="">
                </a>
                <h3>
                    <a href="<c:url value='/_05_company/company.jsp'/>">Project Five</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <!-- 第6筆商家 -->
            <div class="col-md-6 img-portfolio">
                <a href="<c:url value='/_05_company/company.jsp'/>">
                    <img class="img-responsive img-hover" src="${pageContext.request.contextPath}/img/18.jpg" alt="">
                </a>
                <h3>
                    <a href="<c:url value='/_05_company/company.jsp'/>">Project Six</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <!-- /.row -->
            
        </div>
        <!--/.商家列表 -->
        
         </div>
		<!-- /.搜尋結果-->
        <br>

        <!-- 頁數 -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
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