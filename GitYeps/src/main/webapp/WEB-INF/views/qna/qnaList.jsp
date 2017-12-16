<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="../style.jsp"%>

<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css?ver=1" />
<script src="//code.jquery.com/jquery.min.js?ver=1"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js?ver=1"></script>

<html>
<head>
	<title>QnA</title>
	<script type="text/javascript">
		
	$(document).ready(function(){
        $(".greenTab").each(function(){
        	var tab = $(this).children("ul");
            var tabBtn = tab.children("li").children("a");
            var content = tabBtn.nextAll();
            
            // 탭버튼을 클릭했을때
            tabBtn.click(function(){
                // 이미 on 상태면 pass
                if( $(this).hasClass("Ycurrent") ) return;
 
                // 모든 컨텐츠 부분을 안보이게 한뒤
                content.hide();
 
                // 클릭한 tab 버튼(a태그) 옆의 모든 태그들은 보이도록
                $(this).nextAll().show();
                 
                // 모든탭 버튼에 있던 on 클래스를 빼고
                // 현재 클릭한 탭메뉴 버튼에 on 클래스 추가
                tabBtn.removeClass("Ycurrent");
                $(this).addClass("Ycurrent");
                 
                // 탭버튼를 쭉 돌면서 on 클래스가 있는 버튼만 on 이미지로 바꾸고
                // 나머지 버튼들은 off 이미지로 바꾼다.
                tabBtn.each(function(){
                    var src;
                    var img = $(this).children("img");
                    if( $(this).hasClass("Ycurrent") ){
                        src = img.attr("src").replace("_off.", "_on.");
                    }else{
                        src = img.attr("src").replace("_on.", "_off.");
                    }
                     
                    img.attr("src", src);
                });
            });
             
            // 맨첫번째 탭버튼 클릭처리
            tabBtn.eq(0).click();
        });
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
				<div class="qna_view not_list">
					<h1>자주 묻는 질문</h1>
					<div class="qna_location">
						<div class="location_list">
							<span><a href="#"><small>홈</small></a></span>
							<span class="end"><a href="#"><strong><small>자주 묻는 질문</small></strong></a></span>
						</div>
					</div>
				</div>
				
				<div class="YblockPageMenu">
					<ul>
						<li class="Yfirst Ycurrent" style="width: 50%;"><a href="/app/faq/RetrieveFaq.rpi">자주 묻는 질문</a></li>
						<li class="Ylast" style="width: 50%;"><a href="/app/inquery/Retrieve1to1Inquery.rpi">Q&A</a></li>
					</ul>
				</div>
				
				<h2 class="Yhide">자주 묻는 질문</h2>
				<div class="Yinformation">
					<p>원하시는 답변을 찾을 수 없다면 <a href="#" id="lik1to1Inquery">Q&A</a>를 활용해 주세요!</p>
				</div>
				<div class="YblockTab greenTab">
					<ul>
						<li class="Yfirst Ycurrent" ontab="dui.Calendar.close();"><a href="#" onclick="$.fTabFaqList();">전체</a></li>
						<li ontab="dui.Calendar.close();"><a href="#" onclick="$.fTabFaqList('F01');">채용절차</a></li>
						<li ontab="dui.Calendar.close();"><a href="#" onclick="$.fTabFaqList('F02');">지원서작성</a></li>
						<li class="Ylast" ontab="dui.Calendar.close();"><a href="#" onclick="$.fTabFaqList('F03');">기타</a></li>
					</ul>
				</div>
				<div id="faqList">
					<div class="YblockTabContent">
						<div class="YaccordionList">
							<dl>
								<dt>
									<a href="#" title="내용 펼치기">
									<strong><span class="Yhide">Q.</span>채용절차</strong>
									<span>각 사별 자세한 인사 제도 및 인사 관련 정보가 궁금합니다. </span>
									</a>
								</dt>
								<dd style="display: none;">
								<span class="Yhide">A.</span>
								각 사별 자세한 정보는 각 사의 채용 사이트에서 확인하실 수 있습니다. 지원한 회사의 채용 사이트를 참고하세요.
								</dd>
							</dl>		
							<dl>
								<dt>
									<a href="#" title="내용 펼치기">
									<strong><span class="Yhide">Q.</span>채용절차</strong>
									<span>LG는 계열사간 중복지원이 가능한가요?</span>
									</a>
								</dt>
								<dd style="display: none;">
								<span class="Yhide">A.</span>
									LG는 계열사별로 채용을 하기 때문에 중복지원이 가능합니다. 단, 신입사원 공채의 경우에는 중복 지원이 가능한 계열사 수를 3개사로 제한합니다.
								</dd>
							</dl>
						</div>
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
