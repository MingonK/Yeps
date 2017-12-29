<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>Details</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/member.css?ver=1"/>"/>
<script src="//code.jquery.com/jquery.min.js?ver=1"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js?ver=2"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
</head>
<%@ include file="../top.jsp"%>
   <div class="member_details_wrap">
      <div class="member_details_top_shelf">
         <div class="member_details_content_container">
            <div class="member_details_user_profile_container">
               <div class="member_details_user_profile_avatar">
                  <div class="member_details_photo_slideshow_wrap">
                     <div class="member_details_photo_slideshow">
                        <c:choose>
                           <c:when test="${empty getPhotoList}">
                              <div class="member_details_photo_slideshow_image">
                                 <a href="member_details?mnum=${memberDTO.mnum}">
                                    <img class="photo-box-img" height="250" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/basic/user_medium_square.png" width="250" style="height: 215px; width:auto;">
                                 </a>
                              </div>
                              <c:if test="${memberDTO.mnum == sessionScope.memberinfo.mnum}">
	                              <div class="member_photo_box_actions">
	                                 <a class="member_photo-box_action-link" href="member_photos">
	                                    <span aria-hidden="true" style="width: 18px; height: 18px;" class="member_icon">
	                                       <svg class="member_icon_svg">
	                                          <path d="M15 15H3a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2zM9 4.75a4.25 4.25 0 1 0 0 8.5 4.25 4.25 0 0 0 0-8.5zM11 10h-1v1a1 1 0 0 1-2 0v-1H7a1 1 0 0 1 0-2h1V7a1 1 0 0 1 2 0v1h1a1 1 0 0 1 0 2z"></path>
	                                       </svg>
	                                    </span>
	                                       <span class="member_photo-box_action-text">Add a photo</span>
	                                 </a>
	                              </div>
                              </c:if>
                           </c:when>
                           <c:otherwise>
                              <div class="member_details_photo_slideshow_image cycle-slideshow" data-cycle-speed="1000" id="slideshow_img">
                                 <a class="member_photo-box_action-link" href="#"></a>
                              </div>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </div>
               </div>
               <div class="member_details_user_profile_content_wrap">
                  <div class="member_profile_avatar-dummy" aria-hidden="true"></div>
                  <div class="member_profile_info">
                     <h1>
                        <c:set value="${memberDTO.name}" var="memberName"/>
                               <c:choose>
                                  <c:when test="${fn:length(memberName) > 7}">
                                     <c:out value="${fn:substring(memberName,0,6)}"/>..
                                  </c:when>
                                  <c:otherwise>
                                     <c:out value="${memberName}"/>
                                  </c:otherwise> 
                               </c:choose>
                     </h1>
                     <h3 class="member_location">
                        <c:choose>
                           <c:when test="${!empty memberDTO.address}">
                              <c:forTokens items="${memberDTO.address}" delims=" " begin="1" end="2" var="addr">
                                 ${addr}
                              </c:forTokens>
                           </c:when>
                           <c:otherwise>
                              	서울특별시
                           </c:otherwise>
                        </c:choose>
                     </h3>
                     <ul class="user-passport-stats">
                        <li class="review-count">
                           <span aria-hidden="true" style="fill: #f15c00; width: 24px; height: 24px;" class="icon icon--24-review icon--size-24">
                              <svg class="icon_svg">
                                 <path d="M21 6a3 3 0 0 0-3-3H6a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h12a3 3 0 0 0 3-3V6zm-5.88 10.428l-3.16-1.938-3.05 2.01.59-3.457L7 10.596l3.457-.505L11.96 6.5l1.582 3.59 3.458.506-2.5 2.447.62 3.385z"></path>
                              </svg>
                           </span>
                           <strong>${memberDTO.reviewcount}</strong> Reviews
                        </li>
                        <li class="photo-count">
                           <span aria-hidden="true" style="fill: #f15c00; width: 24px; height: 24px;" class="icon icon--24-camera icon--size-24">
                              <svg class="icon_svg">
                                 <path d="M19 20H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h2.184A2.99 2.99 0 0 1 10 4h4a2.99 2.99 0 0 1 2.816 2H19a3 3 0 0 1 3 3v8a3 3 0 0 1-3 3zM12.005 8.5a4.5 4.5 0 1 0 0 9 4.5 4.5 0 0 0 0-9zm0 7a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"></path>
                              </svg>
                           </span>
                           <strong>${memberDTO.imagecount}</strong> Photos
                        </li>
                     </ul>
                  </div>
                  <div class="member_profile_actions">
                     <ul class="member_action-link-list">
                        <c:if test="${memberDTO.mnum == sessionScope.memberinfo.mnum}">
                           <li>
                              <a class="member_detail_arrange" href="member_photos" rel="">
                                 <div class="member_action-link_icon">
                                    <span aria-hidden="true" style="width: 18px; height: 18px;" class="icon member_icon--currentColor">
                                       <svg class="icon_svg">
                                          <path d="M15 15H3a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2zM9 4.75a4.25 4.25 0 1 0 0 8.5 4.25 4.25 0 0 0 0-8.5zM11 10h-1v1a1 1 0 0 1-2 0v-1H7a1 1 0 0 1 0-2h1V7a1 1 0 0 1 2 0v1h1a1 1 0 0 1 0 2z"></path>
                                       </svg>
                                    </span>
                                 </div>
                                 <div class="member_action-link_label">Add Profile Photos</div>
                              </a>
                           </li>
                           <li>
                              <a class="member_detail_arrange" href="member_profile" rel="">
                                 <div class="member_action-link_icon">
                                    <span aria-hidden="true" style="width: 18px; height: 18px;" class="icon member_icon--currentColor">
                                       <svg class="icon_svg">
                                          <path d="M14 3H4a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2zM4 6.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-3zM14 12H4v-1h10v1zm0-5h-4V6h4v1zm0 2h-4V8h4v1z"></path>
                                       </svg>
                                    </span>
                                 </div>
                                 <div class="member_action-link_label">Update Your Profile</div>
                              </a>
                           </li>
                        </c:if>
                        <c:if test="${memberDTO.mnum != sessionScope.memberinfo.mnum}">
                           <li>
                              <a class="member_detail_arrange" href="#" rel="">
                                 <div class="member_action-link_icon">
                                    <span aria-hidden="true" style="width: 18px; height: 18px;" class="icon member_icon--currentColor">
                                       <svg class="icon_svg">
                                          <path d="M2 4v6a2 2 0 0 0 2 2h1v3l4-3h5a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"></path>
                                       </svg>
                                    </span>
                                 </div>
                                 <div class="member_action-link_label">Send message</div>
                              </a>
                           </li>
                        </c:if>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="member_details_content_container">
         <div class="member_details_content_layout_block">
            <div class="details-column-alpha">
               <div class="details_section">
                  <div class="details-title-menus">
                     <div class="details_title-header">
                        <div class="details_arrange">
                           <div class="details_arrange_unit">
                              <div class="details-titled-header_content">
                                      <h3>
                                         <c:set value="${memberDTO.name}" var="memberName"/>
                                         <c:choose>
                                            <c:when test="${fn:length(memberName) > 7}">
                                               <c:out value="${fn:substring(memberName,0,6)}"/>..
                                            </c:when>
                                            <c:otherwise>
                                               <c:out value="${memberName}"/>
                                            </c:otherwise> 
                                         </c:choose>’s Profile
                                      </h3>
                                  </div>
                               </div>
                        </div>
                     </div>
                     <ul class="profile-nav_items">
                        <li class="titled-nav_item">
                           <a id="profile_overview" class="profile-nav_link">
                              <div class="details_nav_link-content details_arrange">
                                 <div class="arrange_unit">
                                    <span aria-hidden="true" style="width: 24px; height: 24px;" class="icon details-nav_icon">
                                       <svg class="icon_svg">
                                          <path d="M4.37 22c.278-4.762 3.587-8 7.63-8 4.043 0 7.352 3.238 7.63 8H4.37zM12 12a5 5 0 1 1 0-10 5 5 0 0 1 0 10z"></path>
                                       </svg>
                                    </span>
                                 </div>
                                 <div class="arrange_unit arrange_unit-fill">
                                    <span class="titled-nav_link-label">Profile Overview</span>
                                 </div>
                              </div>
                           </a>
                        </li>
                        <li class="titled-nav_item">
                           <a id="profile_reviews" class="profile-nav_link">
                              <div class="details_nav_link-content details_arrange">
                                 <div class="arrange_unit">
                                    <span aria-hidden="true" style="width: 24px; height: 24px;" class="icon details-nav_icon">
                                       <svg class="icon_svg">
                                          <path d="M21 6a3 3 0 0 0-3-3H6a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h12a3 3 0 0 0 3-3V6zm-5.88 10.428l-3.16-1.938-3.05 2.01.59-3.457L7 10.596l3.457-.505L11.96 6.5l1.582 3.59 3.458.506-2.5 2.447.62 3.385z"></path>
                                       </svg>
                                    </span>
                                 </div>
                                 <div class="arrange_unit arrange_unit-fill">
                                    <span class="titled-nav_link-label">Reviews</span>
                                 </div>
                              </div>
                           </a>
                        </li>
                        <li class="titled-nav_item">
                           <a id="profile_events" class="profile-nav_link">
                              <div class="details_nav_link-content details_arrange">
                                 <div class="arrange_unit">
                                    <span aria-hidden="true" style="width: 24px; height: 24px;" class="icon details-nav_icon">
                                       <svg class="icon_svg">
                                          <path d="M18 21H6a3 3 0 0 1-3-3V6a3 3 0 0 1 3-3 1 1 0 0 1 2 0h8a1 1 0 0 1 2 0 3 3 0 0 1 3 3v12a3 3 0 0 1-3 3zm1-13H5v10c0 .55.45 1 1 1h12c.55 0 1-.45 1-1V8zm-5.634 7.723L12 18l-1.366-2.277a3.5 3.5 0 1 1 2.732 0zM12 11.25a1.25 1.25 0 1 0 0 2.5 1.25 1.25 0 0 0 0-2.5z"></path>
                                       </svg>
                                    </span>
                                 </div>
                                 <div class="arrange_unit arrange_unit-fill">
                                    <span class="titled-nav_link-label">Events</span>
                                 </div>
                              </div>
                           </a>
                        </li>
                        <li class="titled-nav_item">
                           <a id="profile_tips" class="profile-nav_link">
                              <div class="details_nav_link-content details_arrange">
                                 <div class="arrange_unit">
                                    <span aria-hidden="true" style="width: 24px; height: 24px;" class="icon details-nav_icon">
                                       <svg class="icon_svg">
                                          <path d="M15 15.32V18H9v-2.68C6.64 14.19 5 11.79 5 9c0-3.87 3.13-7 7-7s7 3.13 7 7c0 2.79-1.64 5.19-4 6.32zM10.5 6C9.67 6 9 6.67 9 7.5S9.67 9 10.5 9 12 8.33 12 7.5 11.33 6 10.5 6zM13 22h-2a2 2 0 0 1-2-2h6a2 2 0 0 1-2 2z"></path>
                                       </svg>
                                    </span>
                                 </div>
                                 <div class="arrange_unit arrange_unit-fill">
                                    <span class="titled-nav_link-label">Tips</span>
                                 </div>
                              </div>
                           </a>
                        </li>
                     </ul>
                     <div class="titled-nav-header" role="presentation"></div>
                  </div>
               </div>
            </div>
            <div class="details-column-beta_overview">
               <div class="member_details_overview">
                  <div class="member_details_overview_activity">
                     <h2>Notifications</h2>
                     <p class="member_details-no_notifications">No new friend requests or compliments at this time.</p>
                     <div class="member_details-overview_reviews">
                     <!-- 작성한 리뷰가 있을 경우 -->
                     </div>
                     <div class="member_details_overview_self_feed">
                        <!-- 작성한 리뷰가 없을 경우 -->
                        <div class="member_section">
                           <div class="member_section-header">
                              <h2>Recent Activity</h2>
                           </div>
                           <div class="member_feeds">
                              <ul class="content-list">
                                 <li data-section-id="self">
                                    <p class="member_no-recent-activity">
                                       We don't have any recent activity for you right now.
                                    </p>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="member_details_overview_sidebar">
                     <h3>
                        About
                        <c:set value="${memberDTO.name}" var="memberName"/>
                               <c:choose>
                                  <c:when test="${fn:length(memberName) > 7}">
                                     <c:out value="${fn:substring(memberName,0,6)}"/>..
                                  </c:when>
                                  <c:otherwise>
                                     <c:out value="${memberName}"/>
                                  </c:otherwise> 
                               </c:choose>
                     </h3>
                     <div class="member_section">
                        <ul class="memberlist">
                           <li>
                              <h4>Location</h4>
                              <p>
                                 <c:choose>
                                    <c:when test="${!empty memberDTO.address}">
                                       <c:forTokens items="${memberDTO.address}" delims=" " begin="1" end="2" var="addr">
                                          ${addr}
                                       </c:forTokens>
                                    </c:when>
                                    <c:otherwise>
                                       서울특별시
                                    </c:otherwise>
                                 </c:choose>
                              </p>
                           </li>
                           <li>
                              <h4>YEPSing Since</h4>
                              <p>${memberDTO.joindate}</p>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="details-column-beta_reviews">
               <div class="member_detals_section_header">
                  <h2 class="section-header_title">Reviews</h2>
               </div>
               <p>It’s your turn ? review everything from your favorite burger to your favorite root canal. Write reviews to contribute to the Yelp community and help your friends find all the local gems that you love.</p>
               <a href="review_write" class="ybtn ybtn-primary">Write a Review</a>
               <div class="member_reviews-hero">
                  <div class="member_u-relative">
                     <img class="reviews-hero-img" src="https://s3-media3.fl.yelpcdn.com/assets/2/www/img/1f978654eb34/user_details/reviews-hero.png" srcset="https://s3-media1.fl.yelpcdn.com/assets/2/www/img/ee351f5cfa68/user_details/reviews-hero@2x.png 2x">
                     <div class="member_reviews-widget member_u-bg-color">
                        <div class="member_reviews-widget_action-bar">
                           <div class="member_reviews-widget_action-bar-buttons">
                              <a class="ybtn ybtn-primary war-button" href="javascript:;">
                                 <span aria-hidden="true" style="width: 24px; height: 24px;" class="member_icon member_icon-currentColor">
                                    <svg class="icon_svg">
                                       <path d="M12 1.5l2.61 6.727 6.89.53-5.278 4.688 1.65 7.055L12 16.67 6.13 20.5l1.648-7.055L2.5 8.757l6.89-.53L12 1.5z"></path>
                                    </svg>
                                 </span>Write a Review
                              </a>
                              <span class="member_ybtn-group">
                                 <a class="ybtn ybtn--small add-photo-button" href="javascript:;">
                                    <span aria-hidden="true" style="width: 18px; height: 18px;" class="member_icon member_icon-currentColor">
                                       <svg class="icon_svg">
                                          <path d="M15 15H3a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2zM9 4.75a4.25 4.25 0 1 0 0 8.5 4.25 4.25 0 0 0 0-8.5zM11 10h-1v1a1 1 0 0 1-2 0v-1H7a1 1 0 0 1 0-2h1V7a1 1 0 0 1 2 0v1h1a1 1 0 0 1 0 2z"></path>
                                       </svg>
                                    </span> Add Photo
                                 </a>
                                 <a class="ybtn ybtn--small share-icon" href="javascript:;">
                                    <span aria-hidden="true" style="width: 18px; height: 18px;" class="member_icon member_icon-currentColor">
                                       <svg class="icon_svg">
                                          <path d="M17.714 6.43L13 10.356v-3.03c-1 0-5.097 1.47-6.286 3.62.274-3.08 4.286-5.5 6.286-5.5V2.5l4.714 3.93zM3 4v10h11v-2.5l1-1V15H2V3h8.5l-1 1H3z"></path>
                                       </svg>
                                    </span> Share
                                 </a>
                                 <a class="ybtn ybtn--small not-bookmarked" href="javascript:;">
                                    <span aria-hidden="true" style="width: 18px; height: 18px;" class="member_icon member_icon-currentColor">
                                       <svg class="icon_svg">
                                          <path d="M14 2H4v14l5-4 5 4V2zm-3.13 7.957L8.978 8.794 7.148 10 7.5 7.926 6 6.458l2.074-.303L8.977 4l.948 2.155L12 6.458l-1.5 1.468.37 2.03z"></path>
                                       </svg>
                                    </span>
                                    <span class="bookmark-icon_label">Bookmark</span>
                                 </a>
                              </span>
                           </div>
                        </div>
                        <div class="reviews-widget--no-hover u-sticky u-absolute"></div>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="details-column-beta_events">
               <div class="member_detals_section_header">
                  <h2>Events</h2>
               </div>
               <p>There’s always lots going on in your city. Use Yelp to explore local activities, save cool events, and even create your own! When you come back here, it’s like your very own social calendar.</p>
               <a href="event_list" class="ybtn ybtn-primary war-button">Discover Things To Do</a>
               <div class="member_events-hero">
                  <div class="member_u-relative">
                     <img class="events-hero-img" src="https://s3-media3.fl.yelpcdn.com/assets/2/www/img/dbef3f175427/user_details/events-hero.png" srcset="https://s3-media1.fl.yelpcdn.com/assets/2/www/img/455f59141ddf/user_details/events-hero@2x.png 2x">
                     <div class="member_events-widget member_u-bg-color">
                        <div class="member_events-widget_action-bar">
                           <h3>Are You Interested?</h3>
                           <div class="member_events_arrange">
                              <div class="member_events_arrange_unit">
                                 <button type="submit" value="submit" class="ybtn ybtn-primary ybtn-full"><span>I'm In!</span></button>
                              </div>
                              <div class="member_events_arrange_unit">
                                 <button type="submit" value="submit" class="member_events_arrange_ybtn ybtn-full"><span>Sounds Cool</span></button>
                              </div>
                           </div>
                        </div>
                        <div class="events-widget--no-hover u-sticky u-absolute"></div>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="details-column-beta_tips">
               <div class="quicktips-container js-quicktips-container">
                  <div class="member_detals_section_header">
                     <h2>Tips</h2>
                  </div>
                  <p>Sorry, no tips yet.</p>
               </div>
            </div>
         </div>
      </div>
   </div>
   
