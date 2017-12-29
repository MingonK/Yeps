<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html>
<head>
	<title>타이틀 설정해야함</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=4"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/review.css?ver=3"/>"/>
	<script src="//code.jquery.com/jquery.min.js">
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
			   					<h2 class="pre_h2">Review Of The Day Archive for 위치</h2>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-11" href="/browse/reviews/picks?edition_id=c6HT44PKCaXqzN_BdgKPCw">Seoul</a>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-11" href="/browse/reviews/picks?edition_id=zT0PuDsIV-S7M-W_NaX9vw">Daegu</a>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-11" href="/browse/reviews/picks?edition_id=fFGPBtsutYpn3A155Sf75Q">Busan</a>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-11" href="/browse/reviews/picks?edition_id=nkN_do3fJ9xekchVC-v68A">Gwangju</a>
			   				</div>
			   				<div class="pre_div4-1-1-2">
			   					<a class="pre_a-22" href="/locations">
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
			   					    					<a class="pre_a_1" href="#"><img class="pre_img_1"></a>
			   					    				</div>
					   					    	 </div>
					   					    	 <div class="pre_div9-1-1-2">
					   					    	 	<ul class="pre_ul_small_1">
					   					    	 				<li class="pre_li_small-1">
					   					    	 					<a class="pre_a_2" href="#">${mdto_y.get(status.index).name}</a>
					   					    	 				</li>			
					   					    	 				<li class="pre_li_small-1"><b>Korea, Seoul</b></li>
					   					    	 	</ul>	
					   					    		<ul class="pre_ul_small_1">
					   					    			<%-- <c:forEach var="mdto" items="${mdto_y}"> --%>
					   					    			<li class="pre_li_small-2">
					   					    				<span class="pre_span_1">
					   					    					<svg class="pre_svg">
					   					    						<g>
					   					    							<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path>
					   					    							<path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path>
					   					    						</g>
					   					    					</svg>
					   					    				</span>
					   					    				<b>276</b>friends
					   					    			</li>
					   					    			<li class="pre_li_small-2">
					   					    				<span aria-hidden="true" class="pre_span_2">
					   					    					<svg class="pre_svg_2">
					   					    						<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
					   					    					</svg>
					   					    				</span><b>${mdto_y.get(status.index).reviewcount}</b>reviews
					   					    			</li>
					   					    			<li class="pre_li_small-2-1"><a class="pre_a_3" href="#">Elite'17</a></li>
					   					    		</ul>
					   					    	 </div>
					   					    </div>
					   					    <ul class="pre_ul_small">
					   					    	<li class="pre_li_small-2-1">
					   					    		<a href="pre_a_3">
					   					    			<div class="pre_div_10">
					   					    				<span class="pre_span">
					   					    					<svg class="pre_svg_33">
					   					    						<path d="M17.714 6.43L13 10.356v-3.03c-1 0-5.097 1.47-6.286 3.62.274-3.08 4.286-5.5 6.286-5.5V2.5l4.714 3.93zM3 4v10h11v-2.5l1-1V15H2V3h8.5l-1 1H3z"></path>
					   					    					</svg>
					   					    				</span>
					   					    			</div>
					   					    			<div class="pre_div111">
					   					    				Share review
					   					    			</div>
					   					    		</a>
					   					    	</li>
					   					    	<li class="pre_li_small-2-1">
					   					    		<a href="pre_a_3">
					   					    			<div class="pre_div_10">
					   					    				<span class="pre_span">
					   					    					<svg class="pre_svg_33">
					   					    						<path d="M14.5 6.75a5.5 5.5 0 0 0-11 0 5.495 5.495 0 0 0 2.993 4.892L5.5 16.75l3.505-2 3.495 2-.993-5.108A5.495 5.495 0 0 0 14.5 6.75zm-5.5 4c-2.206 0-4-1.794-4-4s1.794-4 4-4 4 1.794 4 4-1.794 4-4 4z"></path>
					   					    					</svg>
					   					    				</span>
					   					    			</div>
					   					    			<div class="pre_div111">
					   					    				Compliment
					   					    			</div>
					   					    		</a>
					   					    	</li>
					   					    	<li class="pre_li_small-2-1">
					   					    		<a href="pre_a_3">
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
					   					    	<li class="pre_li_small-2-1">
					   					    		<a href="pre_a_3">
					   					    			<div class="pre_div_10">
					   					    				<span class="pre_span">
					   					    					<svg class="pre_svg_33">
					   					    						<path d="M16 13l-4 3v-2H9l1-2h2v-2l4 3zm-8.925 2.383c-.443.817-1.707.817-2.15 0L2.128 9.605C1.728 8.868 2.31 8 3.203 8h5.594c.893 0 1.474.868 1.075 1.605l-2.797 5.778zM6 7a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"></path>
					   					    					</svg>
					   					    				</span>
					   					    			</div>
					   					    			<div class="pre_div111">
					   					    				Follow Jose J.
					   					    			</div>
					   					    		</a>
					   					    	</li>
					   					    	<li class="pre_li_small-2-1">
					   					    		<a class="pre_a_3">
					   					    			<div class="pre_div_10">
					   					    				<span class="pre_span">
					   					    					<svg class="pre_svg_33">
					   					    						<path d="M16 14.5L14.5 16 13 14.5 11.5 16 10 14.5l1.5-1.5-1.5-1.5 1.5-1.5 1.5 1.5 1.5-1.5 1.5 1.5-1.5 1.5 1.5 1.5zm-8.925.883c-.443.817-1.707.817-2.15 0L2.128 9.605C1.728 8.868 2.31 8 3.203 8h5.594c.893 0 1.474.868 1.075 1.605l-2.797 5.778zM6 7a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"></path> 
					   					    					</svg>
					   					    				</span>
					   					    			</div>
					   					    			<div class="pre_div111">
					   					    		    	Stop following Jose J.
					   					    			</div>
					   					    		</a>
					   					    	</li>
					   					    </ul>
			   					    	</div>
			   					    </div>
									<div class="pre_div222">
										<p class="pre_p1">
											<a class="pre_a99" href="#">${mdto_y.get(status.index).name}</a>
											 wrote a 
											<b class="pre_b">review</b>
											 for     
											<a class="pre_a99" href="#">${rdto_y.get(status.index).rname}</a>
										</p>
										<div class="pre_div_33">
											<div class="pre_div_33-1">
											    <div class="pre_div_33-1-1"></div>
											    	<div class="pre_div_star${dto.gradepoint}" title="4.0 star rating">
											    		<img class="pre_starimg1" height="303" width="84" alt="4.0 star rating" src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png" >
											    	</div>
												<span class="pre_span88">
													${dto.joindate} 
												</span>
											</div>
											<ul class="pre_ul_33">
												<li class="pre_li_33">
													<a class="pre_a_33" href="#">
														<span class="pre_span_33" aria-hidden="true">
														    <svg id="18x18_review" height="100%" viewBox="0 0 18 18" width="100%">
														    	<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
														    </svg>
														</span>
														ROTD 12/22/2017
													</a>
												</li>
											</ul>
											<p class="pre_p_33">
												${dto.content} 
											</p>
										</div>
										<div class="pre_div_444">
											<div class="pre_div_444-1">
												<p class="pre_p_444">
													Was this review ...?	
												</p>
												<ul class="pre_ul_444">
													<li class="pre_li_444">
														<a class="pre_a_444" href="#">
															<span class="pre_span_440">
																<svg class="pre_svg_440">
																	<path d="M9 17c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zM9 2C5.14 2 2 5.14 2 9s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm2 8.392V12H7v-1.608a3.982 3.982 0 0 1-2-3.445 4 4 0 0 1 8 0c0 1.477-.81 2.752-2 3.445zM8 5.25a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5zm1.003 9.747h-.006A1.997 1.997 0 0 1 7 13h4a1.997 1.997 0 0 1-1.997 1.997z"></path>
																</svg>
															</span>
															<span class="pre_span_441">Useful</span>
															<span class="pre_span_442">21</span>
														</a>
													</li>
													<li class="pre_li_444">
														<a class="pre_a_444" href="#">
															<span class="pre_span_440">
																<svg class="pre_svg_440">
																	<path d="M9 17c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zM9 2C5.14 2 2 5.14 2 9s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm0 12a4.87 4.87 0 0 1-4.787-4h9.574A4.87 4.87 0 0 1 9 14zm2.5-5.625a1.376 1.376 0 1 1 0-2.75 1.376 1.376 0 0 1 0 2.75zm-5 0a1.376 1.376 0 1 1 0-2.75 1.376 1.376 0 0 1 0 2.75z"></path>
																</svg>
															</span>
															<span class="pre_span_441">Funny</span>
															<span class="pre_span_442">17</span>
														</a>
													</li>
													<li class="pre_li_444">
														<a class="pre_a_444" href="#">
															<span class="pre_span_440">
																<svg class="pre_svg_440">
																	<path d="M9 17c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zM9 2C5.14 2 2 5.14 2 9s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm6.026 5.335C14.766 8.797 13.5 10 11.986 10h-.003c-1.218 0-2.282-.764-2.767-1.813-.088-.19-.344-.242-.432-.052C8.3 9.185 7.234 10 6.016 10h-.003C4.5 10 3.195 8.83 2.973 7.35l-.093-.84c-.053-.242.192-.51.477-.51h11.286c.294 0 .508.332.477.56l-.094.775zm-2.068 4.154A4.28 4.28 0 0 1 9 14.144a4.28 4.28 0 0 1-3.958-2.657A6.81 6.81 0 0 0 9 12.753a6.81 6.81 0 0 0 3.958-1.265z"></path>
																</svg>
															</span>
															<span class="pre_span_441">Cool</span>
															<span class="pre_span_442">19</span>
														</a>
													</li>
												</ul>
												<div class="pre_div_433">
													<div class="pre_div_433-1">
														<div class="pre_div_433-1-1">
															<div class="pre_div_433-1-1-1">
																<h3 class="pre_h3_433"></h3>
																<div class="pre_div_455">
																	<img src="https://s3-media3.fl.yelpcdn.com/assets/srv0/yelp_deanonymize_ufc/f871a0ff7872/lib/img/200x120_ufc_globe.png">
																</div>
																<div class="pre_div_456">
																	Heads up: From now on, other Yelpers will be able to see how you voted. Want to chime in?
																</div>
																<form action="" method="post" class="pre_form1">
																	<input type="hidden" name="" value="" class="pre_input1">
																	<button href="#" type="submit" class="pre_button1">
																		<span class="pre_span_456">Yes, Let Me Vote!</span>
																	</button>
																</form>
																<div class="pre_div_457">
																	<small class="pre_small1">Maybe Later</small>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
   							   </div>
   						    </li>
   						  </c:forEach>
   					    </ul>	 	
   					     
   					     
   					     
   					     
   					     
   					     
   					     
   					     
   					  </div>
   					  <div class="pre_div_page">
   					  	<div class="pre_div_page-1">
   					  		<div class="pre_div_page-1-1"></div>
   					  		<div class="pre_div_page-1-2">
   					  			<div class="pre_div_page-1-2-1">
   					  				<div class="pre_div_page00">
   					  					<span class="pre_span_page0">1</span>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page0" href="#">2</a>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page0" href="#">3</a>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page0" href="#">4</a>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page0" href="#">5</a>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page0" href="#">6</a>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page0" href="#">7</a>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page0" href="#">8</a>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page0" href="#">9</a>
   					  				</div>
   					  				<div class="pre_div_page00">
   					  					<a class="pre_a_page1" href="#">
   					  						<span class="pre_span_page_11">Next</span>
   					  						<span class="pre_span_page_22">
   					  							<svg class="pre_svg_page_33">
   					  								<path d="M9.525 5.636L8.11 7.05 13.06 12l-4.95 4.95 1.415 1.414L15.89 12 9.524 5.636z"></path>
   					  							</svg>
   					  						</span>
   					  					</a>
   					  				</div>
   					  			</div>
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






				

    
    
    
    
    
	
	
	