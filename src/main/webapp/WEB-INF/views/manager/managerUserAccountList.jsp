<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
	.trexam {
		cursor: pointer;
	}
	
	tr.trexam:hover {
		background-color: lightblue;
	}
	
	thead {
		background-color: lightgrey
	}

	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	    position: fixed;
	    left:0;
	    right:0;
	    top:0;
	    bottom:0;
	    background: rgba(0,0,0,0.08); /*not in ie */
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
	}

    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:40%;
        left:43%;
    }

    .display-none{ /*감추기*/
        display:none;
    }
</style>
<script>
	$(document).ready(function() {
		// 2019.07.23 성재민
		// 해당 유저의 이메일로 이메일 전송
		// 이후 해당 유저가 로그인시(비회원일 경우 회원가입후)
		// 이메일에 첨부된 링크를 눌러 홈페이지 접근시 해당 유저를 알아 볼수 있게 처리
		$("#privateExamAddBtn").click(function() {
			var selectedIdx = $("#privateExam option:selected").val();
			if (selectedIdx != -1) {
				let list = [];
				var chkBox = $("input[name='takerListCheckBox']:checked");
				console.log(chkBox.parent().parent());
				chkBox.each(function(i) {		
					var tr = chkBox.parent().parent().eq(i);
					console.log(tr.text());
					var td = tr.children();
					let obj = {};
					obj["examId"] = selectedIdx;
					obj["takerEmail"] = td.eq(3).text();
					console.log(td.eq(1).val());
					list.push(obj);
				});
				
				$.ajax({
					contentType : 'application/json',
					type : "POST",
					url : "${pageContext.request.contextPath}/sendEmailPrivateExamTaker.do",
					dataType : "json",
					data : JSON.stringify(list),
					success : function(data) {
						alert('메일 전송 완료');
						location.reload();
					}, beforeSend : function() {
						// 로딩 이미지 보여주기
						$('.wrap-loading').removeClass('display-none');
					}, complete : function() {
						// 로딩 이미지 감추기
						$('.wrap-loading').addClass('display-none');
					}, error : function() {
						alert('메일 전송 중 에러가 발생했습니다.');
					}
					, timeout:1000000
				});
			}
		});

		$("#privateExam").change(function() {
			console.log("선택값");
			var selectedIdx = $("#privateExam option:selected").val();
			console.log("선택값" + selectedIdx);
			
			if (selectedIdx != -1) {
				$("#privateExamAddBtn").prop("disabled", false);
			} else {
				$("#privateExamAddBtn").prop("disabled", true);
			}
		});
		
		$("#takerDeleteBtn").click(function() {
			var chkBox = $("input[name='takerListCheckBox']:checked");
			let takerList = [];
			chkBox.each(function(i) {
				var tr 		= chkBox.parent().parent().eq(i);
				var td 		= tr.children();
				var takerId = td.eq(1).text();
				let obj = {};
				takerList.push(takerId);
			});
			
			console.log(takerList);
			
			$.ajax({
				contentType : 'application/json',
				type : "POST",
				url : "${pageContext.request.contextPath}/managerDeleteTakerList.do",
				dataType : "json",
				data : JSON.stringify(takerList),
				success : function(data) {
					alert('선택한 응시자의 삭제가 완료 되었습니다.');
					location.reload();
				}, error : function() {
					alert('응시자 삭제중 에러가 발생했습니다.');
				}
			});
		});
	});

	function fileCheck() {
		var file = $("#fileInput").val();
		if (file == "" || file == null) {
			alert("파일을 선택해주세요.");
			return false;
		} else if (!checkFileType(file)) {
			alert("엑셀 파일만 업로드 가능합니다.");
			return false;
		}

		if (confirm("업로드 하시겠습니까?")) {
			$("#formUpload").submit();
		}
	}

	function checkFileType(filePath) {
		var fileFormat = filePath.split(".");
		if (fileFormat.indexOf("xlsx") > -1) {
			return true;
		} else {
			return false;
		}
	}

	// 2019.07.23 성재민
	// 체크박스가 체크가 되면 드랍 다운 박스 활성화.
	function takerListCheckBoxOnclick() {
		var check = false;
		$("[name='takerListCheckBox']:checked").each(function(i, checkbox) {
			check = true;
			$("#privateExam").prop("disabled", false);

			var selectedIdx = $("#privateExam option:selected").val();
			if (selectedIdx != -1) {
				$("#privateExamAddBtn").prop("disabled", false);
			}
		});

		if (check == false) {
			$("#privateExam").prop("disabled", true);
			$("#privateExamAddBtn").prop("disabled", true);
		}
	}
