<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String carEtc= request.getParameter("carEtc");
String carNum= request.getParameter("carNum");
String sql= " update car_info set ci_etc=? where ci_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,carEtc);
ps.setString(2,carNum);
int cnt = ps.executeUpdate();
String result= "실패 했다.";
if(cnt ==1){
	result = "성겅";
}
%>    
<script>
alert("<%=result%>");
location.href="/jsp-study/car_info/list.jsp";
</script>