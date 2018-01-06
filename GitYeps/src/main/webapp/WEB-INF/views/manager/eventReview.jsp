<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>yeps EventReview-List</title>
</head>
<%@ include file="../top.jsp"%>
<div align="center" style="margin: 30px;">
	<h2 style="height: 50px; margin-top: 40px;">이벤트 리뷰 목 록</h2>
	    <table width="90%">
		    
			<tr>
				<th align="center" width="10%">번호</th>
				<th align="center" width="20%">작성자</th>
				<th align="center" width="35%">내용</th>
				<th align="center" width="15%">작성일자</th>
				<th align="center" width="10%">삭제</th>
				<th align="center" width="10%">수정</th>
			</tr>
		<c:if test="${empty categoryList}">
			<tr>
				<td colspan="6" align="center">등록된 카테고리가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${eventReviewList}">
			<tr>
				<td align="center">${dto.eventReview_num}</td>
				<td align="center">${dto.eventReview_writer}</td>
				<td align="center">${dto.eventReview_content}</td>
				<td align="center">${dto.eventReview_writedate}</td>
				<td align="center"><a href="eventReview_delete?eventReview_num=${dto.eventReview_num}">삭제</a>|</td>
				<td align="center"><a href="eventReview_edit?eventReview_num=${dto.eventReview_num}">수정</a></td>
			</tr>
		</c:forEach>
	</table>
	</td>
	</tr>
	</table>
			   <div class="event_list_section" style="font-size: 14px; ">
	                      <div class="event_list_pagination_block">
	                          <div class="event_list_pagination_wrap">
	                              <div class="event_list_page_of_pages" >
	                                  <c:if test="${map.yepsPager.blockEnd == 0}">
	                                      Page ${map.yepsPager.curPage} of 1
	                                  </c:if>
	                                  <c:if test="${map.yepsPager.blockEnd != 0}">
	                                      Page ${map.yepsPager.curPage} of ${map.yepsPager.blockEnd}
	                                  </c:if>
	                             </div>
	                     <!--  페이징 처리!! 현재페이지는 span이 되고 나머지는 a로    -->
	                         <c:if test="${map.yepsPager.blockEnd != 1}">
	                             <div class="event_list_page_link_wrapper" style="text-align: right;">
	                                 <div class="event_list_page_link_wrap">
	                                     <c:if test="${map.yepsPager.curBlock > 1}">
	                                         <div class="event_list_next_block">
	                                             <a class="event_list_next_block_action" href="javascript:list('1')">
	                                                 <span>Start</span>
	                                             </a>
	                                         </div>
	                                     </c:if>
	                                 <c:if test="${map.yepsPager.curBlock > 1}">
	                                     <div class="event_list_next_block">
	                                         <a class="event_list_next_block_action" href="javascript:list('${map.yepsPager.prevPage}')">
	                                             <span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
	                                                  <svg class="icon_svg">
	                                                      <path d="M14.475 18.364l1.414-1.414L10.94 12l4.95-4.95-1.415-1.414L8.11 12l6.365 6.364z"></path>
	                                                  </svg>
	                                            </span>
	                                            <span>Previous</span>
	                                         </a>
	                                    </div>
	                                </c:if>
	                                    <c:forEach var="num" begin="${map.yepsPager.blockBegin}" end="${map.yepsPager.blockEnd}">
	                                        <div class="event_list_page_link_option">
		                                        <c:choose>
		                                            <c:when test="${num == map.yepsPager.curPage}">
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
	                                <c:if test="${map.yepsPager.curBlock <= map.yepsPager.totBlock}">
	                                    <div class="event_list_next_block">
	                                        <a class="event_list_next_block_action" href="javascript:list('${map.yepsPager.nextPage}')">
	                                            <span>Next</span>
	                                            <span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
	                                                <svg class="icon_svg">
	                                                    <path d="M9.525 5.636L8.11 7.05 13.06 12l-4.95 4.95 1.415 1.414L15.89 12 9.524 5.636z"></path>
	                                                </svg>
	                                            </span>
	                                        </a>
	                                    </div>
	                                </c:if>
	                            <c:if test="${map.yepsPager.curPage <= map.yepsPager.totPage}">
	                                <div class="event_list_next_block" style="display: inline-block;">
	                                    <a class="event_list_next_block_action" href="javascript:list('${map.yepsPager.totPage}')">
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