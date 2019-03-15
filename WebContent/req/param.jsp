<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
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
		Map<String, String[]> map = request.getParameterMap();
		Set<String> keys= map.keySet();
		Iterator<String> it= keys.iterator();
		while(it.hasNext()){
			String key= it.next();
			String[] values= map.get(key);
			out.write(key + " : "+values[0]);
		}
	%>
	<form method="get" action="/jsp-study/req/param_ok.jsp">
		<input type="text" name="id" value="redfia"><br>
	 	<input type="text"	name="name" id="nameid" value="hong"><br>
		<input type="date" name= "credat" value="2019-03-14"><br>
		<select name="trans">
			<option value="m">남자</option>
			<option value="w">여자</option>
		</select><br>
		<textarea name="content" cols="20" rows="25"></textarea>		 
		<button>전송</button>
	</form>
</body>