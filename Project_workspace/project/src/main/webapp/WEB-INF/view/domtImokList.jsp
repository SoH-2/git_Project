<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

table {
	 width: 73%;
}

table, th, tr, td {
	border-collapse: collapse;
	border: solid 1px #cccccc;
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>


<body>
	<h3>���οϷ�</h3>
	<table>
		<tr>
			<th>������ȣ</th>
			<!-- <th>�����ȣ</th> -->
			<th>����</th>
			<!-- <th>����</th> -->
			<th>�ۼ���</th>
			<th>Ÿ��</th>
		</tr>
		<c:forEach var="domt_imok_list_view" items="${domt_list3}">
			<tr>
				<td>${domt_imok_list_view.document_no}</td>
				<%-- <td>${domt_list_view.employee_no}</td> --%>
				<td><a href="domtView.do?document_no=${domt_imok_list_view.document_no}">${domt_imok_list_view.subject}</a></td>
			<%-- 	<td><a href="domtView.do?document_no=${domt_list_view.document_no}">${domt_list_view.contents}</a></td> --%>
				<td><fmt:formatDate value="${domt_imok_list_view.reg_date}" /></td>
				<td>${domt_imok_list_view.type}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="domt_imok_list.do">�������</a>
</body>
</html>