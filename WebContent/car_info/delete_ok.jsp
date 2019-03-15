<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String[] carNums = request.getParameterValues("ci_num");
	String sql = "delete from car_info where 1=1 ";
	sql += " and ci_num in(";
	for (int i = 0; i < carNums.length; i++) {
		sql += "?,";
	}
	sql = sql.substring(0, sql.length() - 1);
	sql += ")";
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	for(int i =0;i<carNums.length;i++){
		ps.setString(i+1,carNums[i]);
	}
	int cnt= ps.executeUpdate();
	String result = "실패했ㅅ브니다";
	if( cnt == carNums.length){
		result = "성공했습니다.";
	}
	%>
	<script>
	alert("<%=result%>");
	location.href="/jsp-study/car_info/list.jsp";
	</script>