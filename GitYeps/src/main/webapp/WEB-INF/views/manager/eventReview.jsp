<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>yeps EventReview-List</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/member.css?ver=7"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/qna.css?ver=1"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/event_list.css?ver=1"/>"/>
</head>
<%@ include file="../top.jsp"%>
<div class="event_review_container">
 <div class="main-content-wrap--full">
    	<div class="top-shelf top-shelf-grey sat-top-shelf">
			<div class="content-container">
				<div class="container">
					<div class="clearfix layout-block layout-n column--responsive">
						<div class="column column-alpha column--responsive">
							<img alt="Yelp Support Center" class="sc-top-shelf-illustration responsive-visible-large-block" src="https://s3-media3.fl.yelpcdn.com/assets/2/www/img/3d4cc7502e4d/support/support-darwin.png">
						</div>
						<div class="column column-beta column--responsive">
							<div class="sc-top-shelf-search-block">
								<div class="sc-search-form-container">
									<form name="event_review_manager_f" action="eventReview_list" class="event_review_manager_form arrange arrange--6 arrange--stack-small sc-search-form" method="post">
										<div class="arrange_unit arrange_unit--fill sc-search-field">
											<select name="search" class="search" style="width:100px; align:center;" >
												<option value="eventname">이벤트이름</option>
												<option value="name">작성자</option>
												<option value="rname">이벤트장소</option>
											</select>
											<input name="searchString" class="searchString" placeholder="What can we help you with?" type="text" value="" autocomplete=off style="width: 60%;">
											<button class="member_managerbtn member_managerbtn-primary" type="submit" value="submit">
												<span>
													<span class="i-wrap ig-wrap-common_sprite i-search-common_sprite-wrap">
														<i class="i ig-common_sprite search-common_sprite"></i> Search
													</span>
												</span>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
   </div>
<div id="event_review_header" style="margin: 30px;">
	<h2 style="height: 40px; margin-top: 20px;">Event Review List</h2>
	    <table style="width: 100%;">
			<tr>
				<th align="center" width="5%">번호</th>
				<th align="center"  width="25%">이벤트 이름</th>
				<th align="center" width="15%">작성자</th>
				<th align="center" width="35%">내용</th>
				<th align="center" width="10%">작성일자</th>
				<th align="center" width="5%">삭제</th>
				<th align="center" width="5%">수정</th>
			</tr>
		<c:if test="${empty eventReviewList}">
			<tr>
				<td colspan="6" align="center">등록된 카테고리가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${eventReviewList}">
			<tr>
				<td id="eventReview" align="center">${dto.eventReview_num}</td>
				<td id="eventReview" align="center">${dto.eventDTO.eventname}</td>
				<td id="eventReview" align="center">${dto.eventReview_writer}</td>
				<td id="eventReview" align="center">${dto.eventReview_content}</td>
				<td id="eventReview" align="center">${dto.eventReview_writedate}</td>
				<td id="eventReview" align="center"><a style="color: red; " href="eventReview_delete?eventReview_num=${dto.eventReview_num}">삭제</a></td>
				<td id="eventReview" align="center"><a style="color: red; " href="eventReview_edit?eventReview_num=${dto.eventReview_num}">수정</a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
		<div class="event_list_paging_section" style="font-size: 14px; padding: 15px 15px; width: 1200px; margin: 0 auto;">
			<div class="event_list_pagination_block">
				<div class="event_list_pagination_wrap">
					<div class="event_list_page_of_pages">
						<c:if test="${yepsPager.blockEnd == 0}">
							Page ${curPage} of 1
						</c:if>
						<c:if test="${yepsPager.blockEnd != 0}">
							Page ${curPage} of ${yepsPager.blockEnd}
						</c:if>
					</div>
<!-- 					페이징 처리!! 현재페이지는 span이 되고 나머지는 a로 -->
					<c:if test="${yepsPager.blockEnd != 1}">
					<div class="event_list_page_link_wrapper">
						<div class="event_list_page_link_wrap">
						
						<c:if test="${yepsPager.curBlock > 1}">
							<div class="event_list_next_block">
								<a class="event_list_next_block_action" href="javascript:list('1')">
									<span>Start</span>
								</a>
							</div>
						</c:if>

						<c:if test="${yepsPager.curBlock > 1}">
							<div class="event_list_next_block">
								<a class="event_list_next_block_action" href="javascript:list('${yepsPager.prevPage}')">
									<span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
										<svg class="icon_svg">
											<path d="M14.475 18.364l1.414-1.414L10.94 12l4.95-4.95-1.415-1.414L8.11 12l6.365 6.364z"></path>
										</svg>
									</span>
									<span>Previous</span>
								</a>
							</div>
						</c:if>
						
						
						<c:forEach var="num" begin="${yepsPager.blockBegin}" end="${yepsPager.blockEnd}">
							<div class="event_list_page_link_option">
							<c:choose>
								<c:when test="${num == yepsPager.curPage}">
									<span class="event_list_page_option_action">
										${num}
									</span>
								</c:when>
								<c:otherwise>
									<a href="javascript:list('${num}')" class="event_list_page_option_link_action">
										${num}
									</a>
								</c:otherwise>
							</c:choose>
							</div>
						</c:forEach>
						
						<c:if test="${yepsPager.curBlock <= yepsPager.totBlock}">
							<div class="event_list_next_block">
								<a class="event_list_next_block_action" href="javascript:list('${yepsPager.nextPage}')">
									<span>Next</span>
									<span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
										<svg class="icon_svg">
											<path d="M9.525 5.636L8.11 7.05 13.06 12l-4.95 4.95 1.415 1.414L15.89 12 9.524 5.636z"></path>
										</svg>
									</span>
								</a>
							</div>
						</c:if>
						
						<c:if test="${yepsPager.curPage <= yepsPager.totPage}">
							<div class="event_list_next_block">
								<a class="event_list_next_block_action" href="javascript:list('${yepsPager.totPage}')">
									<span>End</span>
								</a>
							</div>
						</c:if>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		</div>
		
<script type="text/javascript">	

	function list(page){
		location.href="eventReview_list?curPage=" + page;
		
	}</script>

<%@ include file="../bottom.jsp"%>