<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var isInit = false;
		// 2019.07.05 성재민
		// 페이지가 시작 하면 값들을 초기화 한다.
		$("#mainCategory option").remove();
		$("#middleCategory option").remove();
		$("#smallCategory option").remove();
		
		var optionBasicMiddle = $("<option value=-1>" + "대분류" + "</option>");
		$("#mainCategory").append(optionBasicMiddle);
		
		// 2019.07.05 성재민
		// 중/소 분류의 분류명 설정
		var optionBasicMiddle = $("<option value=-1>" + "중분류" + "</option>");
		$("#middleCategory").append(optionBasicMiddle);
		
		var optionBasicSmall = $("<option value=-1>" + "소분류" + "</option>");
		$("#smallCategory").append(optionBasicSmall);
		
		// 2019.07.05 성재민
		// 대분류의 값을 채운다.
		$.ajax({
			type:"POST",
			dataType: "json",
			url:"${pageContext.request.contextPath }/getAllCategoryMainList.do",
			success : function(data) {
				// 2019.07.05 성재민
				// db에서 읽어온 값으로 대분류 설정
				for(var i = 0; i < data.length; ++i){
					var optionMain = $("<option value=" + data[i].categoryMainId + ">" + data[i].categoryMainName + "</option>");
					$("#mainCategory").append(optionMain);
				}
				// 2019.07.07 성재민
				// 메인 카테고리 값을 전달받은 값으로 지정하고 체인지 트리거를 발동하여 
				// 중분류 의 셀렉트 옵션 값을 채운다.
				var mainId = "${updateTargetCategory.categoryMainId}";		
				$("#mainCategory").val(mainId).trigger("change");
			}, error : function() {
				alert('에러발생');
			}
		});
		
		// 2019.07.04 성재민
		// 대분류가 변경이 되면 중, 소분류는 일단 값을 다 지우로 기본값을 채움
		$("#mainCategory").change(function() {
			$("#middleCategory option").remove();
			var optionBasicMiddle = $("<option value=-1>" + "중분류" + "</option>");
			$("#middleCategory").append(optionBasicMiddle);
			
			$("#smallCategory option").remove();
			var optionBasicSmall = $("< value=-1>" + "소분류" + "</option>");
			$("#smallCategory").append(optionBasicSmall);
			
			// 2019.07.05 성재민
			// 대분류에서 선택된 값을 가져와서 selectedIdx 에 넣음
			var selectedIdx = $("#mainCategory option:selected").val();
			
			$.ajax({
				type: "POST",
				dataType: "json",
				url:"${pageContext.request.contextPath }/getAllCategoryMiddleList.do/" + selectedIdx,
				success : function(data) {
					// 2019.07.05 성재민
					// db에서 읽어온 값으로 중분류 설정
					for(var i = 0; i < data.length; ++i){
						var optionMain = $("<option value=" + data[i].categoryMiddleId + ">" + data[i].categoryMiddleName + "</option>");
						$("#middleCategory").append(optionMain);
					}
					
					// 2019.07.07 성재민
					// 중분류 값을 전달받은 값으로 지정하고 체인지 트리거를 발동하여 
					// 소분류 의 셀렉트 옵션 값을 채운다.
					// 처음에 한번만 시행하도록 isInit 변수값 지정
					if(isInit == false){
						var middleId = "${updateTargetCategory.categoryMiddleId}";		
						$("#middleCategory").val(middleId).trigger("change");
					} else{
						$("#middleCategory").val(-1).trigger("change");
					}

				}, error : function() {
					alert('에러발생');
				}
			});
		});
		
		// 2019.07.05 성재민
		// 중분류가 변경이 되면 소분류 값을 다 지우고 기본값을 채운 후 중분류에 해당하는 소분류의 값을 채움
		$("#middleCategory").change(function() {
			$("#smallCategory option").remove();
			var optionBasicSmall = $("<option value=-1>" + "소분류" + "</option>");
			$("#smallCategory").append(optionBasicSmall);
			
			// 2019.07.05 성재민
			// 중분류에서 선택된 값을 가져와서 selectedIdx 에 넣음
			var selectedIdx = $("#middleCategory option:selected").val();
			
			$.ajax({
				type: "POST",
				dataType: "json",
				url:"${pageContext.request.contextPath }/getAllCategorySmallList.do/" + selectedIdx,
				success : function(data) {
					// 2019.07.05 성재민
					// db에서 읽어온 값으로 소분류 설정
					for(var i = 0; i < data.length; ++i){
						var optionMain = $("<option value=" + data[i].categorySmallId + ">" + data[i].categorySmallName + "</option>");
						$("#smallCategory").append(optionMain);
					}
					
					//$("#smallCategory option").val("${updateTargetCategory.categorySamllId}").attr("selected", "selected");
					// 2019.07.07 성재민
					// 소분류 값을 전달받은 값으로 지정한다.
					
					if(isInit == false){
						var samllId = "${updateTargetCategory.categorySamllId}";	
						$("#smallCategory").val(samllId).trigger("change");
						
						isInit = true;
					} else{
						$("#smallCategory").val(-1).trigger("change");
					}
					
				}, error : function() {
					alert('에러발생');
				}
			});
		});
		
		$("#submitBtn").click(function() {
			var categoryName = $("#categoryName").val();
			if(categoryName == '' || categoryName == null){
				alert("카테고리 이름을 입력해 주세요.");
				return false;
			}
			
			var selectedIdx = $("#mainCategory option:selected").val();
			if(selectedIdx == -1){
				alert("대분류를 입력해 주세요.");
				return false;
			}
			
			selectedIdx = $("#middleCategory option:selected").val();
			if(selectedIdx == -1){
				alert("중분류를 입력해 주세요.");
				return false;
			}
			
			selectedIdx = $("#smallCategory option:selected").val();
			if(selectedIdx == -1){
				alert("소분류를 입력해 주세요.");
				return false;
			}
			
			$("#updateCategoryForm").submit();
		});
		
		$("#backPageBtn").click(function() {
			location.href = "${pageContext.request.contextPath }/categoryMain.do/";
		});
	});
</script>
</head>
<body>
	<h3>카테고리 수정</h3>
	<br>
	<form action="${pageContext.request.contextPath }/updateCategory.do" method="post" id="updateCategoryForm">
		<input type="hidden" name="categoryId" value="${updateTargetCategory.categoryId}">
		카테고리 이름 : <input type="text" name="categoryName" id="categoryName" value="${updateTargetCategory.categoryName}">
		<br><br>
		대분류
		<select name="categoryMainId" id="mainCategory">
		</select>
		중분류
		<select name="categoryMiddleId" id="middleCategory">
		</select>
		소분류
		<select name="categorySamllId" id="smallCategory">
		</select>
		<br><br>
		<input type="button" id="submitBtn" value="카테고리 수정">
		<input type="button" id="backPageBtn" value="카테고리 메인으로">
	</form>
</body>
</html>