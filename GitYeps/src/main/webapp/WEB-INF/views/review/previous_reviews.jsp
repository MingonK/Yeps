<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html>
<head>
	<title>Review Of The Day Archive for Seoul</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/basic/favicon.ico">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=2"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/review.css?ver=3"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/message.css?ver=7"/>"/>
	<script src="//code.jquery.com/jquery.min.js">
	</script>
	
	<script type="text/javascript">
   		function list(page){
      		  location.href="previous_reviews?curPage=" + page;
   	    }
    </script>
    
</head>
<body>
<%@ include file="../top.jsp" %>
	<div class="pre_div1">
		<div class="pre_div2">
			<div class="pre_div2-1">
			</div>
			<!--실질적인 전체묶음 -->
			<div class="pre_div3">
			   <!--제목 -->
			   <div class="pre_div4">
			   		<div class="pre_div4-1">
			   			<div class="pre_div4-1-1">
			   				<div class="pre_div4-1-1-1">
			   					<h2 class="pre_h2">Review Of The Day Archive for Seoul</h2>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-11" href="#">Seoul</a>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-11" href="#">Daegu</a>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-11" href="#">Busan</a>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-11" href="#">Gwangju</a>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-22" href="#">
			   					<span style="width: 14px; height: 14px;" class="pre_span_11">
    								<svg class="pre_svg_11">
     								   <path d="M7 9L3.5 5h7L7 9z"></path>
   									</svg>
								</span>
									More Cities
								</a>
			   				</div>
			   			</div>
			   		</div>
			   </div>
			   <!--실질적인 정보 전체 묶음 -->
			   <div class="pre_div5">
			   	  <div class="pre_div5-5">
			   	  	<div class="pre_div6">
			   			<div class="pre_div7">
			   			   <ul class="pre_ul_super">   
			   			   	 <c:forEach var="dto" items="${rvdto_y}" varStatus="status">
			   			   	  <li class="pre_li">
			   					<div class="pre_div8"> 			 
			   					 	<!--프로필뭉텅이 / 내용뭉텅이  -->
			   					    <div class="pre_div9">
			   					    	<div class="pre_div9-1">
			   					    		<div class="pre_div9-1-1">
			   					    			<div class="pre_div9-1-1-1">
			   					    				<div class="pre_div9-1-1-1-1">
			   					    					<a class="pre_a_1" href="#"><img class="pre_img_1" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${dto.memberDTO.memberPhotoDTO.member_filename}"></a>
			   					    				</div>
					   					    	 </div>
					   					    	 <div class="pre_div9-1-1-2">
					   					    	 	<ul class="pre_ul_small_1">
					   					    	 		<li class="pre_li_small-1">
					   					    	 			<c:if test="${empty dto.memberDTO.nickname}">
					   					    	 				<a class="pre_a_2" href="member_details?mnum=${dto.memberDTO.mnum}">${dto.memberDTO.email}</a>
					   					    	 			</c:if>
					   					    	 			<c:if test="${!empty dto.memberDTO.nickname}">
					   					    	 				<a class="pre_a_2" href="member_details?mnum=${dto.memberDTO.mnum}">${dto.memberDTO.nickname}</a>
					   					    	 			</c:if>
					   					    	 		</li>			
					   					    	 		<li class="pre_li_small-1"><b>Korea, Seoul</b></li>
					   					    	 	</ul>	
					   					    		<ul class="pre_ul_small_1">
					   					    			<li class="pre_li_small-2">
					   					    				<span aria-hidden="true" class="pre_span_2">
					   					    					<svg class="pre_svg_2">
					   					    						<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
					   					    					</svg>
					   					    				</span><b>${dto.memberDTO.reviewcount}</b> reviews
					   					    			</li>	
					   					    		</ul>
					   					    	 </div>
					   					    </div>
					   					    <ul class="pre_ul_small">
					   					    	<li class="pre_li_small-2-1">
					   					    		<a class="pre_a_3" rel="Shirley C." data-component-bound="true" href="yeps_message">
					   					    			<div class="pre_div_10">
					   					    				<span class="pre_span">
					   					    					<svg class="pre_svg_33">
					   					    						<path d="M2 4v6a2 2 0 0 0 2 2h1v3l4-3h5a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"></path>
					   					    					</svg>
					   					    				</span>
					   					    			</div>
					   					    			<div class="pre_div111">
					   					    				Send message
					   					    			</div>
					   					    		</a>
					   					    	</li>
					   					    </ul>
			   					    	</div>
			   					    </div>
									<div class="pre_div222">
										<p class="pre_p1">
											<a class="pre_a99" href="member_details?mnum=${dto.memberDTO.mnum}">
												<c:if test="${empty dto.memberDTO.nickname}">
													${dto.memberDTO.email}
												</c:if>
												<c:if test="${!empty dto.memberDTO.nickname}">
													${dto.memberDTO.nickname}
												</c:if>
											</a>
											 wrote a 
											<b class="pre_b">review</b>
											 for     
											<a class="pre_a99" href="restaurant_content?rnum=${dto.restaurantDTO.rnum}">${dto.restaurantDTO.rname}</a>
										</p>
										<div class="pre_div_33">
											<div class="pre_div_33-1">
											    <div class="pre_div_33-1-1"></div>
											    	<div class="pre_div_star${dto.gradepoint}" title="4.0 star rating">
											    		<img class="pre_starimg1" height="303" width="84" alt="4.0 star rating" src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png" >
											    	</div>
												<span class="pre_span88">
													${dto.reg_date} 
												</span>
											</div>
											<p class="pre_p_33">
												${dto.content} 
											</p>
										</div>
									</div>
   							   </div>
   						    </li>
   						  </c:forEach>
   					    </ul>	 	    
   					  </div>
   					  <div class="pre_div_page">
   					  	<div class="pre_div_page-1">
   					  		<!-- 페이징 처리의 시작부 -->
   								 <div class="yeps_message_pagination_wrap">
   								 <div class="yeps_message_page_of_pages" >
	                                  <c:if test="${map.yepsPager.blockEnd == 0}">
	                                      Page ${map.yepsPager.curPage} of 1
	                                  </c:if>
	                                  <c:if test="${map.yepsPager.blockEnd != 0}">
	                                      Page ${map.yepsPager.curPage} of ${map.yepsPager.blockEnd}
	                                  </c:if>
	                             </div>
   							
	   							 <!--  페이징 처리!! 현재페이지는 span이 되고 나머지는 a로    -->
		                         <c:if test="${map.yepsPager.blockEnd != 1}">
		                             <div class="yeps_message_page_link_wrapper" style="text-align: right;">
		                                 <div class="yeps_message_page_link_wrap">
		                                     <c:if test="${map.yepsPager.curBlock > 1}">
		                                         <div class="yeps_message_next_block">
		                                             <a class="yeps_message_next_block_action" href="javascript:list('1')">
		                                                 <span>Start</span>
		                                             </a>
		                                         </div>
		                                     </c:if>
		                                 <c:if test="${map.yepsPager.curBlock > 1}">
		                                     <div class="yeps_message_next_block">
		                                         <a class="yeps_message_next_block_action" href="javascript:list('${map.yepsPager.prevPage}'">
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
		                                         <div class="yeps_message_page_link_option">
			                                         <c:choose>
			                                             <c:when test="${num == map.yepsPager.curPage}">
			                                                 <span class="yeps_message_page_option_action">
			                                                     ${num}
			                                                 </span>
			                                             </c:when>
			                                             <c:otherwise>
			                                                 <a href="javascript:list('${num}')" class="yeps_message_page_option_link_action">
			                                                     ${num}
			                                                 </a>
			                                             </c:otherwise>
			                                         </c:choose>
			                                     </div>
		                                     </c:forEach>
		                                  <c:if test="${map.yepsPager.curBlock <= map.yepsPager.totBlock}">
		                                     <div class="yeps_message_next_block">
		                                        <a class="yeps_message_next_block_action" href="javascript:list('${map.yepsPager.nextPage}')">
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
		                                     <div class="yeps_message_next_block" style="display: inline-block;">
		                                        <a class="yeps_message_next_block_action" href="javascript:list('${map.yepsPager.totPage}')">
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
	   				 </div>
	   			   </div>
	   			</div>	
			</div>
		</div>
	
</body>
</html>
<%@ include file="../bottom.jsp" %>






				

    
    
    
    
    
	
	
	