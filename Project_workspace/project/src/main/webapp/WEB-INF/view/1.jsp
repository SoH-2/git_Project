<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/component.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/table.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/deptdomlist.css'/>" />

<script type="text/javascript">
	function winOpen() {
		var url = "../emplist_selectAdd.do"; //
		window.open(url, "", "width=500,height=400,left=700");
	}
</script>

<script type="text/javascript">
	// �ڽ�â window ��ü�� ������ ����
	var windowObj;
	function openChildWindow() {
		// �ڽ�â�� ���� �ڽ�â�� window ��ü�� windowObj ������ ����
		windowObj = window.open("../emplist_selectAdd.do", "",
				"width=500,height=400,left=700");
		// �ڽ�â�� childText��� id�� ���� �±� ����� ���� �θ�â�� ���� ����
		//windowObj.document.getElementById("empmove").name/*  = document.getElementById('parentText').value */;
	}
</script>
<script type="text/javascript">
$(document).ready(function() {
	var date = new Date(); 
	var yyyy = date.getFullYear(); 
	var mm = new String(date.getMonth()+1); 
	var dd = new String(date.getDate()); 
	var nowdate = yyyy+"-"+(("00"+mm.toString()).slice(-2))+"-"+(("00"+dd.toString()).slice(-2));
	$("#now_date").html(nowdate);
	$(".now_date2").attr("value",nowdate)
    });
</script>
<script>
    var oEditors = [];
    $(function() {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "naversm", //textarea���� ������ id�� ��ġ�ؾ� �մϴ�. 
            //SmartEditor2Skin.html ������ �����ϴ� ���
            sSkinURI : "<%=request.getContextPath()%>
	/smarteditor/SmartEditor2Skin.html",
					htParams : {
						// ���� ��� ���� (true:���/ false:������� ����)
						bUseToolbar : true,
						// �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
						bUseVerticalResizer : true,
						// ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
						bUseModeChanger : true,
						fOnBeforeUnload : function() {

						}
					},
					fOnAppLoad : function() {
						//���� ����� ������ text ������ �����ͻ� �ѷ��ְ��� �Ҷ� ���
						oEditors.getById["naversm"].exec("PASTE_HTML",
								[ contents ]);
					},
					fCreator : "createSEditor2"
				});

		//�����ư Ŭ���� form ����
		$("#save").click(function() {
			oEditors.getById["naversm"].exec("UPDATE_CONTENTS_FIELD", []);
			/* $("#write_b").submit(); */
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
					<li><a>����������</a></li>
					<li><a href="domt_imok_list.do">����Ϸ���</a></li>
				</ul>
			</div>

			<div id="rightcontent">
				<div id="appwarp">
					<table id=apptable>
						<tr id="first">
							<td rowspan="2">��<br>��
							</td>
							<td>���</td>
						</tr>
						<tr id="second">
							<td>${name}</td>
						</tr>
					</table>
					<h3 class="clear">�ް���û��</h3>
					<table id="domtinfortable">
						<tr style="font-weight: bold;">
							<td>������ȣ</td>
							<td>�ۼ���</td>
							<td>�ۼ��μ�</td>
							<td>�ۼ���</td>
						</tr>
						<tr>
							<td>�ڵ�ä��(${document_no})</td>
							<td id="now_date"></td>
							<td>${dept_name}</td>
							<td>${name}</td>
						</tr>
					</table>
					<br>

					<form action="../insert_App_And_Domt.do" method="POST"
						id="app_line_add_input">

						<input name="document_no" type="hidden" value="${document_no}">
						<input name="employee_no1" type="hidden" value="${employee_no}">
						<h1 class=textleft>����</h1>
						<input name="subject" class="subjectf" type="text"><br>
						<h1 class=textleft>����</h1>
						<textarea name="contents" id="naversm" class="naversm"></textarea>
						<input name="reg_date" type="hidden" class="now_date2"> <input
							name="type" type="hidden" value="1"> <input
							name="approval_no" type="hidden" value="${approval_no}">
						<input name="approval_date" type="hidden" class="now_date2">
						<input name="state" type="hidden" value="0">
						<input class="myButton2" type="button" onclick="history.go(-1)" value="���" >
						<input class="myButton3" type="submit" id="save" value="�����û">
						<input class="myButton3" type="button" onclick="openChildWindow()" value="���缱" />
					</form>


				</div>

			</div>

		</section>
		<jsp:include page="/WEB-INF/view/foot.jsp" flush="false" />
	</div>
</body>

</html>