<script type="text/javascript">
   var list = new Array();
   <c:forEach var="memberPhotoDTO" items="${getPhotoList}">
      list.push("${memberPhotoDTO.filename}");
   </c:forEach>
   
   for(var i = 0; i < list.length; i++) {
      var img = document.createElement('img');
      img.src = 'getImage/' + list[i];
//       img.src = 'https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/' + list[i];
      img.style.cursor = 'pointer';
      img.style.width = '100%';
      img.style.height = '100%';
      img.onclick = function() {location.href="member_photolist?mnum=${memberDTO.mnum}"};
      document.getElementById('slideshow_img').appendChild(img);
   }
   
   $(document).ready(function(){
      $(".details-column-beta_overview").show();
      $(".details-column-beta_reviews").hide();
         $(".details-column-beta_events").hide();
       $(".details-column-beta_tips").hide();
      $('.profile-nav_items > li > a').removeClass('is-active');
      $('#profile_overview').addClass('is-active');
       $('.profile-nav_items > li > a').click(function( e ){
          $('.profile-nav_items > li > a').removeClass('is-active');
          $(this).addClass('is-active');
       })
       
       $('#profile_overview').click(function(e){
          $(".details-column-beta_overview").show();
           $(".details-column-beta_reviews").hide();
           $(".details-column-beta_events").hide();
           $(".details-column-beta_tips").hide();
       })
       
       $('#profile_reviews').click(function(e){
          $(".details-column-beta_overview").hide();
           $(".details-column-beta_reviews").show();
           $(".details-column-beta_events").hide();
           $(".details-column-beta_tips").hide();
       })
       
       $('#profile_events').click(function(e){
          $(".details-column-beta_overview").hide();
           $(".details-column-beta_reviews").hide();
           $(".details-column-beta_events").show();
           $(".details-column-beta_tips").hide();
       })
       
       $('#profile_tips').click(function(e){
          $(".details-column-beta_overview").hide();
           $(".details-column-beta_reviews").hide();
           $(".details-column-beta_events").hide();
           $(".details-column-beta_tips").show();
       })
    });
</script>

<%@ include file="../bottom.jsp"%>