<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
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
      <!--  
         <div class="resIMG_div_45">
            <div class="resIMG_div_46">
               <div class="resIMG_div_47">
      -->         
                  <div class="resIMG_div_48">
                     <div class="resIMG_div_49">
                        <div class="resIMG_div_50">
                           <div class="resIMG_div_51">
                              <div class="resIMG_div_52">
                                 <a class="resIMG_a_3" href="#">
                                    <img class="resIMG_img_3" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${filename}">   
                                 </a>
                              </div>
                           </div>
                           <div class="resIMG_div_53">
                              <ul class="resIMG_ul_4">
                                 <li   class="resIMG_li_4">
                                    <a class="resIMG_a_4" href="#">
                                       <c:if test="${empty nickname}"> 
					   					   <a href="#">${email}</a>
					   				   </c:if>
					   				   <c:if test="${!empty nickname}">
					   					   <a href="#">${nickname}</a>
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
                  <!-- 
               </div>
            </div>   
         </div>
         -->
         <!--  
         <div class="resIMG_div_61">
            <h3 class="resIMG_h3_2">
               Share Your Review            
            </h3>
            <ul class="resIMG_ul_5">
               <li class="resIMG_li_6">
                  <button class="resIMG_button_3">
                     <span class="resIMG_span_15">
                        <div class="resIMG_div_62">
                           <span class="resIMG_span_16">
                              <svg class="resIMG_svg_8">
                                 <path d="M21 6.417A7.364 7.364 0 0 1 18.88 7a3.708 3.708 0 0 0 1.623-2.044 7.41 7.41 0 0 1-2.346.896 3.693 3.693 0 0 0-6.292 3.368 10.483 10.483 0 0 1-7.612-3.858c-.318.545-.5 1.18-.5 1.856a3.69 3.69 0 0 0 1.643 3.074 3.674 3.674 0 0 1-1.673-.462v.047c0 1.79 1.273 3.28 2.962 3.62a3.714 3.714 0 0 1-1.667.064 3.697 3.697 0 0 0 3.45 2.57 7.41 7.41 0 0 1-4.587 1.58 7.8 7.8 0 0 1-.88-.05 10.45 10.45 0 0 0 5.66 1.66c6.8 0 10.51-5.627 10.51-10.507 0-.16 0-.32-.01-.48A7.496 7.496 0 0 0 21 6.418z"></path>
                              </svg>
                           </span>
                            Share on Twitter
                        </div>
                     </span>
                  </button>
               </li>
               <li class="resIMG_li_6">
                  <button class="resIMG_button_4">
                     <span class="resIMG_span_17">
                        <div class="resIMG_div_63">
                           <span class="resIMG_span_18">
                              <svg class="resIMG_svg_9">
                                 <path d="M13 21v-8h3.15l.412-3H13V7.547C13 6.62 13.65 6 14.98 6H17V3.126C16 3.086 15.493 3 14.323 3 11.88 3 10 4.49 10 7.23V10H7v3h3v8h3z"></path>
                              </svg>
                           </span>
                            Share on Facebook
                        </div>
                     </span>
                  </button>
               </li>
               <li class="resIMG_li_6">
                  <div class="resIMG_div_64">
                     <span class="resIMG_span_19">
                        <span class="resIMG_span_20">
                           <svg class="resIMG_svg_10">
                              <path d="M14 15H4c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h3v1H4v10h10v-3h1v3c0 .55-.45 1-1 1zm-5.12-4.465L7.463 9.12l3.83-3.827L9 3h6v6l-2.293-2.293-3.828 3.828z"></path>
                           </svg>
                        </span>
                     </span>
                     <span class="resIMG_span_21">
                        <input class="resIMG_input_3" type="text" value="http://www.yelp.com/biz/thai-villa-new-york-2?hrid=EAuO-fRaEqvFynouC-GEAg" readonly>
                     </span> 
                  </div>
               </li>
            </ul>
         </div>
         -->
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
                        <img class="resIMG_img_1" height="150" width="150" src="//s3-media2.fl.yelpcdn.com/bphoto/i2dT3NgbJ68PX9iHygsEfQ/ls.jpg">   
                     </div>
                     <div class="resIMG_div_32">
                        <h3 class="resIMG_h3_1">
                           <a class="resIMG_a_1" href="#">
                              <span class="resIMG_span_3">${dto.rname}</span>
                           </a>   
                        </h3>
                        <div class="resIMG_div_32-1">
                           ${dto.raddress}
                        </div>
                        <div class="resIMG_div_33">
                          <form name="starpointF" method="get" action="review_write">
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
                              <span class="resIMG_span_4" aria-hidden="true">
                                 <svg class="resIMG_svg_2">
                                    <path d="M10.414 9l4.043-4.043a1 1 0 0 0-1.414-1.414L9 7.586 4.957 3.543a1 1 0 0 0-1.414 1.414L7.586 9l-4.043 4.043a1 1 0 0 0 1.414 1.414L9 10.414l4.043 4.043a.997.997 0 0 0 1.414 0 1 1 0 0 0 0-1.414L10.414 9z"></path>
                                 </svg>
                              </span>
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
            <a class="resIMG_a_2" href="#">
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
