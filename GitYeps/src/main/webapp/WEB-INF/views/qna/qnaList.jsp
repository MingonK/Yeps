<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="../style.jsp"%>
<html>
<head>
	<title>QnA</title>
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
								<a class="header-nav_link" href="member_index">Return to <strong>yelp.com</strong></a>
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
                <div class="clearfix layout-block layout-n column--responsive">
                    <div class="column column-alpha column--responsive">
                        
                        <div class="titled-nav js-titled-nav">
                            <input class="titled-nav-dropdown_handler" id="titled-nav-aea849eb-e635-459e-8595-36b9e3314f07" role="presentation" type="checkbox">
                            <div class="titled-nav-dropdown hidden-non-responsive-block responsive-hidden-large">
                                <label class="titled-nav-dropdown_trigger" for="titled-nav-aea849eb-e635-459e-8595-36b9e3314f07">
                                    <span class="arrange arrange--middle titled-nav-dropdown_content">
                                        <span class="arrange_unit arrange_unit--fill titled-nav-dropdown_shadow">
                                            <span class="titled-nav-dropdown_faded-title">
                                                <strong>Menu</strong>
                                            </span>
                                        </span>
                                        <span class="arrange_unit titled-nav-dropdown_icon">
                                            <i class="i ig-common_sprite i-24x24_ios_chevron_down-common_sprite titled-nav-dropdown_expand"></i>
                                            <i class="i ig-common_sprite i-24x24_ios_chevron_up-common_sprite titled-nav-dropdown_collapse"></i>
                                        </span>
                                    </span>
                                </label>
                            </div>
                            <div class="titled-nav_menus">
                                <div class="titled-nav_menu titled-nav-list--responsive">
                                    <div class="titled-nav-header arrange arrange--top">
                                    </div>
                                    <ul class="titled-nav_items">
                                        <li class="titled-nav_item">
                                            <a class="titled-nav_link" href="/?l=en_US">
                                                <div class="titled-nav_link-content arrange arrange--middle">
                                                    <div class="arrange_unit arrange_unit--fill">
                                                        <span class="titled-nav_link-label">Support Center</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link is-active" href="/Using_Yelp?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Using Yelp</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Reviews_Photos?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Reviews &amp; Photos</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Updating_Business_Information?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Updating Business Information</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Yelp_for_Business_Owners?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Yelp for Business Owners</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Advertising_on_Yelp?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Advertising on Yelp</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Claiming_your_Business_Page?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Claiming your Business Page</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Recommended_Reviews?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Recommended Reviews</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Yelp_Elite_Squad?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Yelp Elite Squad</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Legal_Questions?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Legal Questions</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Searching_Yelp?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Searching Yelp</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="/Yelp_Reservations?l=en_US" target="">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Yelp Reservations</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="http://www.yelp.com/developers" target="_blank">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Yelp for Developers</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="http://www.yelp.com/static?p=tos" target="_blank">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Terms of Service</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="titled-nav_item">
                                                    <a class="titled-nav_link" href="http://www.yelp.com/guidelines" target="_blank">
                                                        <div class="titled-nav_link-content arrange arrange--middle">
                                                            <div class="arrange_unit arrange_unit--fill">
                                                                <span class="titled-nav_link-label">Content Guidelines</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </div>

                    <div class="column column-beta column--responsive">
                        
                        <div class="sat-content clearfix">
                        </div><span id="j_id0:topicGroup">
                            <div class="sat-topic-group"><span id="j_id0:j_id32">

    <ul class="breadcrumbs">
        <li>
            <a href="/?l=en_US">Support Center
            </a>
        </li><span id="j_id0:j_id32:j_id33:j_id37"><span id="j_id0:j_id32:j_id33:j_id37:j_id38:j_id39:1:j_id42">
        <li>
                <span class="i-wrap ig-wrap-common i-breadcrumb-arrow-common-wrap">
                    <i class="i ig-common i-breadcrumb-arrow-common"></i>Using Yelp
                </span>
        </li></span></span>
    </ul></span>
                                <h1>Using Yelp</h1>

                                <p class="sat-description" style="">Learn how to take full advantage of Yelp from resetting your password to joining the Yelp Elite Squad and everything in between.
                                </p>
                                    <div class="sat-topic-group-category">
                                        <a href="/Getting_Started?l=en_US">Getting Started</a>
                                        <p>Signing up, verifying and updating your account, resetting your password - everything you need to know to join the ever-growing ranks of Yelpers in your community and beyond.
                                        </p>
                                    </div>
                                    <div class="sat-topic-group-category">
                                        <a href="/Friends_and_Followers?l=en_US">Friends &amp; Followers</a>
                                        <p>Learn how to connect with your friends and follow your favorite contributors.
                                        </p>
                                    </div>
                                    <div class="sat-topic-group-category">
                                        <a href="/Using_the_Yelp_App?l=en_US">Using the Yelp App</a>
                                        <p>Learn how the Yelp app works to improve the mobile experience.
                                        </p>
                                    </div>
                                    <div class="sat-topic-group-category">
                                        <a href="/Yelp_Deals_Gift_Certificates?l=en_US">Yelp Deals &amp; Gift Certificates</a>
                                        <p>How to buy and redeem Yelp Deals and Gift Certificates at great local businesses in your neighborhood.
                                        </p>
                                    </div>
                                    <div class="sat-topic-group-category">
                                        <a href="/Ordering_Food_on_Yelp?l=en_US">Ordering Food on Yelp</a>
                                        <p>Hungry but can't pull yourself away from your smartphone? Don't worry - you can order food on Yelp from restaurants nearby.
                                        </p>
                                    </div>
                                    <div class="sat-topic-group-category">
                                        <a href="/Yelp_Elite_Squad?l=en_US">Yelp Elite Squad</a>
                                        <p>Everything you need to know about the people we recognize as the most active evangelists and role models for their Yelp communities.
                                        </p>
                                    </div>
                                    <div class="sat-topic-group-category">
                                        <a href="/Events?l=en_US">Events</a>
                                        <p>Learn how to use Yelp to post and attend offline events.
                                        </p>
                                    </div>
                                    <div class="sat-topic-group-category">
                                        <a href="/Yelp_Talk?l=en_US">Yelp Talk</a>
                                        <p>Discuss your favorite craft breweries, where to go on date night, or ask other Yelpers questions about their own cities.
                                        </p>
                                    </div>
                                    <div class="sat-topic-group-category">
                                        <a href="/Privacy?l=en_US">Privacy</a>
                                        <p>We take your privacy seriously and hate spam even more than you do. Learn more about our privacy practices here.
                                        </p>
                                    </div>
                            </div></span>
                        
                    </div>
                </div>
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
