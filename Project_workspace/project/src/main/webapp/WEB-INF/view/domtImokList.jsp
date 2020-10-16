<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/component.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/table.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/deptdomlist.css'/>" />
<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>����Ϸ���</title>
</head>

<body>
<div id="wrap">
		<jsp:include page="/WEB-INF/view/head.jsp" flush="false" />
		<section id="content">
			<div id="leftcontent">
				<ul>
					<li><a href="appdomt.do">����������</a></li>
					<li><a href="domt_imok_list.do">����Ϸ���</a></li>
				</ul>
			</div>
			<div id="rightcontent">
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
			</div>

		</section>
		<jsp:include page="/WEB-INF/view/foot.jsp" flush="false" />
	</div>
</body>















































<body>
	
</body>
</html>