<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>�ް���û��</title>
<style type="text/css">
#appwarp {width: 720px;margin: 0 auto; margin-top: 30px;}
table{	border-collapse: collapse;}
tr, td {border: solid 1px #7A7A7A; text-align: center; }
input, button {border: solid 1px #7A7A7A;}
h2 {text-align: center;	margin-bottom: 60px;}
#domtinfortable {width: 98%;}
#apptable{margin: auto;margin-right: 0px; padding: 10px;font-size: 12px;}
h4 {margin:10px 0px 5px 0px;}
.subject{width: 98%; font-size: 16px; padding: 3px;}
.naversm{width: 98%;}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js"></script>

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
</head>
<body>
	<div id="appwarp">
	<table id=apptable>
		<tr id="first">
			<td style="background-color: #ccc;" rowspan="2">��<br>��
			</td>
			<td>���</td>
		</tr>
		<tr id="second">
			<td>${name}</td>
		</tr>
	</table>
	<h2>�ް���û��</h2>
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
	
	<form action="../insert_App_And_Domt.do" method="POST" id="app_line_add_input">
		
		<input    name="document_no" type="hidden" value="${document_no}"  >
		<input    name="employee_no1" type="hidden" value="${employee_no}"  >
		<h4>����</h4>
		<input    name="subject" class="subject" type="text"  ><br>
		<h4>����</h4>
		<textarea name="contents" id="naversm" class="naversm" ></textarea>
		<input    name="reg_date"    type="hidden" class="now_date2" >
		<input    name="type"        type="hidden" value="1" >
		
		<input    name="approval_no" 	type="hidden"  value="${approval_no}" >
		<input    name="approval_date"  type="hidden"  class="now_date2" >
		<input    name="state"      	type="hidden"  value="0">
		
		<input type="button" onclick="history.go(-1)" value="���">
 		<input type="button" onclick="openChildWindow()"value="���缱"/>
		<input type="submit" id="save" value="�����û">
	</form>
	
	
	</div>
</body>
<script>
    var oEditors = [];
    $(function() {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "naversm", //textarea���� ������ id�� ��ġ�ؾ� �մϴ�. 
            //SmartEditor2Skin.html ������ �����ϴ� ���
            sSkinURI : "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
            htParams: {
                // ���� ��� ���� (true:���/ false:������� ����)
                bUseToolbar: true,
                // �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
                bUseVerticalResizer: true,
                // ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
                bUseModeChanger: true,
                fOnBeforeUnload: function() {

                }
            },
            fOnAppLoad: function() {
                //���� ����� ������ text ������ �����ͻ� �ѷ��ְ��� �Ҷ� ���
                oEditors.getById["naversm"].exec("PASTE_HTML",[contents]);
            },
            fCreator: "createSEditor2"
        });

        //�����ư Ŭ���� form ����
        $("#save").click(function() {
            oEditors.getById["naversm"].exec("UPDATE_CONTENTS_FIELD", []);
            /* $("#write_b").submit(); */
        });
    });
</script>
</html>