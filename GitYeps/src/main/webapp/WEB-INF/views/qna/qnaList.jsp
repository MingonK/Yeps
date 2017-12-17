<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../style.jsp"%>

<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css?ver=1" />
<script src="//code.jquery.com/jquery.min.js?ver=1"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js?ver=1"></script>

<html>
<head>
	<title>QnA</title>
	<script type="text/javascript">
	var mode = "${param.mode}";
	$(function() { 
		if(mode == 'qna'){
			$('.faq').hide();
			$('.qna').show();
			$('.YblockPageMenu > ul > li').removeClass('Ycurrent');
	        $('.YblockPageMenu > ul > .Ylast').addClass('Ycurrent');
		}else{
			$('.faq').show();
			$('.qna').hide();
			$('.YblockPageMenu > ul > li').removeClass('Ycurrent');
	        $('.YblockPageMenu > ul > .Yfirst').addClass('Ycurrent');
		}
	});
	
	function fTabFaqList(faq) {
		$('.greenTab > ul > li').removeClass('Ycurrent')
    	if(faq == null){
    		$('.greenTab > ul > .F00').addClass('Ycurrent')
    		$('.YaccordionList .F01').show();
    		$('.YaccordionList .F02').show();
    		$('.YaccordionList .F03').show();
    	}else if(faq == 'F01'){
    		$('.greenTab > ul > .F01').addClass('Ycurrent')
    		$('.YaccordionList .F01').show();
    		$('.YaccordionList .F02').hide();
    		$('.YaccordionList .F03').hide();
    	}else if(faq == 'F02'){
    		$('.greenTab > ul > .F02').addClass('Ycurrent')
    		$('.YaccordionList .F01').hide();
    		$('.YaccordionList .F02').show();
    		$('.YaccordionList .F03').hide();
    	}else if(faq == 'F03'){
    		$('.greenTab > ul > .F03').addClass('Ycurrent')
    		$('.YaccordionList .F01').hide();
    		$('.YaccordionList .F02').hide();
    		$('.YaccordionList .F03').show();
    	}
    }
	
	$(document).ready(function(){
        $('.YaccordionList > dl').click(function( e ){
        	$(this).children('dd').toggle();
        	if($(this).hasClass('Ycurrent')){
        		$(this).removeClass('Ycurrent');
        	}else{
        		$(this).addClass('Ycurrent');
        	}
        })
        
        $('#profile-link').click(function(e){
        	$(".profile-column-beta_profile").show();
        	$(".profile-column-beta_passwd").hide();
        	$(".profile-column-beta_memberleave").hide();
        })

     });	
	</script>
