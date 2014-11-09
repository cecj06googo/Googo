<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedHashMap"%> 
<%@page import="java.util.Map"%>  
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>  
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="java.sql.*" %>
<%@page import="com.company.model.*"  %>

<% 
		String comVAT = request.getParameter("comVAT");
		CompanyService comService = new CompanyService();
		Map m1 = new HashMap();
		boolean valid = comService.verifyVAT(comVAT);
		System.out.println("統編驗證的結果: " + valid);
		m1.put("valid", valid);
		String jsonString = JSONValue.toJSONString(m1); 
		System.out.println(jsonString);
		out.println(jsonString);
		
			
%>