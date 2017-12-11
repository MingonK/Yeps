<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="../top.jsp" %>
<html>
<head>
	<title>QnA</title>
</head>
<body>
<div align="center">
	<b>글 목 록</b>
	<table border="0" width="800">
		<tr bgcolor="yellow">
			<td align="right"><a href="qna_write">글쓰기</a></td>
		</tr>
	</table>
	<table border="1" width="800">
		<tr bgcolor="green">
			<th width="5%">번호</th>
			<th width="40%">제목</th>
			<th width="10%">답변</th>
			<th width="25%">작성자</th>
			<th width="10%">작성일</th>
			<th width="10%">조회수</th>
		</tr>
	<c:if test="${empty listQnA}">
		<tr>
			<td colspan="5">등록된 QnA가 없습니다.</td>
		</tr>	
	</c:if> 	
	<c:forEach var="dto" items="${listQnA}">
		<tr>
			<td>
				<c:set var="num" value="${num-1}"/>
				<c:out value="${num}"/>
			</td>
			<td>
			<c:choose>
				<c:when test="${dto.secret=='n'}">
						<a href="qna_content?qnum=${dto.qnum}">
							${dto.title}
						</a>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${sessionScope.memberNum == dto.mnum || sessionScope.memberEmail=='YEPSMaster' || sessionScope.memberEmail=='YEPSManager'}">
							<a href="qna_content?qnum=${dto.qnum}">
								${dto.title}
							</a>
					</c:when>
					<c:otherwise>
						<center>
							비밀글입니다.
						</center>
					</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			</td>
			<td align="center">
				<c:choose>
					<c:when test="${dto.answered == 'n'}">
						미답변
					</c:when>
					<c:otherwise>
						답변완료
					</c:otherwise>
				</c:choose>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.regdate}</td>
			<td>${dto.readcount}</td>
		</tr>		
	</c:forEach>
	</table>
	
	<div align= "center">
	<c:if test="${count>0}">
			<c:set var="pageCount" value="${(count + pageSize-1) / pageSize}" />
			<c:set var="pageBlock" value="3"/>
			<c:set var="startPage" value="${(currentPage-1) / pageBlock * pageBlock + 1}"/>
			<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			<c:if test="${startPage > pageBlock}">
				<a href="qna_list.?pageNum=${startPage - pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="1" end="${endPage}" step="1">
				<a href="qna_list?pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="qna_list?pageNum=${startPage+pageBlock}">[다음]</a>
			</c:if>
	</c:if>
</div>
	
	<br>
			<a href="qna_index">메인페이지로 이동</a>
</div>
</body>
</html>




