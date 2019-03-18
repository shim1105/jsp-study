<%@page import="java.sql.ResultSet"%>
<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sql ="select tm_num,tm_name,tm_content from toma where 1=1";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while (rs.next()){
%>
<form method="post" action="/jsp-study/toma/view.jsp">
	


<%
}
%>
</form>
</body>
</html>