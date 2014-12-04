<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.template.model.Prototype_OrderTemp_VO, com.company.model.CompanyVO"%>
<% Prototype_OrderTemp_VO tempVo = (Prototype_OrderTemp_VO)request.getAttribute("tempVo"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<% 
session = request.getSession(); 
CompanyVO comVO = (CompanyVO) session.getAttribute("LoginComOK");
int currentCom = (int)comVO.getComID();
%>

<c:set value="<%= currentCom %>" var="currentCom" />
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css2.jsp" />

<!-- <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/codemirror.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/form_builder.css" rel="stylesheet">

<script>
// 取得新增成功訊息
var DesignerMsg = <%= request.getAttribute("DesignerMsg") %>
// 取得當前登入商家 id 供設計器使用
var currentCom = <%= currentCom %>;
// 提供 form_builder.js 使用的路徑
var contextPath = '<%=request.getContextPath()%>';
// top2左方功能列選項
$("#selectManage").addClass("active");
</script>
<title>測試 - 整合商家設計</title>

</head>
<body>
<div id="wrapper">
	
	<jsp:include page="/_00_fragment/top2.jsp" />

	<div id="page-wrapper">
	
	<!-- Options Modal -->
        <div class="modal fade" id="options_modal" tabindex="-1" role="dialog" aria-labelledby="options_modal_label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="options_modal_label">Options</h4>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="save_options">Save changes</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
		
        <div class="row">
            
            <!-- modified: document heading  -->
            <div class="col-lg-offset-1 col-md-10">
            	<div class="alert alert-success" role="alert" style="visibility:hidden"></div>
            </div>
            
            <div class="col-lg-offset-1 col-sm-10 col-md-10">
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        
                        <div class="tabbable">
                        	<ul class="nav nav-tabs">
                        		<li class="active"><a href="#editor-tab" data-toggle="tab">編輯區</a></li>
                        	</ul>
                        	<div class="tab-content">
                        		<div class="tab-pane active" id="editor-tab">
									<br>
									<form id="content" class="form-horizontal">
                        				<fieldset>
                        					<legend><p style="text-align:center">請拖拉右側設計元件至此</p></legend>
                        				</fieldset>
										${tempVo.content}
									</form>
									<div style="display:none;">
										<textarea id="source"></textarea>
									</div>
                        		</div>
                        	</div>
                        </div>

						<form id="form_view" action="<%=request.getContextPath()%>/DesignAccessDB" method="post" style="display:none">
							com_id<input type="text" name="com_id_form_view" id="com_id_form_view" value="${currentCom}" /><br>
							command<input type="text" id="command" name="command" value="insert" readonly /><br>
							content<textarea name="content_form_view" id="content_form_view"></textarea><br>
						</form>
						<button type="button" class="btn btn-primary" id="save_form_view">儲存設計</button>
						
						<form id="form_load" action="<%=request.getContextPath()%>/DesignAccessDB" method="post" style="display:none">
							This form is used to load previous design result for editing.
							com_id<input type="text" name="com_id_form_view" id="com_id_form_view" value="${currentCom}" /><br>
							command<input type="text" id="command" name="command" value="load" readonly /><br>
						</form>
						<button type="button" class="btn btn-primary" id="save_form_design">載入設計</button>
                        
                    </div>

                    <div class="col-sm-6 col-md-6">
                        
                        <div class="tabbable">
                        	<ul class="nav nav-tabs">
                        		<li class="active"><a href="#components-tab" data-toggle="tab">一般設計元件</a></li>
                        		<li><a href="#predefined-tab" data-toggle="tab">套裝設計元件</a></li>
                        	</ul>
                        	<div class="tab-content">
                        		<div class="tab-pane active" id="components-tab">
                        			
                        			<!-- <h1>Components</h1> -->
                        			<hr>
                        			<div id="components-container" class="form-horizontal">
                            			<div class="component form-group" data-type="text">
                                			<label class="control-label col-sm-4" for="text_input">文字輸入框</label>
                                			<div class="controls col-sm-8">
                                    		<input type="text" name="" id="text_input" placeholder="預設內容" class="form-control">
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="textarea">
                                			<label class="control-label col-sm-4" for="textarea">段落輸入框</label>
                                			<div class="controls col-sm-8">
                                    		<textarea name="" class="form-control" id="textarea" placeholder="預設內容"></textarea>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="SelectBasic">
                                			<label class="control-label col-sm-4" for="SelectBasic">下拉單選</label>
                                			<div class="controls col-sm-8">
                                    		<select class="form-control" name="" id="SelectBasic">
                                        	<option value="1">選項一</option>
                                        	<option value="2">選項二</option>
                                        	<option value="3">選項三</option>
                                    		</select>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="SelectMultiple">
                                			<label class="control-label col-sm-4" for="SelectMultiple">下拉多選</label>
                                			<div class="controls col-sm-8">
                                    		<select name="" class="form-control" id="SelectMultiple" multiple="multiple" size="3">
                                        	<option value="1">選項一</option>
                                        	<option value="2">選項二</option>
                                        	<option value="3">選項三</option>
                                    		</select>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="checkbox">
                                			<label class="control-label col-sm-4">複選框</label>
                                			<div class="controls col-sm-8">
                                    		<div class="checkbox"><label class="" for="checkbox_1">
                                        	<input type="checkbox" name="checkbox" id="checkbox_1">
                                        	選項一
                                    		</label></div>
                                    		<div class="checkbox"><label class="" for="checkbox_2">
                                        	<input type="checkbox" name="checkbox" id="checkbox_2">
                                        	選項二
                                    		</label></div>
                                    		<div class="checkbox"><label class="" for="checkbox_3">
                                        	<input type="checkbox" name="checkbox" id="checkbox_3">
                                        	選項三
                                    		</label></div>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="radio">
                                			<label class="control-label col-sm-4">單選圈</label>
                                			<div class="controls col-sm-8">
                                    		<div class="radio"><label class="" for="radio_1">
                                        	<input type="radio" name="radio" id="radio_1">
                                        	選項一
                                    		</label></div>
                                    		<div class="radio"><label class="" for="radio_2">
                                        	<input type="radio" name="radio" id="radio_2">
                                        	選項二
                                    		</label></div>
                                    		<div class="radio"><label class="" for="radio_3">
                                        	<input type="radio" name="radio" id="radio_3">
                                        	選項三
                                    		</label></div>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="StaticText">
                                			<label class="control-label col-sm-4">文字說明</label>
                                			<div class="controls col-sm-8">
                                    		靜態內容，可以接受HTML格式標籤
                                			</div>
                            			</div>
										
										<!-- 
                            			<div class="form-actions component" data-type="submit">
                                			<button type="submit" class="btn btn-primary">Save changes</button>
                                			<button type="button" class="btn btn-default" onclick="javascript:window.history.back();">Cancel</button>
                            			</div>
                            			 -->
                        			</div>
                        		
                        		</div>
                        		<div class="tab-pane" id="predefined-tab">
                        			<hr>
                        			<div id="components-container" class="form-horizontal">
                        				
                        				<div class="component form-group" data-type="PreSelectBasic">
                                			<label class="control-label col-sm-4" for="PreSelectBasic">配備單選下拉</label>
                                			<div class="controls col-sm-8">
                                    		<select class="form-control" name="" id="PreSelectBasic">
                                        	<option value="0">請下拉選擇配備</option>
                                    		</select>
                                			</div>
                            			</div>
                            			
                            			<div class="component form-group" data-type="PreBox">
                                			<label class="control-label col-sm-4" for="PreSelectBasic">配備自訂下拉</label>
                                			<div class="controls col-sm-8">
                                    		<select class="form-control" name="" id="PreBox">
                                        	<option value="0">請下拉選擇配備</option>
                                    		</select>
                                			</div>
                            			</div>
                            			
                            			<div class="component form-group" data-type="AdditionalInsurance">
                                			<label class="control-label col-sm-4" for="AdditionalInsuranceName">加保人姓名</label>
                                			<div class="controls col-sm-8">
                                    			<input type="text" class="form-control" name="" id="AdditionalInsuranceName" style="margin-bottom:5px" value="預設被保險人，請按照身份證或駕照姓名填寫">
                                    		</div>
                                    		<label class="control-label col-sm-4" for="AdditionalInsurancePhone">加保人手機</label>
                                			<div class="controls col-sm-8">
                                    			<input type="text" class="form-control" name="" id="AdditionalInsurancePhone" style="margin-bottom:5px" value="格式：0900-000-000">
                                    		</div>
                                    		<label class="control-label col-sm-4" for="AdditionalInsuranceMail">聯絡郵件</label>
                                			<div class="controls col-sm-8">
                                    			<input type="text" class="form-control" name="" id="AdditionalInsuranceMail" style="margin-bottom:5px" value="任何臨時車輛異動將即時以電子郵件通知您">
                                    		</div>
                                    		<label class="control-label col-sm-4" for="AdditionalInsuranceID">身份證字號</label>
                                			<div class="controls col-sm-8">
                                    			<input type="text" class="form-control" name="" id="AdditionalInsuranceID" style="margin-bottom:5px" value="主管機關備查用，請務必填寫正確">
                                    		</div>
                            			</div>
                            			
                        			</div>
                        		</div>
                        	</div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
	
	</div><!-- end of #page-wrapper -->
        

</div><!-- end of #wrapper -->

<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/form_builder.js"></script>
<script src="<%=request.getContextPath()%>/js/codemirror.min.js"></script>
<script src="<%=request.getContextPath()%>/js/formatting.js"></script>

</body>
</html>