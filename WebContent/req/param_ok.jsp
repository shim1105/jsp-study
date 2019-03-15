<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Map<String, String[]> map = request.getParameterMap();
	String[] ids=map.get("id");
	String[] name=map.get("name");
	String[] credat= map.get("credat");
	String[] trans =map.get("trans");
	String[] content=map.get("content");
	if(ids!=null){
		out.write("ID : "+ids[0]+"<br>");
		out.write("NAME : "+name[0]+"<br>");
		out.write("CREDAT : "+credat[0]+"<br>");
		out.write("TRANS : "+trans[0]+"<br>");
		out.write("CONTENT : "+content[0].replace("\r", "<br>")+"<br>");
	}
%>