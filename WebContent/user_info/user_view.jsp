<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="text.jsp.study.db.DBCon"%>
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
	String uiNum= request.getParameter("ui_num");
	String sql= "select ui_num,ui_name,ui_id,ui_age,ui_etc from user_info ";
	sql += " where ui_num=?";
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ps.setString(1, uiNum);
	ResultSet rs= ps.executeQuery();
	if(rs.next()){
		%>
		<form action="/jsp-study/user_info/update_ok.jsp" id="userform">
		번호 : <%=rs.getString("ui_num") %> <br>
		이름 : <input type="text" name="ui_name" value="<%=rs.getString("ui_name") %>"><br>
		아이디 : <input type="text" name="ui_id" value="<%=rs.getString("ui_id") %>"><br>
		나이 : <input type="text" name="ui_age" value="<%=rs.getString("ui_age") %>"><br>
		비고 : <textarea name="ui_etc"><%=rs.getString("ui_etc")%></textarea><br>
		<button>유저수정</button>	
		<button type="button" onclick="deleteUser()">삭제</button>
		<input type="hidden" name="ui_num" value =<%=rs.getString("ui_num") %>>
		<!-- 어디 있어도 상관없음 ., -->
		
		</form>
		
		<%
	}else {
		out.write(uiNum+"이건 없어 ㅉㅉ@!");
	}
%>
<script >
	function deleteUser(uiNum){
		alert("삭제버튼을 클릭 햇순 ..!!");
		document.getElementById("userForm").action="/jsp-study/user_info/delete_ok.jsp"
		document.getElementById("userForm").submit();

	}
</script>
<form id= "deleteform">
	<input type="hidden" name="ui_num" id="ui_num">
</form>
</body>
</html>