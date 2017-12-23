<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/restStyle.css?ver=1"/>"/>
</head>
<%@include file="../top.jsp" %>
<div class="restInsert-main" style="width: auto;padding: 0;margin: 0;">
		<div class="restInsert-content-container" style="padding:15px 15px 36px 15px; width: 960px;height:100%;margin: 0 auto; display: table;">
			<div class="restInsert-container" style="width:960px;height:100%;display:block;">
				<div class="restInsert-layout-full" style="width:990px;height:100%;margin:0px -15px;display:block;">

						<h2 style="word-wrap: break-word !important;word-break: break-word !important;overflow-wrap: break-word !important; font-weight: bold;margin-bottom: 6px;font-size: 26px;line-height: 1.28571em;color: #d32323;">메뉴 등록</h2>
						<label class="restInsert-label-bold">메뉴 선택</label>
						<input class="restInsert-input" id="" name="first" placeholder="클릭!!" type="text" value="" style="width:130px;" autocomplete="off" onclick="firstMenu">	
					
					</div>
				</div>
			</div>
		</div>
		
<script>
function firstMenu(){
	var option=createElements
}
</script>
</body>
</html>
<%@include file="../bottom.jsp" %>