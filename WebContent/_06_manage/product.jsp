<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css2.jsp" />
<title>Goo-go</title>

</head>
<body>
 <div id="wrapper">
	<!-- top2 -->
	<jsp:include page="/_00_fragment/top2.jsp" />
	<!-- page-wrapper -->
        <div id="page-wrapper">
 			<!-- container-fluid -->
            <div class="container-fluid">
            <!--標頭-->
       		<div class="row">
            <div class="col-lg-12">
                <h2 class="page-header"><i class="fa fa-fw fa-th-list"></i> 商品管理 <small>product</small> </h2>
            </div></div><!--/.標頭-->
           <!--條件搜尋-->
           	<div class="well col-md-10 col-md-offset-1 text-center " >
		    <div class="row" >
                	<form class="form-inline" role="form">
                      <div class="form-group">
                            <select class="form-control input-lg"  autofocus="" >
                                <option>種類</option>  <!--純顯示 不能給user選-->
                                <option>汽車</option>
                                <option>機車</option>
                                <option>腳踏車</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control input-lg" >
                                <option>名稱</option> <!--純顯示 不能給user選-->
                                <option>???</option>
                                <option>???</option>
                                <option>???</option>
                                <option>???</option>   
                            </select>
                        </div>
            
                         <div class="form-group">
                              <input type="text" class="form-control input-lg" placeholder="請輸入關鍵字">
                         </div>
						<button class="btn btn-default btn-lg" type="submit"><i class="fa fa-search"></i></button>
                    </form> 
              
            </div> 
        </div><!--/.條件搜尋-->
        <!--filter參考  http://bootsnipp.com/snippets/featured/panel-table-with-filters-per-column -->  
         
        <!--汽車-->
        <div class="row">
		<div class="col-md-10 col-md-offset-1">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">汽車</h3>
            </div>
            <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>商品編號</th>
                        <th>呱呱</th>
                        <th>呱呱</th>
                        <th>呱呱</th>
                        <th>呱呱</th>
                        <th>價格</th>
                        <th class="text-center ath">修改/刪除</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>2500/天</td>
                        <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>
                    </tr>
                    <tr >
                        <td>2</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>2500/天</td>
                        <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>                    
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>呱呱</td>
                        <td>2500/天</td>
                        <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>                    
                    </tr>
                </tbody>
            </table>
			</div>
		   
			</div>
			</div>
			</div><!--/.汽車-->
			
		<!--機車-->
		<div class="row">
		<div class="col-md-10 col-md-offset-1">
        <div class="panel panel-yellow">
            <div class="panel-heading">
                <h3 class="panel-title">機車</h3>
            </div>
            <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr >
                        <th>商品編號</th>
                        <th>呱呱</th>
                        <th>呱呱</th>
                        <th>呱呱</th>
                        <th  class="text-center ath">修改/刪除</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                         <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>                    </tr>
                </tbody>
            </table>
			</div>
		   
			</div>
			</div>
			</div><!--/.機車-->
		
		<!--腳踏車-->
		<div class="row">
		<div class="col-md-10 col-md-offset-1">
        <div class="panel panel-green">
            <div class="panel-heading">
                <h3 class="panel-title">腳踏車</h3>
            </div>
            <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>商品編號</th>
                        <th>呱呱</th>
                        <th>呱呱</th>
                        <th>呱呱</th>
                        <th class="text-center ath">修改/刪除</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                         <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                         <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>                    </tr>
                     <tr>
                        <td>4</td>
                        <td>aaa</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger" data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>                    </tr>
                     <tr>
                        <td>5</td>
                        <td>bbb</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger" data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>                    
                     </tr>
                </tbody>
            </table>
			</div>
		   
			</div>
			</div>
			</div><!--/.腳踏車-->
		<!--商品明細 -->	
		<jsp:include page="/_06_manage/prod_detail.jsp" />	
		<!--修改商品-->
		<jsp:include page="/_06_manage/product_edit.jsp" /> 
		<!--刪除商品-->
		<jsp:include page="/_06_manage/product_del.jsp" />
			
            </div><!-- /.container-fluid -->

        </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

<!-- jQuery Version 1.11.0 -->
<script src="js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<script>

$("td[class!=text-center]").click(function(){
	$("td[class!=text-center]").attr( "data-toggle", "modal" );
	$("td[class!=text-center]" ).attr( "data-target", "#prod_detail" );
})

</script>

</body>
</html>