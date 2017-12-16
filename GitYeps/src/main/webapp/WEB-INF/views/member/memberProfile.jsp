<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../style.jsp"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css?ver=1" />
<script src="//code.jquery.com/jquery.min.js?ver=1"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js?ver=1"></script>
	
<html>
<head>
<title>profile</title>

<script type="text/javascript">
	var mode = "${param.mode}";
	$(function() { 
		if(mode == 'signup'){
			$("#login").hide();
			$('#join').show();
		}else{
			$("#login").show();
			$('#join').hide();
		}
	});
	$(document).ready(function(){
        $('.profile-nav_items > li > a').click(function( e ){
           $('.profile-nav_items > li > a').removeClass('is-active');
           $(this).addClass('is-active');
        })
     });
</script>
</head>
<body>
	<div class="profile-content-wrap">
		<div class="profile-container">                    
			<div class="profile-settings-container">
				<div class="profile-column-alpha">
					<div class="profile-title-menus">
						<div class="profile-title-header">
							<div class="profile-titled-header_content">
                    			<h3>
                    				<c:set value="${sessionScope.memberinfo.name}" var="memberName"/>
                    				<c:choose>
                    					<c:when test="${fn:length(memberName) > 7}">
                    						<c:out value="${fn:substring(memberName,0,6)}"/>..
                    					</c:when>
                    					<c:otherwise>
                    						<c:out value="${memberName}"/>
                    					</c:otherwise> 
                    				</c:choose>
                    			’s Account Settings
                    			</h3>
                			</div>
						</div>
						
						<ul class="profile-nav_items">
							<li class="profile-nav_item">
								<a class="profile-nav_link is-active" href="#">
									<div class="profile-nav_link-content profile-arrange">
										<div class="profile-arrange_unit profile-arrange_unit--fill">
											<span class="profile-nav_link-label">Profile</span>
										</div>
									</div>
								</a>
							</li>
							<li class="profile-nav_item">
								<a class="profile-nav_link" href="#">
									<div class="profile-nav_link-content profile-arrange">
										<div class="profile-arrange_unit profile-arrange_unit--fill">
											<span class="profile-nav_link-label">Password</span>
										</div>
									</div>
								</a>
							</li>
						</ul>
					</div>
					<div class="titled-nav-header" role="presentation"></div>
				</div>
				
				<div class="profile-column-beta">
					<div class="profile-section-header">
        				<h2>Profile</h2>
    				</div>
    				
    				<form action="member_profile" class="profilef" method="post" name="memberProfile">
						<div class="psection">
							<h4>Your Profile Photo
								<strong><a href="#">(Add/Edit)</a></strong>
							</h4>
							<div class="photo-box pb-m">
								<a class="js-analytics-click" data-analytics-label="user-photo" href="#">
									<img alt="" class="photo-box-img" src="https://s3-media4.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/m.jpg">
								</a>
							</div>
						</div>
						<label for="name">Name</label>
						<span class="help-block">This field is required.</span>
						<input id="name" maxlength="20" name="name" required placeholder="" size="30" type="text" value="${sessionScope.memberinfo.name}">
						<label for="nickname">Nickname</label>
						<span class="help-block">The Boss, Calamity Jane, The Prolific Reviewer</span>
						<input id="nickname" maxlength="50" name="nickname" placeholder="" size="30" type="text" value="">	<!-- 닉네임 -->
						<button type="submit" value="submit" class="ybtn ybtn-primary"><span>Save Changes</span></button>
						<a href="member_index">Cancel</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<%@include file="../bottom.jsp"%>