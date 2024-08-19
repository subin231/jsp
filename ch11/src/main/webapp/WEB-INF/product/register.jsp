<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User1::register</title>
</head>
<body>
	<h3>product 등록</h3>
	
	<a href="/ch11/">처음으로</a>
	<a href="/ch11/product/list.do">목록</a>
	
	<form action="/ch11/product/register.do" method="post">
		<table border="1">
			<tr>
				<td>제품번호</td>
				<td><input type="number" name="prodNo"/></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="prodName"/></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="number" name="stock"/></td>
			</tr>
			<tr>
				<td>단가</td>
				<td><input type="number" name="price"/></td>
			</tr>
			<tr>
				<td>회사</td>
				<td><input type="text" name="company"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기"/>
				</td>
			</tr>		
		</table>
	</form>
</body>
</html>