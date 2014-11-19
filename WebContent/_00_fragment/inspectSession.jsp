<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- 此為測試用程式碼，在後端 console 檢查 session 內容物 -->
<%
Enumeration e = request.getSession().getAttributeNames();
while (e.hasMoreElements()){
	System.out.println(e.nextElement());
}
%>