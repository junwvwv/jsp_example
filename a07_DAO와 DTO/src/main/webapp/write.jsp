<%@page import="com.board.dao.BoardDao"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	div{
		width: 600px;
		margin: 200px auto;
	}
	
	table{
		width: 600px;
		text-align: center;
		
	}
	
	th{
		background-color: aliceblue;
	}
	
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		
	}
	
	input[type="text"], textarea{
		width: 97%;
		border: 0px;
	}
	
</style>
</head>
<body>
<%
	String tmp = request.getParameter("num");
	int num = 0;	

	if(tmp != null && tmp.length() > 0){
		num = Integer.parseInt(tmp);
	}
	
	BoardDto dto = new BoardDto();

	String action = "insert.jsp";
	
	if(num > 0){
		dto = new BoardDao().view(num, false);
	  	action = "update.jsp?num=" + num;
	}
		
	
%>
<div>
	<form action="<%=action %>" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="<%=dto.getTitle()%>"></td>
			</tr>
			<tr>
				<th>작성자</th>
<%
				if(action == "insert.jsp"){
%>	
				<td><input type="text" name="writer" value="<%=dto.getWriter()%>"></td>
<%					
				}else{
%>					
				<td><input type="text" name="writer" value="<%=dto.getWriter()%>" readonly></td>
<%					
				}
%>			
				
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="20"><%=dto.getContent()%></textarea></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="저장">
		<input type="button" value="취소" onclick="history.back()">
	</form>
</div>	
</body>
</html>