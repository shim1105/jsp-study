<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="text.jsp.study.db.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String foodNum= request.getParameter("foodNum");
    String sql = "select food_num,food_name,food_price from food where food_num=?";
    PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
    ps.setString(1,foodNum);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/jsp-study/food/update_ok.jsp" method="post">
	 번호: <input type="number" name="foodNum" value="<%=foodNum %>" readonly="readonly"> <br>
	 메뉴명 : <input type="text" value="<%=rs.getString("food_name") %>" name="foodName"><br>
	 메뉴가격 : <input type="number" value="<%=rs.getString("food_price") %>" name="foodPrice"><br>
	 <button>수정</button>
</form>

<a href="/jsp-study/food/list.jsp"> 눌러 </a>
</body>
</html>
<%
    }else {
    	out.write("<br>조회하신 : "+foodNum+"번호는 없음 <br>");
    	out.write("<a href=\"/jsp-study/food/list.jsp\">메뉴리스트</a>");
    }
%>