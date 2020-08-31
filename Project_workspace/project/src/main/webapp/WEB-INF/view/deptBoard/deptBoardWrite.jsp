<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/component.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/table.css'/>" />
<head>
<title>공지사항 게시판</title>
<script type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function writeSave() {

		if (document.write.reg_date.value == "") {
			alert("날짜를 입력하십시요.");
			document.write.reg_date.focus();
			return false;
		}
		if (document.write.subject.value == "") {
			alert("제목을 입력하십시요.");
			document.write.subject.focus();
			return false;
		}

		if (document.write.contents.value == "") {
			alert("내용을 입력하십시요.");
			document.write.contents.focus();
			return false;
		}
	}
</script>
<script>
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='boardWrite']");

						fn_addFile();

						function fn_addFile() {
							var fileIndex = 1;
							//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
							$(".fileAdd_btn")
									.on(
											"click",
											function() {
												$("#fileIndex")
														.append(
																"<div><input type='file' style='float:left;' name='file_"
																		+ (fileIndex++)
																		+ "'>"
																		+ "<button type='button' style='float:left;' id='fileDelBtn'>"
																		+ "취소"
																		+ "</button>"
																		+ "</div><br>");
											});
							$(document).on("click", "#fileDelBtn", function() {
								$(this).parent().remove();

							});
						}
					});
</script>
</head>


<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/view/head.jsp" flush="false" />
		<section id="content">

			<div id="leftcontent">
				<ul>
					<li><a class="active" href="blist.do">공지사항 게시판</a></li>
					<li><a href="deptBoardList.do?type=2">부서 게시판</a></li>
				</ul>
			</div>


			<div id="rightcontent">
				<b>글쓰기</b> <br>
				<form method="post" name="boardWrite" action="deptWrite2.do"
					enctype="multipart/form-data" onsubmit="return writeSave()">
					<input type="hidden" name="type" value="2"> <input
						type="hidden" name="board_no" value="${dto.board_no}"> <input
						type="hidden" name="board_no" value="${dto.readcount}">

					<table width="740" border="1" cellspacing="0" cellpadding="0"
						align="center">

						<tr>
							<td width="185" align="center">제 목</td>
							<td width="555"><input type="text" size="40" maxlength="50"
								name="subject"></td>
							<%-- <td width="185" align="center">작성자</td>
				<td align="left" width="555">${board.name} --%>
							<td><input type="hidden" name="employee_no"
								value="${mc_employee_no}"></td>
						</tr>

						<tr> 
							<td width="185" align="center">날 짜</td>
							<td width="555"><input type="date" size="40" maxlength="50"
								name="reg_date"
								value=<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd"/>>
							</td>
						</tr>

						<tr>
							<td width="185" align="center">내 용</td>
							<td width="555"><textarea name="contents" rows="13"
									cols="40"></textarea></td>
						</tr>
						<tr>
							<td width="185" align="center">첨부파일</td>
							<td align="left" width="555" id="fileIndex">&nbsp;
								<button type="button" class="fileAdd_btn">파일추가</button>
								<br>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center"><input type="submit" value="확인">
								<input type="button" value="취소"
								OnClick="window.location='deptBoardList.do?type=2'"></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
		<jsp:include page="/WEB-INF/view/foot.jsp" flush="false" />
	</div>
</body>
</html>
