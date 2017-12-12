<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../top.jsp" %>
<script type="text/javascript">
var week = new Array("mon","tue","wed","thu","fri","sat","sun")
var day = new Array("월요일","화요일","수요일","목요일","금요일","토요일","일요일");
// 한글 입력 방지
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
function changeTime(){
	var s = document.getElementById("hour-start")
	var start = s.selectedIndex;
	var e = document.getElementById("hour-end")
	var j = 0
	var i = 0
	var a=parseInt(s.options[s.selectedIndex].value);
	var b=parseInt(e.options[e.selectedIndex].value);
	var c=e.options[e.selectedIndex].value
	
	if(a>=b){
		e.options.length = 0
		for (i = start; i < s.length - 1; i++) {
			var option = document.createElement('option');
			option.text = s.options[i+1].text;
			option.value = s.options[i+1].value;
			e.add(option);
		}
		for (var i = 1; i < 16; i++) {
			var option = document.createElement('option');
			option.text = s.options[j++].text + "(다음날)"
			option.value = 23.5 + (0.5 * i)
			e.add(option);
		}
	}else{
		e.options.length = 0
		for (i = start; i < s.length - 1; i++) {
			var option = document.createElement('option');
			option.text = s.options[i+1].text;
			option.value = s.options[i+1].value;
			e.add(option);
		}
		for (var i = 1; i < 16; i++) {
			var option = document.createElement('option');
			option.text = s.options[j++].text + "(다음날)"
			option.value = 23.5 + (0.5 * i)
			e.add(option);
		}
		for(var i=0;i<e.length;i++){
			if(c==e.options[i].value){
				document.getElementById("hour-end").options[i].selected = 'selected';
				break;
			}
		}
	}
}

function add() {
	var div = document.createElement("DIV");
	var span = document.createElement("SPAN");
	var d = document.getElementById("day")
	var day2 = d.options[d.selectedIndex].value;
	var s = document.getElementById("hour-start")
	var start = s.options[s.selectedIndex].text;
	var e = document.getElementById("hour-end")
	var end = e.options[e.selectedIndex].text;
	var parent = document.getElementById("output");
	if(parent.childNodes.length>7){
		return false;
	}

	for(var i=1;i<parent.childNodes.length;i++){
		if(parent.childNodes[i].id==week[day2]){
			return false;
		}
	}
	
	if (day2 > 5) {
		document.getElementById("day").value = -1
	}
	document.getElementById("day").value = d.options[d.selectedIndex + 1].value;
	
	div.setAttribute("id", week[day2]);
	
	document.getElementById("output").appendChild(div).innerHTML = "<span>"+day[day2]+"    "+"</span>"+
	"<span>"+start+"</span>"+"<span>"+"&nbsp-&nbsp"+"</span>"+"<span>"+end+"</span>"+
	"<a href='#' onclick='remove("+day2+")'>삭제</a>" +
	"<input type='hidden' name='"+week[day2]+"' value='"+start+" - "+end+"'/>";
	

}

function remove(obj) {
	var parent = document.getElementById("output");
	var child = document.getElementById(week[obj]);
	parent.removeChild(child);
}

function goPopup() {
	var pop = window.open("jusoPopup", "도로명 주소","width=570,height=420, scrollbars=yes, resizable=yes");
}

function jusoCallBack(roadAddrPart1, addrDetail, roadAddrPart2, zipNo) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다
	document.restForm.roadAddrPart1.value = roadAddrPart1;
	document.restForm.roadAddrPart2.value = roadAddrPart2;
	document.restForm.addrDetail.value = addrDetail;
	document.restForm.zipNo.value = zipNo;
}

function test() {
	var txt = "";
	var style = document.getElementsByName("reststyle");
	for (var i = 0; i < style.length; i++) {
		if (style[i].checked) {
			txt += style[i].value + " ";
		}
	}
	document.getElementById("reststyle").value = txt;

	txt = "";
	var alcohol = document.getElementsByName("alcohol");
	for (var i = 0; i < alcohol.length; i++) {
		if (alcohol[i].checked) {
			txt += alcohol[i].value + " ";
		}
	}
	document.getElementById("alcohol").value = txt;
	
	alert("실행")
	return true;
}
</script>
<html>
<head>
	<title>레스토랑 등록</title>