</script>

<h4 class="mx-auto pb-2">응시자 계정관리</h4>
<script>
	function goList(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
<hr />

<form name="searchFrm" class="form-inline" style="padding-top: 13px;">
	<label>정렬기준</label> <input type="hidden" name="page" value="1">
	<select name="sort" class="form-control">
		<option value="TAKER_ID">응시자ID
		<option value="TAKER_NAME">이름
	</select> &nbsp;&nbsp; <label>검색조건</label>
	<my:takerListSelect items="${takerMap }" />
	&nbsp;&nbsp; <input type="text" name="searchKeyword"
		class="form-control" value="${CandidateVO.searchKeyword }">
	<button class="btn btn-primary">검색</button>

</form>

<script>
	searchFrm.sort.value = "${CandidateVO.sort}" == "" ? searchFrm.sort.options[0].value
			: "${CandidateVO.sort}";
	searchFrm.searchTaker.value = "${CandidateVO.searchTaker}" == "" ? searchFrm.searchTaker.options[0].value
			: "${CandidateVO.searchTaker}";
</script>
<div class="container">
	<div class="btnGroup">
		<form
			action="${pageContext.request.contextPath}/managerExcelUpload.do"
			id="formUpload" name="formUpload" method="post"
			enctype="multipart/form-data">
			<input type="file" id="fileInput" class="form-control-file"
				name="fileInput" value="파일검색" accept=".xlsx"> <input
				type="button" onclick="fileCheck()" class="btn btn-info"
				value="엑셀응시자 추가" />
		</form>
		<button type="button" class="btn btn-primary m-3 p-3"
				onclick="location.href='managerUserInsert.do'">단일응시자 추가</button>
	</div>
	<%-- <form action="${pageContext.request.contextPath}/managerUserDelete.do"> --%>
		<button id="takerDeleteBtn" class="btn btn-warning">응시자 삭제</button>
		<br>
		<br>
		<table border="1" align="center" class="table">
			<tr>
				<th><label>선택</label></th>
				<th><label>응시자ID</label></th>
				<th><label>이름</label></th>
				<th><label>E-Mail</label></th>
			</tr>
			<c:forEach items="${result.takerList }" var="CandidateVO">
				<tr class="trexam">
					<!-- 2019.07.23 성재민 -->
					<!-- 체크박스 이름 변경 -->
					<td>
						<input type="checkbox"
							name="takerListCheckBox" align="center"
							value="${CandidateVO.takerId }"
							onclick="takerListCheckBoxOnclick()">
					</td>
					<td>
						${CandidateVO.takerId }
					</td>
					<td>
						<a href="managerUserAccountEdit.do/${CandidateVO.takerId }">${CandidateVO.takerName }</a>
					</td>
					<td>
						${CandidateVO.takerEmail }
					</td>
				</tr>
			</c:forEach>
		</table>
	<!-- </form> -->
	<br> 
	<select id="privateExam" disabled="disabled">
		<option value="-1" selected="selected">선택하세요.</option>
		<c:forEach items="${privateExamList}" var="privateExam">
			<option value="${privateExam.examId}">${privateExam.companyName}
				- ${privateExam.examName}</option>
		</c:forEach>
	</select> <br>
	<button id="privateExamAddBtn" disabled="disabled">
		체크한 응시자 선택된 비공개 시험<br> 응시자로 추가하기
	</button>
	<br>
	<hr />
	<my:paging jsFunc="goList" paging="${result.paging }" />
</div>

<!-- 2019.08.05 성재민 -->
<!-- 로딩 화면 추가 -->
<div class="wrap-loading display-none">
    <div><img src="${pageContext.request.contextPath}/image/loadingImage.gif" /></div>
</div>   

