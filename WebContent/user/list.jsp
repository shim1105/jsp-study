<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="text.jsp.study.common.NumberText"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		out.println(NumberText.COUNTER++ + "<br>");
		String sql = "select name, birth, id, pwd from users";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				out.println(rs.getString("name"));
				out.println("," + rs.getString("birth"));
				out.println("," + rs.getString("id"));
				out.println("," + rs.getString("pwd") + "<br>");
			}
		} catch (Exception e) {
		} finally {
			DBCon.close();
		}
	%>
</body>
</html>