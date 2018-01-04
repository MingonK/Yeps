<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
   <title>Write a Review</title>
   <title>레스토랑 리스트 사진목록 + 리뷰 + 평점 달 수 있도록 구현해둔 곳</title>
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=4"/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/review.css?ver=6"/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/member.css?ver=6"/>"/>
   <script src="//code.jquery.com/jquery.min.js"></script>  
</head>
<%@ include file="../top.jsp" %>
   
<div class="resIMG_div_1">
   <div class="resIMG_div_2">
      <div class="resIMG_div_3">
         <div class="resIMG_div_4">
            <div class="resIMG_div_5">
               <div class="resIMG_div_6">
                  <h1 class="resIMG_h1_1">Your First Review Awaits</h1>
                  <h2 class="resIMG_h2_1">
                     <b class="resIMG_b_1">Review your favorite businesses and share your experiences with our community. Need a little help getting started?
                        <a href="#">Check out these tips.</a>
                     </b>
                  </h2>
                  <form class="" name="" method="get" action="review_restaurantFind">
                     <div class="resIMG_div_7">
                        <div class="resIMG_div_8">
                           <ul class="resIMG_ul_1">
                              <li class="resIMG_li_1">
                                 <div class="resIMG_div_9">
                                    <div class="resIMG_div_10">
                                       <div class="resIMG_div_11">
                                          <div class="resIMG_div_12">
                                             Find
                                          </div>
                                          <div class="resIMG_div_13">
                                             <input class="resIMG_input_1" type="text" id="" name="SearchFind" autocomplete="off">
                                          </div>
                                       </div>   
                                    </div>
                                    <div class="resIMG_div_14">
                                       <div class="resIMG_div_15">
                                       </div>
                                    </div>   
                                 </div>
                              </li>
                              <li class="resIMG_li_2">
                                 <div class="resIMG_div_16">
                                    <div class="resIMG_div_17">
                                       <div class="resIMG_div_18">
                                          <div class="resIMG_div_20">Near</div>
                                          <div class="resIMG_div_21">
                                             <input class="resIMG_input_2" type="text" id="" name="SearchNear" value="Korea, Seoul" autocomplete="off" >
                                          </div>
                                       </div>
                                    </div>
                                    <div class="resIMG_div_22">
                                       <div class="resIMG_div_23">
                                       </div>
                                    </div>
                                 </div>
                              </li>   
                           </ul>
                        </div>
                        <div class="resIMG_div_24">
                           <button class="resIMG_button_1" type="submit" value="submit">
                              <span class="resIMG_span_1">
                                 <span class="resIMG_span_2" aria-hidden="true">
                                    <svg class="resIMG_svg_1">
                                       <path d="M15.913 14.224a1.324 1.324 0 0 0-.3-.466h.01l-3.378-3.376a5.49 5.49 0 0 0 .802-2.857 5.523 5.523 0 1 0-5.522 5.52 5.49 5.49 0 0 0 2.856-.8l3.37 3.368.006.003a1.364 1.364 0 0 0 .93.384C15.41 16 16 15.41 16 14.684c0-.163-.032-.317-.086-.46zM7.525 10.94a3.422 3.422 0 0 1-3.418-3.416 3.422 3.422 0 0 1 3.418-3.417 3.422 3.422 0 0 1 3.416 3.417 3.42 3.42 0 0 1-3.413 3.416z"></path>
                                    </svg>
                                 </span>
                              </span>
                           </button>
                        </div>
                     </div>
                  </form>
               </div>
               <div class="resIMG_div_25">
                  <div class="resIMG_div_26">
                     <img src="https://s3-media4.fl.yelpcdn.com/assets/srv0/war_pages/3a7a5118019b/assets/img/writeareview/260x160_bizhouse_YNRA.png" srcset="https://s3-media1.fl.yelpcdn.com/assets/srv0/war_pages/4b1305d39b44/assets/img/writeareview/260x160_bizhouse_YNRA@2x.png 2x" width="260">
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="resIMG_div_42" align="center">
      <p class="resIMG_p_2">
         Your review for
         <a class="bbb" href="#">${rname}</a>
         is now live!
      </p>
   </div>
   <div class="resIMG_div_43" align="center">
      <div class="resIMG_div_44">
                  <div class="resIMG_div_48">
                     <div class="resIMG_div_49">
                        <div class="resIMG_div_50">
                           <div class="resIMG_div_51">
                              <div class="resIMG_div_52">
                                 <a class="resIMG_a_3" href="#">
                                 	<c:if test="${empty filename}">
                                 		<img class="resIMG_img_3" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/basic/user_medium_square.png">
                                 	</c:if>
                                 	<c:if test="${!empty filename}">
                                   		<img class="resIMG_img_3" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${filename}">
                                   	</c:if>	    
                                 </a>
                              </div>
                           </div>
                           <div class="resIMG_div_53">
                              <ul class="resIMG_ul_4">
                                 <li   class="resIMG_li_4">
                                    <a class="resIMG_a_4" href="#">
                                       <c:if test="${empty nickname}">
					   						${email}
					   				   </c:if>
					   				   <c:if test="${!empty nickname}">
					   					  	${nickname}
					   				   </c:if>
                                    </a>
                                 </li>
                                 <li class="resIMG_li_4">
                                    <b class="resIMG_b_2">
                                       Korea, Seoul
                                    </b>
                                 </li>
                              </ul>
                              <ul class="resIMG_ul_4">
                              
                              <!--  
                                 <li class="resIMG_li_5">
                                    <span class="resIMG_span_10">
                                       <svg class="resIMG_svg_4">
                                          <g>
                                             <path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path>
                                             <path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>   
                                          </g>
                                       </svg>
                                    </span>
                                    <b class="resIMG_b_3">1</b>
                                    friend
                                 </li>
                             --> 
                                 
                                 <li class="resIMG_li_5">
                                    <span class="resIMG_span_11">
                                       <svg class="resIMG_svg_5">
                                          <path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
                                       </svg>
                                    </span>
                                    <b class="resIMG_b_4">${sessionScope.memberinfo.reviewcount}</b>
                                     reviews
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="resIMG_div_54">
                     <div class="resIMG_div_55">
                        <div class="resIMG_div_56">
                           <div class="resIMG_div_57">
                              <div class="resIMG_div_star${gradepoint}">
                                 <img class="resIMG_img_4" height="303" width="84" alt="3.0 star rating" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/basic/stars.png">
                              </div>
                              <span class="resIMG_span_12">
                                 ${joindate}
                              </span>
                           </div>
                        </div>
                     </div>
                     <div class="resIMG_div_59">
                        <p class="resIMG_p_3">
                           ${content}
                        </p>
                     </div>
                     <div class="resIMG_div_60">
                     
                     	<!--  
                        <a class="resIMG_a_5" href="#">
                           <span class="resIMG_span_13">
                              <svg class="resIMG_svg_6">
                                 <path d="M6 14v-2h10v2H6zM6 4h10v2H6V4zm-4 8h2v2H2v-2zm0-4h2v2H2V8zm0-4h2v2H2V4zm12 6H6V8h8v2z"></path>
                              </svg>
                           </span>
                           Add to list
                        </a>
                        -->
                        
                        <a class="resIMG_a_5" href="review_write?rnum=${rnum}&mode=update">
                           <span class="resIMG_span_14">
                              <svg class="resIMG_svg_7">
                                 <path d="M15.96 4.505a2.094 2.094 0 0 0-.577-1.89 2.103 2.103 0 0 0-2.973.002l-1.487 1.487-7.436 7.436L2 16l4.46-1.487 7.437-7.436 1.487-1.487c.308-.308.5-.688.577-1.085zm-10.067 9.09l-2.23.742.743-2.23 7.26-7.26 1.487 1.487-7.26 7.26z"></path>
                              </svg>
                           </span>
                           Edit
                        </a>
                     </div>
                  </div>
      </div>
   </div>
   
   
   

   
   <div class="resIMG_div_27">
      <h2 class="resIMG_h2_2">
         Been to these businesses recently?   
      </h2>
      <div class="resIMG_div_28">
         <ul class="resIMG_ul_2">

           <c:forEach var="dto" items="${rlist}">

            <li class="resIMG_li_3">
               <div class="resIMG_div_29">
                  <div class="resIMG_div_30">
                     <div class="resIMG_div_31">
                        <img class="resIMG_img_1" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${dto.rest_filename}">   
                     </div>
                     <div class="resIMG_div_32">
                        <h3 class="resIMG_h3_1">
                           <a class="resIMG_a_1" href="#">
                              <span class="resIMG_span_3">
                              	<a href="restaurant_content?rnum=${dto.rnum}">
                              		${dto.rname}
                              	</a>
                              </span>
                           </a>   
                        </h3>
                        <div class="resIMG_div_32-1">
                           ${dto.roadAddrPart1}
                        </div>
                        <div class="resIMG_div_33">
                          <form name="starpointF" method="get" action="review_write?mode=write">
                           <fieldset class="resIMG_fieldset_1">
                              <legend class="resIMG_legend_1">
                                 Rating
                              </legend>
                              
                              <ul class="resIMG_ul_3" id="star_rating" style="margin: 0px; padding: 0px; diplay: inline-block; width: 165px; height: 30px; overflow: hidden; list-style: none; vertical-align: middle;
                               background: url(https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/a5aa4dca29f3/assets/img/stars/selector_stars.png) no-repeat;">
      
                                 <li class="selector star-selector-li-1_4" data-label="Eek! Methinks not.">
                                    <input id="rating-1" type="radio" value="1" name="rating" class="star-selector-input">
                                    <label class="star-selector_label" for="rating-1">1 (Eek! Methinks not.)</label>
                                 </li>
                                 <li class="selector star-selector-li-1_4" data-label="Meh. I've experienced better.">
                                    <input id="rating-2" type="radio" value="2" name="rating" class="star-selector-input">
                                    <label class="star-selector_label" for="rating-2">2 (Meh. I've experienced better.)</label>
                                 </li>
                                 <li class="selector star-selector-li-1_4" data-label="3 (A-OK.)">
                                    <input id="rating-3" type="radio" value="3" name="rating" class="star-selector-input">
                                    <label class="star-selector_label" for="rating-3">3 (A-OK.)</label>
                                 </li>
                                 <li class="selector star-selector-li-1_4" data-label="4 (Yay! I'm a fan.)">
                                    <input id="rating-4" type="radio" value="4"  name="rating" class="star-selector-input">
                                    <label class="star-selector_label" for="rating-4">4 (Yay! I'm a fan.)</label>
                                 </li>
                                 <li class="selector star-selector-li-5" data-label="5 (Woohoo! As good as it gets!)">
                                    <input id="rating-5" type="radio" value="5"  name="rating" class="star-selector-input">
                                    <label class="star-selector_label" for="rating-5">5 (Woohoo! As good as it gets!)</label>
                                 </li>
                               </ul>
                                    <input type="hidden" name="rnum" value="${dto.rnum}">   
                                    <input type="hidden" name="star" class="star">
                                    <input type="hidden" name="mode" value="write">
                                    <input type="hidden" name="where" value="rest">
                           </fieldset>
                          </form>
                        </div>
                        <div class="resIMG_div_34">
                           <div class="resIMG_div_35">
                              <span class="resIMG_span_5">
                                 <span class="resIMG_span_6">
                                    Ignore this suggestion for a while
                                 </span>
                              </span>
                           </div>
                        </div>   
                     </div>
                  </div>
               </div>
            </li>
           </c:forEach>
         </ul>
         <div class="resIMG_div_36">
            <a class="resIMG_a_2">
               <span class="resIMG_span_7">
                  <svg class="resIMG_svg_3">
                     <path d="M18.364 9.525L16.95 8.11 12 13.06 7.05 8.11 5.636 9.526 12 15.89l6.364-6.365z"></path>
                  </svg>
               </span>
               Show more suggestions
            </a>
         </div>
         <div class="resIMG_div_37">
            <div class="resIMG_div_38">
               <div class="resIMG_div_39">
               </div>
            </div>
         </div>
         <div class="resIMG_div_40">
            <span class="resIMG_span_8">
            </span>
         </div>
         <div class="resIMG_div_41">
            <p class="resIMG_p_1">
               Oops, something went wrong.
            </p>
            <button class="resIMG_button_2" type="submit" value="submit">
               <span class="resIMG_span_9">
                  Try Again               
               </span>
            </button>
         </div>
      </div>
   </div>
</div>   
   
  
<script>
   $(document).ready(function() {
      
      
      var mode = '${mode}';
      //로그인 됬을때 화면 
      if(mode == 'write'){
         $('.resIMG_div_3').css("display", "none");
            //$('.resIMG_a_4').text("${name}");
            //$('.resIMG_b_4').text("${reviewcount}");
            //$('.resIMG_p_3').text("${content}");
         
      }else {
      //비로그인 됬을때 화면    
         $('.resIMG_div_42').css("display", "none");
         $('.resIMG_div_43').css("display", "none");
      }
      
      
      $('.selector').hover(function(e) {
         var star = $(e.target).val();
         $(this).parent().removeClass('i-selector-stars--extra-large-0');
         $(this).parent().removeClass('i-selector-stars--extra-large-1');
         $(this).parent().removeClass('i-selector-stars--extra-large-2');
         $(this).parent().removeClass('i-selector-stars--extra-large-3');
         $(this).parent().removeClass('i-selector-stars--extra-large-4');
         $(this).parent().removeClass('i-selector-stars--extra-large-5');
         
         if(star == 0){
            $(this).parent().addClass('i-selector-stars--extra-large-0');
         }else if(star == 1){
            $(this).parent().addClass('i-selector-stars--extra-large-1');
         }else if(star == 2){
            $(this).parent().addClass('i-selector-stars--extra-large-2');
         }else if(star == 3){
            $(this).parent().addClass('i-selector-stars--extra-large-3');
         }else if(star == 4){
            $(this).parent().addClass('i-selector-stars--extra-large-4');
         }else if(star == 5){
            $(this).parent().addClass('i-selector-stars--extra-large-5');
         } 
      });
      
         
      $('.selector').mouseleave(function(){
         $(this).parent().removeClass('i-selector-stars--extra-large-0');
         $(this).parent().removeClass('i-selector-stars--extra-large-1');
         $(this).parent().removeClass('i-selector-stars--extra-large-2');
         $(this).parent().removeClass('i-selector-stars--extra-large-3');
         $(this).parent().removeClass('i-selector-stars--extra-large-4');
         $(this).parent().removeClass('i-selector-stars--extra-large-5');
      });   
      
      $('.selector').click(function(e){    
         var star = $(e.target).val();
         $('.star').val(star);

         $(this).parent().parent().parent().submit();

      });
      
      
      $(".resIMG_a_2").click(function(e){
         $('.resIMG_ul_2').css("max-height", "1056px");
            $(".resIMG_a_2").click(function(e){
               $('.resIMG_ul_2').css("max-height", "1584px");
            
         })
      })
      
   });   
   

   
   </script>
<%@ include file="../bottom.jsp" %>
