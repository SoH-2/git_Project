<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>����Ʈ������2.0 ����</title>
<style type="text/css">
	table, tr, td {	border-collapse: collapse;	border: solid 1px #7A7A7A;	text-align: center;}
	input, button {	border: 0px;	padding: 5px;}
</style>
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	function winOpen() {
		var url = "../emplist_selectAdd.do"; //
		window.open(url, "", "width=400,height=400,left=600");
	}
</script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "ir1",
		sSkinURI : "../se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
</script>
</head>
<body>
	<table>
		<tr>
			<td style="background-color: #ccc;" rowspan="2">��<br>��
			</td>
			<td>�ۼ���</td>
		</tr>
		<tr>
			<td>�������̸�</td>
		</tr>
	</table>
	<h3>����Ʈ������2.0�Դϴ�</h3>
	<table style="width: 700px;">
		<tr style="font-weight: bold;">
			<td>������ȣ</td>
			<td>�ۼ���</td>
			<td>�ۼ��μ�</td>
			<td>�ۼ���</td>
		</tr>
		<tr>
			<td>151125</td>
			<td>2020-07-21</td>
			<td>������</td>
			<td>�豤��</td>
		</tr>
	</table>
	<br>
	<textarea name="ir1" id="ir1" rows="10" cols="100">�����Ϳ� �⺻���� ������ ��(���� ���)�� ���ٸ� �� value ���� �������� �����ø� �˴ϴ�.</textarea>
	<form action="">
		<br> <input type="button" value="��ȹ������"> <input
			style="background-color: #FF4565;" type="reset" value="�г��� �ٽþ���">
		<button style="background-color: #91FF3C;" onclick="winOpen();">�����߰�</button>
		<button style="background-color: #3CBBFF;" onclick="">�����߰�</button>
		<input style="background-color: #2970FF;" type="submit" value="�ۼ��Ϸ�">
	</form>


</body>
</html>