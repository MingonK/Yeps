<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <script src="<c:url value="/resources/jquery-3.2.1.min.js" />"></script> --%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<script type="text/javascript">
function chkformat(obj) {
    if (/[\d]/.test(String.fromCharCode(event.keyCode))) {
    	var time=obj.value
    	if(time.substring(0,1)>1){
    		alert("1이하만 입력해주세요")
    		obj.value=""
			return false;    		
    	}
    	if(time.substring(0,2)>12){
    		alert("12이하로 입력해주세요")
    		obj.value=""
    		return false;
    	}
    	
        if (obj.value.length==2)
        	obj.value+=":";
        return true;
        if(time[1]>60){
        	alert("59까지입니다.");
			obj.value="";
        	return false
        }
    } else return false;
}
/* function test(obj){
	var str = obj.value.includes(":");
	if(str){
		alter("참")
	}else{
		alter("거짓")
	}
} */
function test(){
	var x = document.getElementById("ampm").value;
	var i=0
	if(x=="am"){
		for(i=0;i<12;i++){
			document.form.ampm[j++]=new Option(i,j);
		}		
	}else{
		alert("PM")
		return false
	}
}
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("restaurant_jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadAddrPart1,addrDetail,roadAddrPart2,zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
</script>

<html>
<head>
	<title>레스토랑 등록</title>
</head>
<body>
	<div align="center" >
	<form name="f" action="result">
		<table border="1" width="600">
		<tr>
			<td>레스토랑 이름</td>		
			<td>
				<input type="text" name="name">
			</td>
		</tr>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th><label>도로명주소</label></th>
					<td><input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
						<td>
							<input type="text" id="addrDetail" name="addrDetail" style="width:40%" value="">
							<input type="text" id="roadAddrPart2" name="roadAddrPart2" style="width:40%" value="">
						</td>
				</tr>
		<tr>
			<td>전화번호</td>		
			<td>
				<input type="text" name="raddress" maxlength="3" size="3">-
				<input type="text" name="hp2" maxlength="4" size="4">-
				<input type="text" name="hp3" maxlength="4" size="4">
			</td>
		</tr>
		<tr>
			<td>음식 종류</td>		
			<td>
				<input type="text" name="foodstyle">
			</td>
		</tr>
		<tr>
			<td>월요일</td>		
			<td>
					<select name="ampm" id="ampm">
						<option value="1">AM</option>
						<option value="2">PM</option>
					</select>
					<select>
						<c:forEach var="i" begin="0" end="11">
							<c:forEach var="j" begin="0" end="30" step="30">
								<option value="<fmt:formatNumber value='${i}' pattern='00'/>:
								<fmt:formatNumber value="${j}" pattern="00"/>">
								<fmt:formatNumber value="${i}" pattern="00"/>:
								<fmt:formatNumber value="${j}" pattern="00"/>
								</option>
							</c:forEach>
						</c:forEach>
						
					</select>
				<!-- <input type="text" name="mon" size="4" onclick="this.value=''" maxlength="5" onkeypress="return chkformat(this)"> ~ --> 	
					<select>
						<option value="am">AM</option>
						<option value="pm">PM</option>
					</select> 
				<input type="text" name="mon" size="4"  maxlength="5" >
				<input type='button' id="button1" value='버튼1'/>

					<script>
					$("#button1").click(function() {
						alert("버튼1을 누르셨습니다.");
					});
					</script>
			</td>
		</tr>
		<tr>
			<td>화요일</td>		
			<td>
				<input type="text" name="tue">
			</td>
		</tr>
		<tr>
			<td>수요일</td>		
			<td>
				<input type="text" name="wed">
			</td>
		</tr>
		<tr>
			<td>목요일</td>		
			<td>
				<input type="text" name="thr">
			</td>
		</tr>
		<tr>
			<td>금요일</td>		
			<td>
				<input type="text" name="fri">
			</td>
		</tr>
		<tr>
			<td>토요일</td>		
			<td>
				<input type="text" name="sat">
			</td>
		</tr>
		<tr>
			<td>일요일</td>		
			<td>
				<input type="text" name="sun">
			</td>
		</tr>
		<tr>
			<td>좌석</td>		
			<td>
			<div>
				
				<input type="checkbox" name="reststyle" value="reststyle">
				<label>좌식</label>
				<input type="checkbox" name="reststyle" value="reststyle">
				<label>테이블식</label>
				<input type="checkbox" name="reststyle" value="reststyle">
				<label>야외식</label>
			</div>
			</td>
		</tr>
		<tr>
			<td>예약</td>		
			<td>
				<input type="radio" name="reserv">
				<label>가능</label>
				<input type="radio" name="reserv">
				<label>불가능</label>
			</td>
		</tr>
		<tr>
			<td>배달</td>		
			<td>
				<input type="radio" name="delivery">
				<label>가능</label>
				<input type="radio" name="delivery">
				<label>불가능</label>
			</td>
		</tr>
		<tr>
			<td>TAKEOUT</td>		
			<td>
				<input type="radio" name="TAKEOUT">
				<label>가능</label>
				<input type="radio" name="TAKEOUT">
				<label>불가능</label>
			</td>
		</tr>
		<tr>
			<td>단체예약</td>		
			<td>
				<input type="radio" name="groupreserv">
				<label>가능</label>
				<input type="radio" name="groupreserv">
				<label>불가능</label>
			</td>
		</tr>
		<tr>
			<td>소음</td>		
			<td>
				<select>
					<option value="1">조용함</option>
					<option value="2">평균</option>
					<option value="3">시끄러움</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>주류</td>		
			<td>
				<input type="checkbox" name="alcohol">
				<label>소주</label>
				<input type="checkbox" name="alcohol">
				<label>맥주</label>
				<input type="checkbox" name="alcohol">
				<label>막걸리</label>
				<input type="checkbox" name="alcohol">
				<label>양주</label>
			</td>
		</tr>
		<tr>
			<td>대기실</td>		
			<td>
				<input type="radio" name="wating">
				<label>있음</label>
				<input type="radio" name="wating">
				<label>없음</label>
			</td>
		</tr>
		<tr>
			<td>WIFI</td>		
			<td>
				<input type="radio" name="wifi">
				<label>가능</label>
				<input type="radio" name="wifi">
				<label>불가능</label>
			</td>
		</tr>
		<tr>
			<td>화장실</td>		
			<td>
				<input type="radio" name="toilet">
				<label>있음</label>
				<input type="radio" name="toilet">
				<label>없음</label>
			</td>
		</tr>
		<tr>
			<td>테이블 수</td>		
			<td>
				<input type="text" name="tablecount">
			</td>
		</tr>
		<tr>
			<td>바쁜시간</td>		
			<td>
				<input type="text" name="busytime">
			</td>
		</tr>
		<tr>
		</tr>		
		<tr>
			<td></td>
		</tr>
		</table>
		</form>
	</div>
</body>
</html>