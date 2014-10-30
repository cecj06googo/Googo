<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--Search bar-->
        
        <div class="well" >
        <div class="row" >
        <div class="col-lg-12 text-center">
                	<form class="form-inline" role="form" action="_03_research/research.jsp" method="get">
                      <div class="form-group">
                            <select class="form-control input-lg" >
                                <option>地區</option>
                                <option>台北</option>
                                <option>桃園</option>
                                <option>宜蘭</option>
                                <option>高雄</option>
                                <option>墾丁</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control input-lg" >
                                <option>地區</option>
                                <option>汽車</option>
                                <option>機車</option>
                                <option>腳踏車</option>
                                <option>4</option>   
                            </select>
                        </div>
            
                        <div class="form-group input-group">
                                <input type="text" class="form-control input-lg" placeholder="請輸入關鍵字">
                                <span class="input-group-btn"><button class="btn btn-default btn-lg" type="submit"><i class="fa fa-search"></i></button></span>
                         </div>

                    </form> 
                </div>
            </div> 
        </div>
      <!-- /.Search bar -->