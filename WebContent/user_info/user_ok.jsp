<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uiName = request.getParameter("ui_name");
	String uiAge = request.getParameter("ui_age");
	String uiId = request.getParameter("ui_id");
	String uiEtc = request.getParameter("ui_etc");

	String sql = "insert into user_info(ui_num,ui_name,ui_age,ui_id,ui_etc)";
	sql += " values(seq_ui_num.nextval,?,?,?,?)";
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ps.setString(1, uiName);
	ps.setString(2, uiAge);
	ps.setString(3, uiId);
	ps.setString(4, uiEtc);
	int cnt = ps.executeUpdate();
	String result = "실패했다.";
	if (cnt == 1) {
		result = "ㅅㄱ";
	}
%>
<script>
	alert("<%=result%>");
	location.href = "/jsp-study/user_info/user.jsp";
</script>