<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!-- data-backdrop="static" 按後面不消失 --> 		
   	<div id="register_success" class="modal fade" role="dialog" data-backdrop="static"  aria-labelledby="register_success" aria-hidden="false">
	<div class="modal-dialog modal-sm">
  	<div class="modal-content">
	<div class="modal-header">
	    <h3>註冊成功</h3>
	</div>
	  <div class="modal-body">
	    <p>請前往E-mail認證後登入喔!5秒後自動前往首頁登入</p>
	    <p><a href="<c:url value='/index.jsp'/>" class="btn btn-danger center-block" role="button">前往登入</a></p>
	  </div>
	</div></div></div>	
     		