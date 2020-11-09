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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		var ttt = "";
		$('.no_han').each(function() {
			ttt = $(this).text();
			if (ttt == 0) {
				$(this).text('-');
			} else if (ttt == 1) {
				$(this).text('����');
			} else if (ttt == 2) {
				$(this).text('�ݷ�');
			}
		});
	});
</script>
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
				<div id="appwarp">
					<table id=apptable>
						<tr id="first">
							<td style="background-color: #f4f4f4;" rowspan="2">��<br>��
							</td>
							<c:forEach var="domt_appline_view" items="${domt_appline}">
								<td>${domt_appline_view.dept_name}</td>
							</c:forEach>
						</tr>
						<tr id="second">
							<c:forEach var="domt_appline_view" items="${domt_appline}">
								<td>${domt_appline_view.name}<br> <span class="no_han">${domt_appline_view.state}</span>
								</td>
							</c:forEach>
						</tr>
					</table>
					<h2 class="clear">�ް���û��</h2>
					<table id="domtinfortable">
						<tr style="font-weight: bold;">
							<td>������ȣ</td>
							<td>�ۼ���</td>
							<td>�ۼ��μ�</td>
							<td>�ۼ���</td>
						</tr>
						<tr>
							<td>�ڵ�ä��(${document_no})</td>
							<td>${reg_date}</td>
							<td>${dept_name}</td>
							<td>${name}</td>
						</tr>
					</table>
					<br>

					<form action="../insert_App_And_Domt.do" method="POST"
						id="app_line_add_input">

						<div class ="subjectf">&nbsp;${subject}</div><br>
						<div class="contenttt">&nbsp;${contents}</div>
						<input type="button" class="myButton2" value="�������" onclick="history.go(-1)">
					</form>


				</div>
			</div>

		</section>
		<jsp:include page="/WEB-INF/view/foot.jsp" flush="false" />
	</div>
</body>
</html>


