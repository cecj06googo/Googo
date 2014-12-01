<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- 此為測試用程式碼，在後端 console 檢查 session 內容物 -->
<%
System.out.println("\n--------");

System.out.println("Current page: " + request.getRequestURI());

String elements = "Objects in session: ";
Enumeration e = request.getSession().getAttributeNames();
while (e.hasMoreElements()){
	Object currentObj = e.nextElement();
	elements += ("\n  Name - " + currentObj.toString() + ", Class - " + request.getSession().getAttribute(currentObj.toString()));
}
System.out.println(elements);
System.out.println("--------");
%>