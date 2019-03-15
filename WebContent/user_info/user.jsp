<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
	<form method="post" action="/jsp-study/user_info/user_ok.jsp">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" maxlength="33" name="ui_name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" max="120" name="ui_age"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" maxlength="33" name="ui_id"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" maxlength="1333" name="ui_etc"></td>
			</tr>
			
		</table>
		<button>입력</button>
	</form>
</body>
</html>