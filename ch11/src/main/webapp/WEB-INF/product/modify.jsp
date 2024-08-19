<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>customer::modify</title>
</head>
<body>
	<h3>product 수정</h3>
	
	<a href="/ch11/">처음으로</a>
	<a href="/ch11/product/list.do">목록으로</a>
	
	<form action="/ch11/product/modify.do" method="post">
		<table border="1">
			<tr>
				<td>제품번호</td>
				<td><input type="number" name="prodNo" value="${products.prodNo}" readonly/></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="prodName" value="${products.prodName}"/></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="number" name="stock" value="${products.stock}"/></td>
			</tr>
			<tr>
				<td>단가</td>
				<td><input type="number" name="price" value="${products.price}"/></td>
			</tr>
			<tr>
				<td>회사</td>
				<td><input type="text" name="company" value="${products.company}"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기"/>
				</td>
			</tr>		
		</table>
	</form>
</body>
</html>