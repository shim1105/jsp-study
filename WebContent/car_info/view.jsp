<%@page import="java.sql.ResultSet"%>
<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String carNum = request.getParameter("carNum");
    String sql= "select * from car_info where ci_num=?";
    PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
    ps.setString(1, carNum);
    ResultSet rs= ps.executeQuery();
    if(rs.next()){
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/jsp-study/car_info/update_ok.jsp" method="post">
	 번호: <input type="number" name="carNum" value="<%=carNum %>" readonly="readonly"> <br>
	 차 명 : <input type="text" value="<%=rs.getString("ci_name") %>" readonly="readonly" name="carName"><br>
	 차 설명 : <input type="text" value="<%=rs.getString("ci_etc") %>" name="carEtc"><br>
	 <button>수정</button>
</form>
<button onclick="carList()">돌아가</button>
</body>
</html>
<%
    }else {
    	out.write("<br>조회하신 : "+carNum+"번호는 없음 <br>");
    	out.write("<a href=\"/jsp-study/car_info/list.jsp\">메뉴리스트</a>");
    }
%>

<script>
function carList(){
	var isDelete = confirm("돌아가");
	if(isDelete){
		location.href = "/jsp-study/car_info/list.jsp";
	}
}
</script>
