<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	String inputYn = request.getParameter("inputYn"); 
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
	String roadAddrPart2 = request.getParameter("roadAddrPart2"); 
	String zipNo = request.getParameter("zipNo"); 
	String addrDetail = request.getParameter("addrDetail");
%>
</head>
<script language="javascript">
function init(){
	var url = location.href;
	var confmKey = "U01TX0FVVEgyMDE3MTEyMjE5NDIyOTEwNzUwMDg=";
	// resultType항목 추가(2016.10.06)
	var resultType = "4"; // 도로명주소 검색결과 화면 출력유형, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.restForm.confmKey.value = confmKey;
		document.restForm.returnUrl.value = url;
		document.restForm.resultType.value = resultType; // resultType항목 추가(2016.10.06)
		document.restForm.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; // 인터넷망
		document.restForm.submit();
	}else{
		/** API 서비스 제공항목 확대 (2017.02) **/
		opener.jusoCallBack("<%=roadAddrPart1%>","<%=addrDetail%>", "<%=roadAddrPart2%>","<%=zipNo%>");
		window.close();
	}
}
</script>
<body onload="init();">
	<form id="restForm" name="restForm" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/> 
	</form>
</body>
</html>