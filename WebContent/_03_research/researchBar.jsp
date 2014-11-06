<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--Search bar-->
        
        <div class="well" >
        <div class="row" >
        <div class="col-lg-12 text-center">
                	<form class="form-inline" role="form" action="SearchServlet.do" method="post">
                      <div class="form-group">
                            <select  class="form-control input-lg" name="location">
                                <option>地區</option>
                                <option value="臺北">臺北</option>
                                <option value="桃園">桃園</option>
                                <option value="宜蘭">宜蘭</option>
                                <option value="高雄">高雄</option>
                                <option value="墾丁">墾丁</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control input-lg" name="prod_type">
                                <option>交通工具</option>
                                <option value="1">汽車</option>
                                <option value="2">機車</option>
                                <option value="3">腳踏車</option>
                            </select>
                        </div>
            
                         <div class="form-group input-group">
                                <input type="text" class="form-control input-lg" name="keySearch" placeholder="商店名、地址、商品名">
                                <span class="input-group-btn"><button class="btn btn-default btn-lg" type="submit"><i class="fa fa-search"></i></button></span>
                         </div>
                         <div>
                             <Font color="red">${ErrMsg}</Font>     
                         </div>
                    </form> 
                    
                </div>
            </div> 
        </div>
      <!-- /.Search bar -->