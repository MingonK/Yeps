<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<html>
<head>
	<title>KAIST Test</title>
	<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<body>
<!-- href="javascript:addrow()" -->
	<div align="center">
		<a id="moveup">[올리기]</a>
		<a id="movedown">[내리기]</a>
<!-- 		<a href="javascript:addrow()">[행추가]</a> -->
		<a href="#" id="addrow">[행추가]</a>
		<a href="javascript:removerow()">[행삭제]</a>
		<a href="javascript:submit()">[저장]</a>
		<form name="register" method="post">
			<table id="my-table" border="1" align="center" width="800" height="100">
				<tr>
					<th>속성명</th>
					<th width="20%">데이터유형</th>
					<th width="10%">사용여부</th>
					<th>설명</th>
				</tr>
				<tbody>
					<tr>
						<td><input type="text" name="property"></td>
						<td>
							<select name="datatype">
								<option value="text" selected>텍스트</option>
								<option value="number">숫자</option>
							<option value="date">날짜</option>
							</select>
						</td>
						<td>
							<select name="uesed_or_not">
								<option value="yes" selected>Y</option>
								<option value="no">N</option>
							</select>
						<td><input type="text" name="description"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	
<script type="text/javascript">
	function submit() {
		if(confirm("전송하시겠습니까?")) {
			alert("성공");
			document.register.action = 'register';
			document.register.submit();
		} else {
			return false;
		}
	}
	
	function addrow() {
		var my_tbody = document.getElementById('my-tbody');
		var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
		row.insertCell(0).innerHTML = '<input type="text" name="property">';
		row.insertCell(1).innerHTML = '<select name="datatype">' + '<option value="text" selected>텍스트</option>' + '<option value="number">숫자</option>' + '<option value="date">날짜</option>' + '</select>';
		row.insertCell(2).innerHTML = '<select name="uesed_or_not">' + '<option value="yes" selected>Y</option>' + '<option value="no">N</option>' + '</select>';
		row.insertCell(3).innerHTML = '<input type="text" name="description">';
	}
	
	function removerow() {
		var my_tbody = document.getElementById('my-tbody');
		var row = my_tbody.deleteRow(); 
	}
	
	function moveUp(el){
		var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
		$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
	}

	function moveDown(el){
		var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
		$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
	}
</script>




<script>
	$('#my-tbody tr').click(function(e) {
		$(this).addClass('check');
		alert($(e.target).attr('class'));
	});
	
	$('#addrow').click(function() {
		$('#my-table > tbody:last').append('<tr>' +
			'<input type="text" name="property">' +
			'<select name="datatype">' + '<option value="text" selected>텍스트</option>' + '<option value="number">숫자</option>' + '<option value="date">날짜</option>' + '</select>' +
			'<select name="uesed_or_not">' + '<option value="yes" selected>Y</option>' + '<option value="no">N</option>' + '</select>' +
			'<input type="text" name="description">' +
			'</tr>'
		)
	});
</script>
	
	
	
	
</body>
</html>






























<!-- <html>
<head>
	<title>Insert title here</title>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.cycle2.js"></script>
	<script>
$('#slideimg').cycle({ 
    fx:     'scrollHorz', //fade, fadeout, none, scrollHorz
    speed:  'fast',
    timeout: 5000, 
    next:   '#next', 
    prev:   '#prev'
 }); 
</script>
	<style>

		.mainslide {
    position: relative;
    width:450px;
}
.ms-arrow {
    opacity: 0.2;
    position: absolute;
    z-index:999;
    top:50%;
    -webkit-transform:translate(0%,-50%);
    -moz-transform:translate(0%,-50%);
    -ms-transform:translate(0%,-50%);
    transform:translate(0%,-50%);
 
    width:30px;
    height:30px;
    /*background-color: white;*/
    transform-origin:center center;
    -webkit-transform-origin:top left;
    cursor: pointer;
}
.ms-arrow.msa-previous {
    left:2.5%;
    -webkit-transform:rotate(-45deg);
    transform:rotate(-45deg);
    border-top:2px solid white;
    border-left:2px solid white;
}
.ms-arrow.msa-next {
    right:4.5%;
    -webkit-transform:rotate(-45deg);
    transform:rotate(-45deg);
    border-bottom:2px solid white;
    border-right:2px solid white;
}
.ms-arrow.msa-previous:hover, .ms-arrow.msa-next:hover {
    opacity: 1;
}

	</style>
	

</head>
<body>

<div class="mainslide">
    <span class="ms-arrow msa-previous" id="prev"></span>
    <span class="ms-arrow msa-next" id="next"></span>

    <div id="slideimg">
        <img src="http://thumb1.shutterstock.com/display_pic_with_logo/78238/221809534/stock-photo-woman-hiker-on-a-top-of-a-mountain-221809534.jpg">
        <img src="http://thumb1.shutterstock.com/display_pic_with_logo/708811/228722404/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg">
        <img src="http://thumb1.shutterstock.com/display_pic_with_logo/62698/225443650/stock-photo-glacier-national-park-montana-225443650.jpg">
    </div>
</div>
<a class="btn" data-popup-open="popup-1" href="#">Open Popup #1</a>
<div class="popup" data-popup="popup-1">
    <div class="popup-inner">
        <h2>Wow! This is Awesome! (Popup #1)</h2>
        <p>Donec in volutpat nisi. In quam lectus, aliquet rhoncus cursus a, congue et arcu. Vestibulum tincidunt neque id nisi pulvinar aliquam. Nulla luctus luctus ipsum at ultricies. Nullam nec velit dui. Nullam sem eros, pulvinar sed pellentesque ac, feugiat et turpis. Donec gravida ipsum cursus massa malesuada tincidunt. Nullam finibus nunc mauris, quis semper neque ultrices in. Ut ac risus eget eros imperdiet posuere nec eu lectus.</p>
        <p><a data-popup-close="popup-1" href="#">Close</a></p>
        <a class="popup-close" data-popup-close="popup-1" href="#">x</a>
    </div>
</div>
</body>
</html> -->