</head>
<body>
	<div align="center">
	<form name="restForm" id="restForm" enctype="multipart/form-data" method="post" action="restaurant_insert" onsubmit="return test();">
		<table border="1" style="width:600px">
		<tr>
			<td>레스토랑 이름</td>		
			<td>
				<input type="text" name="rname" value="지원의 집">
			</td>
		<tr>
			<td>레스토랑 사진</td>
			<td>
				<input type="file" name="filename">
			</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>
				<input type="hidden" id="confmKey" name="confmKey" value=""  >
				<input type="text" id="zipno" name="zipno" readonly style="width:100px" value="21100" >
				<input type="button"  value="주소검색" onclick="goPopup();" >
			</td>
		</tr>
		<tr>
			<th><label>도로명주소</label></th>
			<td><input type="text" id="roadAddrPart1" style="width:85%" name="roadAddrPart1" value="인천광역시 계양구 봉오대로463번길 12"></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>
				<input type="text" id="addrDetail" style="width:40%" value="1동 502호" name="addrDetail">
				<input type="text" id="roadAddrPart2"  style="width:40%" value="(효성동, 하나아파트)" name="roadAddrPart2">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>		
			<td>
				<select name="raddress">
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
					<option value="042">042</option>
					<option value="043">043</option>
					<option value="044">044</option>
					<option value="051">051</option>
					<option value="052">052</option>
					<option value="053">053</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="061">061</option>
					<option value="062">062</option>
					<option value="063">063</option>
					<option value="064">064</option>
				</select>
				<input type="text" name="hp2" value="297" maxlength="4" size="2" style="ime-mode:disabled" onkeypress="txtOnlyNum(event)" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')">
				-<input type="text" name="hp3" value="7765" maxlength="4" size="2" style="ime-mode:disabled" onkeypress="txtOnlyNum(event)" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')">
			</td>
		</tr>
		<tr>
			<td>음식 종류</td>		
			<td>
				<input type="text" name="foodstyle" value="한식,중식"> <input type="button" value="선택" onclick="goPopup2()">
			</td>
		</tr>
		<tr>
			<td>디스플레이</td>
			<td>
				<div id="output">
					
				</div>
			</td>
		</tr>
		<tr>
			<td>시간</td>		
			<td>
				<select id="day">
					<option value="0">월요일</option>
					<option value="1">화요일</option>
					<option value="2">수요일</option>
					<option value="3">목요일</option>
					<option value="4">금요일</option>
					<option value="5">토요일</option>
					<option value="6">일요일</option>
				</select>
				<select id="hour-start" onchange="changeTime()">
					<option value="0.0">오전 12:00</option>
					<option value="0.5">오전 12:30</option>
					<option value="1.0">오전 1:00</option>
					<option value="1.5">오전 1:30</option>
					<option value="2.0">오전 2:00</option>
					<option value="2.5">오전 2:30</option>
					<option value="3.0">오전 3:00</option>
					<option value="3.5">오전 3:30</option>
					<option value="4.0">오전 4:00</option>
					<option value="4.5">오전 4:30</option>
					<option value="5.0">오전 5:00</option>
					<option value="5.5">오전 5:30</option>
					<option value="6.0">오전 6:00</option>
					<option value="6.5">오전 6:30</option>
					<option value="7.0">오전 7:00</option>
					<option value="7.5">오전 7:30</option>
					<option value="8.0">오전 8:00</option>
					<option value="8.5">오전 8:30</option>
					<option value="9.0">오전 9:00</option>
					<option value="9.5">오전 9:30</option>
					<option value="10.0">오전 10:00</option>
					<option value="10.5">오전 10:30</option>
					<option value="11.0">오전 11:00</option>
					<option value="11.5">오전 11:30</option>
					<option value="12.0">오후 12:00</option>
					<option value="12.5">오후 12:30</option>
					<option value="13.0">오후 1:00</option>
					<option value="13.5">오후 1:30</option>
					<option value="14.0">오후 2:00</option>
					<option value="14.5">오후 2:30</option>
					<option value="15.0">오후 3:00</option>
					<option value="15.5">오후 3:30</option>
					<option value="16.0">오후 4:00</option>
					<option value="16.5">오후 4:30</option>
					<option value="17.0">오후 5:00</option>
					<option value="17.5">오후 5:30</option>
					<option value="18.0">오후 6:00</option>
					<option value="18.5">오후 6:30</option>
					<option value="19.0">오후 7:00</option>
					<option value="19.5">오후 7:30</option>
					<option value="20.0">오후 8:00</option>
					<option value="20.5">오후 8:30</option>
					<option value="21.0">오후 9:00</option>
					<option value="21.5">오후 9:30</option>
					<option value="22.0">오후 10:00</option>
					<option value="22.5">오후 10:30</option>
					<option value="23.0">오후 11:00</option>
					<option value="23.5">오후 11:30</option>
				</select> 
				<select id="hour-end">
					<option value="0.5">오전 12:30</option>
					<option value="1.0">오전 1:00</option>
					<option value="1.5">오전 1:30</option>
					<option value="2.0">오전 2:00</option>
					<option value="2.5">오전 2:30</option>
					<option value="3.0">오전 3:00</option>
					<option value="3.5">오전 3:30</option>
					<option value="4.0">오전 4:00</option>
					<option value="4.5">오전 4:30</option>
					<option value="5.0">오전 5:00</option>
					<option value="5.5">오전 5:30</option>
					<option value="6.0">오전 6:00</option>
					<option value="6.5">오전 6:30</option>
					<option value="7.0">오전 7:00</option>
					<option value="7.5">오전 7:30</option>
					<option value="8.0">오전 8:00</option>
					<option value="8.5">오전 8:30</option>
					<option value="9.0">오전 9:00</option>
					<option value="9.5">오전 9:30</option>
					<option value="10.0">오전 10:00</option>
					<option value="10.5">오전 10:30</option>
					<option value="11.0">오전 11:00</option>
					<option value="11.5">오전 11:30</option>
					<option value="12.0">오후 12:00</option>
					<option value="12.5">오후 12:30</option>
					<option value="13.0">오후 1:00</option>
					<option value="13.5">오후 1:30</option>
					<option value="14.0">오후 2:00</option>
					<option value="14.5">오후 2:30</option>
					<option value="15.0">오후 3:00</option>
					<option value="15.5">오후 3:30</option>
					<option value="16.0">오후 4:00</option>
					<option value="16.5">오후 4:30</option>
					<option value="17.0">오후 5:00</option>
					<option value="17.5">오후 5:30</option>
					<option value="18.0">오후 6:00</option>
					<option value="18.5">오후 6:30</option>
					<option value="19.0">오후 7:00</option>
					<option value="19.5">오후 7:30</option>
					<option value="20.0">오후 8:00</option>
					<option value="20.5">오후 8:30</option>
					<option value="21.0">오후 9:00</option>
					<option value="21.5">오후 9:30</option>
					<option value="22.0">오후 10:00</option>
					<option value="22.5">오후 10:30</option>
					<option value="23.0">오후 11:00</option>
					<option value="23.5">오후 11:30</option>
					<option value="24.0">오전 12:00(다음날)</option>
					<option value="24.5">오전 12:30(다음날)</option>
					<option value="25.0">오전 1:00(다음날)</option>
					<option value="25.5">오전 1:30(다음날)</option>
					<option value="26.0">오전 2:00(다음날)</option>
					<option value="26.5">오전 2:30(다음날)</option>
					<option value="27.0">오전 3:00(다음날)</option>
					<option value="27.5">오전 3:30(다음날)</option>
					<option value="28.0">오전 4:00(다음날)</option>
					<option value="28.5">오전 4:30(다음날)</option>
					<option value="29.0">오전 5:00(다음날)</option>
					<option value="29.5">오전 5:30(다음날)</option>
					<option value="30.0">오전 6:00(다음날)</option>
					<option value="30.5">오전 6:30(다음날)</option>
					<option value="31.0">오전 7:00(다음날)</option> 
				</select>
				<input type="button" value="add" onclick="add()">
			</td>
		<tr>
			<td>좌석</td>		
			<td>
				<input type="checkbox" id="reststyle" name="reststyle" value="좌석" checked>
				<label for="reststyle">좌석</label>
				<input type="checkbox" id="reststyle2" name="reststyle" value="테이블석" checked>
				<label for="reststyle2">테이블석</label>
				<input type="checkbox" id="reststyle3" name="reststyle" value="야외석">
				<label for="reststyle3">야외석</label>
			</td>
		</tr>
		<tr>
			<td>예약</td>		
			<td>
				<input type="radio" id="reserv" name="reserv" value="가능" checked>
				<label for="reserv">가능</label>
				<input type="radio" id="reserv2" name="reserv" value="불가능">
				<label for="reserv2">불가능</label>
			</td>
		</tr>
		<tr>
			<td>배달</td>		
			<td>
				<input type="radio" id="delivery" name="delivery" value="가능" checked>
				<label for="delivery">가능</label>
				<input type="radio" id="delivery2" name="delivery" value="불가능">
				<label for="delivery2">불가능</label>
			</td>
		</tr>
		<tr>
			<td>TAKEOUT</td>		
			<td>
				<input type="radio" id="takeout" name="takeout" value="가능" checked>
				<label for="takeout">가능</label>
				<input type="radio" id="takeout2" name="takeout" value="불가능">
				<label for="takeout2">불가능</label>
			</td>
		</tr>
		<tr>
			<td>주차장</td>		
			<td>
				<input type="radio" id="parking" name="parking" value="있음" checked>
				<label for="parking">있음</label>
				<input type="radio" id="parking2" name="parking" value="없음">
				<label for="parking2">없음</label>
			</td>
		</tr>
		<tr>
			<td>단체예약</td>		
			<td>
				<input type="radio" id="groupreserv" name="groupreserv" value="가능" checked>
				<label for="groupreserv">가능</label>
				<input type="radio" id="groupreserv2" name="groupreserv" value="불가능">
				<label for="groupreserv2">불가능</label>
			</td>
		</tr>
		<tr>
			<td>소음</td>		
			<td>
				<select name="noise" id="noise">
					<option value="조용함">조용함</option>
					<option value="평균" selected>평균</option>
					<option value="시끄러움">시끄러움</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>키드존</td>		
			<td>
				<input type="radio" id="kidzone" name="kidzone" value="있음" checked>
				<label for="kidzone">있음</label>
				<input type="radio" id="kidzone2" name="kidzone" value="없음">
				<label for="kidzone2">없음</label>
			</td>
		</tr>
		<tr>
			<td>주류</td>		
			<td>
				<input type="checkbox" id="alcohol" name="alcohol" value="소주" checked>
				<label for="alcohol">소주</label>
				<input type="checkbox" id="alcohol2" name="alcohol" value="맥주">
				<label for="alcohol2">맥주</label>
				<input type="checkbox" id="alcohol3" name="alcohol" value="막걸리" checked>
				<label for="alcohol3">막걸리</label>
				<input type="checkbox" id="alcohol4" name="alcohol" value="양주">
				<label for="alcohol4">양주</label>
			</td>
		</tr>
		<tr>
			<td>대기실</td>		
			<td>
				<input type="radio" id="waiting" name="waiting" value="있음" checked>
				<label for="waiting">있음</label>
				<input type="radio" id="waiting2" name="waiting" value="없음">
				<label for="waiting2">없음</label>
			</td>
		</tr>
		<tr>
			<td>WIFI</td>		
			<td>
				<input type="radio" id="wifi" name="wifi" value="있음" checked>
				<label for="wifi">있음</label>
				<input type="radio" id="wifi2" name="wifi" value="없음">
				<label for="wifi2">없음</label>
			</td>
		</tr>
		<tr>
			<td>화장실</td>		
			<td>
				<input type="radio" id="toilet" name="toilet" value="있음" checked>
				<label for="toilet">있음</label>
				<input type="radio" id="toilet2" name="toilet" value="없음">
				<label for="toilet2">없음</label>
			</td>
		</tr>
		<tr>
			<td>테이블 수</td>		
			<td>
				<input type="text" name="tablecount" value="12" size="2" maxlength="2">
				<select name="standard">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select>인 기준
			</td>
		</tr>
		<tr>
			<td>바쁜시간</td>		
			<td>
				<input type="text" name="busytime" value="월요일,금요일">
			</td>
		</tr>
		<tr>
		</tr>	
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</td>
		</tr>
		</table>
		</form>
	</div>
</body>
</html>
<%@include file="../bottom.jsp" %>