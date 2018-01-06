<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>

<title>Yeps!!!</title>
</head>
<%@ include file="../top.jsp"%> 

<div id="manager_container" style="height: 400px; margin: 50px; float: inherit;font-family: cambria;font-weight: bold;font-size: 18;
    margin-left: 300; margin-top: 40;" >
   <div id="manager_header" style="  width: 70%; height: 50px; margin-bottom: 20px;" >
	  <h2>Management Page</h2>
   </div>
   <div id="manager_management_list" style="  width: 60%; height: 300px; margin: 20px;">
	  <table>
	  <tr>
	  <td>
		 <a  class="btn" href="category_list">카테고리 목록</a></td></tr>
		 <tr><td>
		 <a class="btn" href="event_list">이벤트 목록</a></td></tr>
		 <tr><td>
		 <a class="btn" href="eventReview_list">이벤트 리뷰 목록</a></td></tr>
		 <tr><td>
		 <a class="btn" href="event_insert_photo">이벤트 사진 등록</a></td></tr>
		 <tr><td>
		 <a class="btn" href="restaurant_list">레스토랑 목록</a></td></tr>
		 <tr><td>
		 <a class="btn" href="review_list">레스토랑 리뷰 목록</a></td></tr>
		 <tr><td>
		 <a class="btn" href="qna_list">Q & A 목록</a></td></tr>
		 <tr><td>
		 <a class="btn" href="main">메인 페이지</a>&emsp;&emsp;&emsp;</td></tr>
	 </table>
   </div>
</div>
 <%@ include file="../bottom.jsp"%> 