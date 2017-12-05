<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>mvc멤버</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
 <body>
	<div align="center">
		<hr color="green" width="300">
		<h2>회 원 관 리</h2>
		
		<form name="f" method="post">
		<select name="search">
			<option value="email">이메일</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="searchString" class="box">
		<input type="submit" value="검색">
		</form>
		<hr color="green" width="300">
		<table width="100%" class="outline">
			<tr>
				<th class="m3">회원번호</th>
				<th class="m3">이름</th>
				<th class="m3">이메일</th>
				<th class="m3">생년월일</th>
				<th class="m3">가입입</th>
				<th class="m3">리뷰갯수</th>
				<th class="m3">사진갯수</th>
				<th class="m3">마스터</th>
				<th class="m3">관리자</th>
				<th class="m3">카테고리관리권한</th>
				<th class="m3">이벤트관리권한</th>
				<th class="m3">유저관리권한</th>
				<th class="m3">가게관리권한</th>
				<th class="m3">리뷰관리권한</th>
				<th class="m3">삭제</th>
			</tr>
	<c:choose>
		<c:when test="${listMember==null}">
			<tr>
				<td colspan="15">등록된 회원이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${listMember}">
				<tr>
				<td align="center">${dto.mnum}</td>
				<td align="center">${dto.name}</td>
				<td align="center">${dto.email}</td>
				<td align="center">${dto.ssn1}</td>
				<td align="center">${dto.joindate}</td>
				<td align="center">${dto.reviewcount}</td>
				<td align="center">${dto.imagecount}</td>
				<td align="center">${dto.ismaster}</td>
				<td align="center">${dto.ismanager}</td>
				<td align="center">${dto.controlcate}</td>
				<td align="center">${dto.controlevent}</td>
				<td align="center">${dto.controlmember}</td>
				<td align="center">${dto.controlstore}</td>
				<td align="center">${dto.controlreview}</td>
				<c:if test="${dto.ismaster!='y'}">
					<c:if test="${dto.ismanager!='y'}">
						<td><a href="member_delete?num=${dto.mnum}">회원삭제</a></td>
					</c:if>
				</c:if>
			</tr>	
			</c:forEach>
		</c:otherwise>
	</c:choose>	
		</table>
		<br>
		<a href="member_index">메인페이지로 이동</a>
	</div>
</body>
</html>