<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String foodNum = request.getParameter("foodNum");
String sql = "delete from food where food_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,foodNum);
int cut = ps.executeUpdate();
String result= "실패했다.@!"; 
if( cut != 0 ){
	result= "성공은 실패하는 것읻가?";
}
%>
<script>
alert("<%=result%>");
location.href="/jsp-study/food/list.jsp";
</script>