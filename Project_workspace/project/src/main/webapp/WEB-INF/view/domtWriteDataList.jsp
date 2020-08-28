<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/component.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/table.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/deptdomlist.css'/>" />
</head>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/view/head.jsp" flush="false" />
		<section id="content">
			<div id="leftcontent">
				<ul>
					<li><a href="list.do">�μ�����</a></li>
					<li><a class="active" href="authority.do">���Ѱ���</a></li>
				</ul>
			</div>

			<div id="rightcontent">
			<h2>���繮�� ����Ʈ</h2>
				<table>
					<tr>
						<th>NO</th>
						<th>�ý���</th>
						<th>������</th>
						<th>��ĸ�</th>
						<th>�����</th>
					</tr>
					<tr>
						<td><a href="domtpage/1.do">5</a></td>
						<td><a href="domtpage/1.do">��������</a></td>
						<td><a href="domtpage/1.do">����</a></td>
						<td><a href="domtpage/1.do">�ް���û��</a></td>
						<td><a href="domtpage/1.do">-</a></td>
					</tr>
					<tr>
						<td><a href="domtpage/1.do">4</a></td>
						<td><a href="domtpage/1.do">��������</a></td>
						<td><a href="domtpage/1.do">����</a></td>
						<td><a href="domtpage/1.do">��������</a></td>
						<td><a href="domtpage/1.do">-</a></td>
					</tr>
					<tr>
						<td><a href="domtpage/1.do">3</a></td>
						<td><a href="domtpage/1.do">��������</a></td>
						<td><a href="domtpage/1.do">����</a></td>
						<td><a href="domtpage/1.do">ǰ�ǿ�û��</a></td>
						<td><a href="domtpage/1.do">-</a></td>
					</tr>
					<tr>
						<td><a href="domtpage/1.do">2</a></td>
						<td><a href="domtpage/1.do">��������</a></td>
						<td><a href="domtpage/1.do">����</a></td>
						<td><a href="domtpage/1.do">������û��</a></td>
						<td><a href="domtpage/1.do">-</a></td>
					</tr>
					<tr>
						<td><a href="domtpage/1.do">1</a></td>
						<td><a href="domtpage/1.do">��������</a></td>
						<td><a href="domtpage/1.do">����</a></td>
						<td><a href="domtpage/1.do">��Ÿ</a></td>
						<td><a href="domtpage/1.do">-</a></td>
					</tr>
				</table>
			</div>
		</section>
		<jsp:include page="/WEB-INF/view/foot.jsp" flush="false" />
	</div>
</body>
</html>