</head>
<body>
<div class="qna-container">
	<div class="main-content-wrap header-top-addons clearfix webview-hidden">
		<div class="content-container">
			<a class="i-wrap ig-wrap-common_sprite i-18x18_review_fff-common_sprite-wrap ig-wrap-common_sprite-r header-link" href="member_index">
				<i class="i ig-common_sprite i-18x18_review_fff-common_sprite"></i>Looking for a business? Search YEPS.com
			</a>
		</div>
    </div>
    
    <div id="qna_main_content_wrap">
		<div id="qna_container">
			<div id="qna_container_arrange">
				<div id="yeps_img">
					<a href="main_page" style="display: block;"><img src="getYelp_Logo" style="width: 80px; height: 40px;"></a>
				</div>
				<div id="arrange_unit">
					<h2 id="main-header_title">Support Center</h2>
				</div>
				<div id="qna_container_arrange_return">
					<div class="main-header_nav text-right">
						<ul class="header-nav">
							<li class="header-nav_item">
								<a class="header-nav_link" href="member_index">Return to <strong>yeps.com</strong></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
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
									<form action="/" class="yform arrange arrange--6 arrange--stack-small sc-search-form" method="get">
										<div class="arrange_unit arrange_unit--fill sc-search-field">
											<input name="q" placeholder="What can we help you with?" type="text" value="">
											<button class="qna_searchbtn qna_searchbtn-primary" type="submit" value="submit">
												<span>
													<span class="i-wrap ig-wrap-common_sprite i-search-common_sprite-wrap">
														<i class="i ig-common_sprite search-common_sprite"></i> Search Support
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
		
	<div class="qna-content-container">
		<div class="container">
			<div class="YblockContentMain">
				<div class="qna_view not_list faq"  style="display:none;">
					<h1>자주 묻는 질문</h1>
					<div class="qna_location">
						<div class="location_list">
							<span><a href="#"><small>홈</small></a></span>
							<span class="end"><a href="#"><strong><small>자주 묻는 질문</small></strong></a></span>
						</div>
					</div>
				</div>
				
				<div class="qna_view not_list qna" style="display:none;">
					<h1>QnA</h1>
					<div class="qna_location">
						<div class="location_list">
							<span><a href="#"><small>홈</small></a></span>
							<span class="end"><a href="#"><strong><small>QnA</small></strong></a></span>
						</div>
					</div>
				</div>
				
				<div class="YblockPageMenu">
					<ul>
						<li class="Yfirst Ycurrent" style="width: 50%;"><a href="qna_list?mode=faq">자주 묻는 질문</a></li>
						<li class="Ylast" style="width: 50%;"><a href="qna_list?mode=qna">Q&A</a></li>
					</ul>
				</div>
				
				<div class="faq"  style="display:none;">
					<h2 class="Yhide">자주 묻는 질문</h2>
					<div class="Yinformation">
						<p>원하시는 답변을 찾을 수 없다면 <a href="qna_list?mode=qna" id="lik1to1Inquery">Q&A</a>를 활용해 주세요!</p>
					</div>
					<div class="YblockTab greenTab">
						<ul>
							<li class="F00 Yfirst Ycurrent"><a onclick="fTabFaqList();">전체</a></li>
							<li class="F01"><a onclick="fTabFaqList('F01');">리뷰 작성</a></li>
							<li class="F02"><a onclick="fTabFaqList('F02');">프로필 수정</a></li>
							<li class="F03 Ylast"><a onclick="fTabFaqList('F03');">기타</a></li>
						</ul>
					</div>
					<div id="faqList">
						<div class="YblockTabContent">
							<div class="YaccordionList">
								<dl class="F01">
									<dt>
										<a title="내용 펼치기">
										<strong><span class="Yhide"></span>리뷰 작성</strong>
										<span>리뷰는 어떻게 작성해야하나요? </span>
										</a>
									</dt>
									<dd style="display: none;">
									<span class="Yhide"></span>
									잘 작성하시면 됩니다!
									</dd>
								</dl>
										
								<dl class="F01">
									<dt>
										<a title="내용 펼치기">
										<strong><span class="Yhide"></span>리뷰 작성</strong>
										<span>별점을 낮게 주면 어떻게 되나요?</span>
										</a>
									</dt>
									<dd style="display: none;">
									<span class="Yhide"></span>
										해당 가게의 사장님이 슬퍼합니다.
									</dd>
								</dl>
								
								<dl class="F02">
									<dt>
										<a title="내용 펼치기">
										<strong><span class="Yhide"></span>프로필 수정</strong>
										<span>프로필은 어떻게 수정하나요?</span>
										</a>
									</dt>
									<dd style="display: none;">
									<span class="Yhide"></span>
										로그인 뒤 우측 상단의 캐릭터아이콘을 눌러서 Account Settings 를 클릭해주시면 됩니다.
									</dd>
								</dl>
								
								<dl class="F03">
									<dt>
										<a title="내용 펼치기">
										<strong><span class="Yhide"></span>기타</strong>
										<span>다른 궁금한 점들은?</span>
										</a>
									</dt>
									<dd style="display: none;">
									<span class="Yhide"></span>
										Q&A를 이용해주시기 바랍니다.
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
				
				<div class="qna"  style="display:none;">
					<div class="Yinformation">
						<p>자주 묻는 질문이 궁금하다면 <a href="qna_list?mode=faq" id="lik1to1Inquery">자주묻는질문</a>을 활용해 주세요!</p>
					</div>
					<div id="faqList">
	<!-- <table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right"><a href="qna_write">글쓰기</a></td>
		</tr>
	</table> -->
	<table class="blueone">
	<thead>
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th>답변</th>
			<th align="center">작성자</th>
			<th align="center">작성일</th>
			<th align="center">조회수</th>
		</tr>
	</thead>
	<tbody>
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
								<c:set value="${dto.title}" var="title"/>
									<c:choose>
										<c:when test="${fn:length(title) > 20}">
											<b><c:out value="${fn:substring(title,0,19)}"/>..</b>
										</c:when>
										<c:otherwise>
											<b><c:out value="${title}"/></b>
										</c:otherwise>
									</c:choose>
							</a>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${sessionScope.memberNum == dto.mnum || sessionScope.memberEmail=='YEPSMaster' || sessionScope.memberEmail=='YEPSManager'}">
							<a href="qna_content?qnum=${dto.qnum}">
								<c:set value="${dto.title}" var="title"/>
									<c:choose>
										<c:when test="${fn:length(title) > 20}">
											<b><c:out value="${fn:substring(title,0,19)}"/>..</b>
										</c:when>
										<c:otherwise>
											<b><c:out value="${title}"/></b>
										</c:otherwise>
									</c:choose>
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
			<td>
				<c:choose>
					<c:when test="${dto.answered == 'n'}">
						미답변
					</c:when>
					<c:otherwise>
						<b>답변완료</b>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:set value="${dto.writer}" var="writer"/>
				<c:choose>
					<c:when test="${fn:length(writer) > 12}">
						<c:out value="${fn:substring(writer,0,11)}"/>..
					</c:when>
					<c:otherwise>
						<c:out value="${writer}"/>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${dto.regdate}</td>
			<td align="center">${dto.readcount}</td>
		</tr>		
	</c:forEach>
	</tbody>
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
				</div>
			</div>
				
			<!--	<div class="qna_not_box">
						<p>등록된 Q&A가 없습니다.</p>
					</div>    -->
		</div>
	</div>
</div>

<%@ include file="../bottom.jsp"%>


<%-- <div align="center">
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
</div> --%>
