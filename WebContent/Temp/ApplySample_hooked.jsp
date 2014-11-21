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
            	<div class="alert alert-danger" role="alert">This is modified version for various tests. Current company id: ${currentCom} </div>
            </div>
            
            <div class="col-lg-offset-1 col-sm-10 col-md-10">
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <!-- <h1>Form Builder</h1> -->
                        <!-- <hr> -->
                        
                        <!-- modified: keep editor, need to solve source update problem -->
                        <form id="content" class="form-horizontal">
                        	<fieldset id="content_form_name">
								<legend>Form Name</legend>
							</fieldset>
							${tempVo.content}
						</form>
						<div style="display:none;">
							<textarea id="source"></textarea>
						</div>
						<!-- modified: button - save form -->
						<form id="form_view" action="<%=request.getContextPath()%>/DesignAccessDB" method="post">
							com_id<input type="text" name="com_id_form_view" id="com_id_form_view" value="${currentCom}" /><br>
							command<input type="text" id="command" name="command" value="insert" readonly /><br>
							content<textarea name="content_form_view" id="content_form_view"></textarea><br>
							<button type="button" class="btn btn-primary" id="save_form_view">Save Form for View</button>
						</form>
						
						<form id="form_load" action="<%=request.getContextPath()%>/DesignAccessDB" method="post">
							This form is used to load previous design result for editing.
							com_id<input type="text" name="com_id_form_view" id="com_id_form_view" value="${currentCom}" /><br>
							command<input type="text" id="command" name="command" value="load" readonly /><br>
						</form>
						<button type="button" class="btn btn-primary" id="save_form_design">Load Form for Editing</button>
						
                        <!-- modified: removed tab, keep editor, hide source -->
                        <!--  
                        <div class="tabbable">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#editor-tab" data-toggle="tab">Editor</a></li>
                                <li><a href="#source-tab" data-toggle="tab">Source</a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane active" id="editor-tab">
                                    <form id="content" class="form-horizontal">
                                        <fieldset id="content_form_name">
                                            <legend>Form Name</legend>
                                        </fieldset>
                                    </form>
                                </div>

                                <div class="tab-pane" id="source-tab">
                                    <textarea id="source"></textarea>
                                </div>
                            </div>
                        </div>
                        -->
                        
                    </div>

                    <div class="col-sm-6 col-md-6">
                        
                        <div class="tabbable">
                        	<ul class="nav nav-tabs">
                        		<li class="active"><a href="#components-tab" data-toggle="tab">Components</a></li>
                        		<li><a href="#predefined-tab" data-toggle="tab">Predefined</a></li>
                        	</ul>
                        	<div class="tab-content">
                        		<div class="tab-pane active" id="components-tab">
                        			
                        			<!-- <h1>Components</h1> -->
                        			<hr>
                        			<div id="components-container" class="form-horizontal">
                            			<div class="component form-group" data-type="text">
                                			<label class="control-label col-sm-4" for="text_input">Text Input</label>
                                			<div class="controls col-sm-8">
                                    		<input type="text" name="" id="text_input" placeholder="placeholder" class="form-control">
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="textarea">
                                			<label class="control-label col-sm-4" for="textarea">Textarea</label>
                                			<div class="controls col-sm-8">
                                    		<textarea name="" class="form-control" id="textarea" placeholder="placeholder"></textarea>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="SelectBasic">
                                			<label class="control-label col-sm-4" for="SelectBasic">Select - Basic</label>
                                			<div class="controls col-sm-8">
                                    		<select class="form-control" name="" id="SelectBasic">
                                        	<option value="1">Option 1</option>
                                        	<option value="2">Option 2</option>
                                        	<option value="3">Option 3</option>
                                    		</select>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="SelectMultiple">
                                			<label class="control-label col-sm-4" for="SelectMultiple">Select - Multiple</label>
                                			<div class="controls col-sm-8">
                                    		<select name="" class="form-control" id="SelectMultiple" multiple="multiple" size="3">
                                        	<option value="1">Option 1</option>
                                        	<option value="2">Option 2</option>
                                        	<option value="3">Option 3</option>
                                    		</select>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="checkbox">
                                			<label class="control-label col-sm-4">Checkboxes</label>
                                			<div class="controls col-sm-8">
                                    		<div class="checkbox"><label class="" for="checkbox_1">
                                        	<input type="checkbox" name="checkbox" id="checkbox_1">
                                        	Option 1
                                    		</label></div>
                                    		<div class="checkbox"><label class="" for="checkbox_2">
                                        	<input type="checkbox" name="checkbox" id="checkbox_2">
                                        	Option 2
                                    		</label></div>
                                    		<div class="checkbox"><label class="" for="checkbox_3">
                                        	<input type="checkbox" name="checkbox" id="checkbox_3">
                                        	Option 3
                                    		</label></div>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="radio">
                                			<label class="control-label col-sm-4">Radio Buttons</label>
                                			<div class="controls col-sm-8">
                                    		<div class="radio"><label class="" for="radio_1">
                                        	<input type="radio" name="radio" id="radio_1">
                                        	Option 1
                                    		</label></div>
                                    		<div class="radio"><label class="" for="radio_2">
                                        	<input type="radio" name="radio" id="radio_2">
                                        	Option 2
                                    		</label></div>
                                    		<div class="radio"><label class="" for="radio_3">
                                        	<input type="radio" name="radio" id="radio_3">
                                        	Option 3
                                    		</label></div>
                                			</div>
                            			</div>

                            			<div class="component form-group" data-type="static_text">
                                			<label class="control-label col-sm-4">Static Text</label>
                                			<div class="controls col-sm-8">
                                    		Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
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
                                			<label class="control-label col-sm-4" for="PreSelectBasic">Predefined - Select - Basic</label>
                                			<div class="controls col-sm-8">
                                    		<select class="form-control" name="" id="PreSelectBasic">
                                        	<option value="0">Dynamic options from DB</option>
                                    		</select>
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