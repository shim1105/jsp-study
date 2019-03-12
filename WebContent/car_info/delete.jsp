<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String carNum= request.getParameter("carNum");
String sql= "delete from car_info where ci_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1, carNum);
int cnt= ps.executeUpdate();
String result = "실패했ㅅ브니다";
if( cnt == 1){
	result = "성공했습니다.";
}
%>
<script>
alert("<%=result%>");
location.href="/jsp-study/car_info/list.jsp";
</script>