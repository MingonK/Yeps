<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>${restaurantDTO.rname}</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/event_update_photo.css?ver=1"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/restaurant_update_photo.css?ver=1"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
</head>
<%@ include file="../top.jsp"%>
	<div id="insert_photo_super_wrap" style="display: flex;">
		<div id="insert_photo_middle_wrap">
			<div id="result_photo_status_text">
				<p>사진을 성공적으로 삭제했습니다.</p>
			</div>
			<div id="insert_photo_main_wrap">
				<div style="margin: 0 -15px;">
					<div id="insert_photo_main">
						<div id="user_photo_intro">
							<h2>
								<a href="restaurant_content?rnum=${restaurantDTO.rnum}">
									${restaurantDTO.rname}:
								</a> 
								Add Photos
							</h2>
							<a href="restaurant_photoList?rnum=${restaurantDTO.rnum}">View all photos</a>
							<br>
							<br>
						</div>
						<div id="restaurant_photo_drop_container">
							<div id="file_uploader_container" data-component-bound="true">
								<div id="file_uploader" data-component-bound="true" style="opacity: 1;">
									<div id="file_drop_area">
										<div id="file_drop_area_inner">
											<h1>업로드할 파일을 올려주세요.</h1>
											<fieldset id="or_line">
												<legend>OR</legend>
											</fieldset>
											<div id="file_browser" style="pointer-events: auto;">
												<input type="file" id="file_browser_input" onchange="javascript:fileCheck(this)" multiple accept="image/gif, image/jpeg, image/png">
												<button type="submit" id="file_browser_button">
													<span>Browse Files</span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div id="file_upload_help_container">
								<div id="file_upload_help_units">
									<img width="150" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/basic/shaky.png">
									<p id="file_upload_help_text">
										초점이 맞지 않는 사진을 올리지 않도록 하십시오.
									</p>
								</div>
								
								<div id="file_upload_help_units">
									<img width="150" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/basic/camera-flash.png">
									<p id="file_upload_help_text">
										사진이 밝게 보여야 해요. 카메라에 플래시를 사용하는 것을 권장합니다.
									</p>
								</div>
								
								<div id="file_upload_help_units">
									<img width="150" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/basic/filters.png">
									<p id="file_upload_help_text">
										필터를 너무 많이 사용하지 마세요. 현실감이 핵심입니다.
									</p>
								</div>
								
								<div id="file_upload_help_units">
									<img width="150" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/basic/biz-photos.png">
									<p id="file_upload_help_text">
										마지막으로, 이 매장에 맞는 사진만 올려 주세요.
									</p>
								</div>
							</div>
						</div>
						
						
						<div id="restaurant_photo_upload_container">
							<div id="finish_upload_header">
 								<div id="upload_title_wrap">
 									<div id="upload_title_success">
 										<span style="width: 18px; height: 18px; fill: #41a700;" class="icon">
 											<svg class="icon_svg" height="100%" viewBox="0 0 18 18" width="100%">
 												<path d="M7.232 14.273L1.93 8.97a1 1 0 1 1 1.413-1.414l3.89 3.89 7.424-7.426a1 1 0 0 1 1.414 1.414l-8.837 8.84z"></path>
 											</svg>
 										</span>
 										<h3 id="upload_title_text">
 											Perfect!
 											<b>Next, check your size photos below</b>
 										</h3>
 									</div>
 								</div>
 								
 								<div id="finish_button_wrap">
 									<div id="finish_button_container">
 										<button type="submit" value="submit" id="finish_button">
 											<span>Finish</span>
 										</button>
 									</div>
 								</div>
 							</div>
 							<ul id="photo_box_grid_wide">
 								<!-- 반복문 돌 자리 -->
 							</ul>
						</div>
						
						<form id="finishForm" action="restaurant_photoList" method="post">
							<input type="hidden" name="rnum" value="${restaurantDTO.rnum}">
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="loading_wapper">
		<div class="loading_img" style="top: 40%; left: 45%;">
		</div>
	</div>
	
	<script type="text/javascript">
		var rnum ='${restaurantDTO.rnum}';
		var rname = '${restaurantDTO.rname}';
 		function fileCheck() {
 			var fileObject = document.getElementById('file_browser_input');
 			var files = fileObject.files;
 			
			var data = new FormData();
 			for(var i = 0; i < files.length; i++) {
 				var pathpoint = files[i].name.lastIndexOf('.');
				var filepoint = files[i].name.substring(pathpoint+1, files[i].length);
				var filetype = filepoint.toLowerCase();

				if(filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg') {
					if(files[i].size > 10485760) {
						alert("이미지의 크기가 10MB를 초과할 수 없습니다.");
						return false;
					} else {
						data.append('file'+i, files[i]);
					}
				} else if(filetype == 'bmp') {
 					alert('.bmp형식의 이미지는 적절한 형식이 아닙니다. 다른 형식의 이미지 파일을 선택해주세요.');
 					return false;
 				} else {
					alert('이미지 파일만 선택할 수 있습니다.');
					return false;
				}
 			}
 			
 			$(document).ajaxStart(function() {
 				$('body').css('overflow', 'hidden');
				$('.loading_wapper').fadeIn(500);
			})
			
			$(document).ajaxStop(function() {
				$('body').css('overflow', 'auto');
				$('.loading_wapper').fadeOut(500);
			})
	
 			var url = "restaurant_fileUpLoad?rnum=${restaurantDTO.rnum}";
 			$.ajax({
 				url: url,
 				method: 'post',
 				data: data,
 				dataType: 'json',
 				processData: false,
 				contentType: false,
 				success: function(responseData) {
 					if(responseData.failed) {
 						alert("업로드할 수 없는 파일이 존재합니다.");
 						return false;
 					} else if (responseData.created_fail) {
 						alert(responseData.created_fail);
 						return false;
 					} else if (responseData.upload_failed) {
 						alert(responseData.upload_failed)
 						return false;
 					} else {
 						var size = responseData.fileList.length;
 						$(window).on('hashchange', function() {
 							$('#user_photo_intro > h2').empty();
 	 						$('#user_photo_intro > h2').append('<a href="restaurant_content?rnum="' + rnum + '>' + rname +' : </a> Your Photos');
 	 						$('#upload_title_text > b').text('Next, check your ' + size + ' photos below');
 	 						$('#restaurant_photo_drop_container').hide();
 	 						 						
 	 						$.each(responseData.fileList, function(i, item) {
 	 							$('#photo_box_grid_wide').append(
 	 								'<li id="uploaded_photo">' +
 	 									'<div id="photo_box">' +
 	 										'<img id="photo_box_img" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/'+ item.filename +'">' +
 	 										'<div id="photo_box_delete">' +
 	 											'<a id="photo_box_action_link">' +
 	 												'<span style="width: 24px; height: 24px; fill: #fff;" class="icon">' +
 	 													'<svg class="icon_svg" height="100%" viewBox="0 0 24 24" width="100%">' + 
 	 														'<path d="M5 7V5a1 1 0 0 1 1-1h4V3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v1h4a1 1 0 0 1 1 1v2H5zm13 12a3 3 0 0 1-3 3H9a3 3 0 0 1-3-3V8h12v11zm-8-8H9v8h1v-8zm5 0h-1v8h1v-8z"></path>' +
 	 													'</svg>' +
 	 												'</span>' +
 	 											
 	 												'<span id="tooltip_wrapper">' +
 														'<span id="tooltip">' +
 															'Delete' +
 														'</span>' +
 	 												'</span>' +
 	 											'</a>' +
 	 										'</div>' +
 	 									'</div>' +
 									'</li>'
 	 							);
 	 						})
 	 						$('#restaurant_photo_upload_container').show();
 							
 						});
 						
 					}
 				}
 			});		
 		}
	</script>
	
	
	<script>
		var rnum ='${restaurantDTO.rnum}';
		var rname = '${restaurantDTO.rname}';
		$(function() {
			var objDragAndDrop = $('#file_uploader_container');
			objDragAndDrop.on('dragenter', function (e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('opacity', '0.33');
			});	

			objDragAndDrop.on('dragleave', function (e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('opacity', '1');
			});
	
			objDragAndDrop.on('dragover', function (e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('opacity', '0.33');
			});
	
			objDragAndDrop.on('drop', function (e) {
				e.preventDefault();
				$(this).css('opacity', '1');
	
				var files = e.originalEvent.dataTransfer.files;
				if(files.length < 1) {
					return;
				}
				
				for(var i = 0; i < files.length; i++) {
					var pathpoint = files[i].name.lastIndexOf('.');
					var filepoint = files[i].name.substring(pathpoint+1, files[i].name.length);
					var filetype = filepoint.toLowerCase();
					
					if(filetype != 'jpg' && filetype != 'gif' && filetype != 'png' && filetype != 'jpeg') {
						alert('이미지 파일만 선택할 수 있습니다.');
						return;
					}
					if(filetype == 'bmp') {
						alert('.bmp형식의 이미지는 적절한 형식이 아닙니다. 다른 형식의 이미지 파일을 선택해주세요.');
						return;	
					}
					if(files[0].size > 10485760) {
						alert("이미지의 크기가 10MB를 초과할 수 없습니다.");
						return;
					}
				}
	
				(F_FileMultiUpload = function(files, objDragAndDrop) {
					var data = new FormData();
					for(var i = 0; i < files.length; i++) {
						data.append('files'+i, files[i]);
					}
					
					$(document).ajaxStart(function() {
						$('body').css('overflow', 'hidden');
						$('.loading_wapper').fadeIn(500);
					})
					
					$(document).ajaxStop(function() {
						$('body').css('overflow', 'auto');
						$('.loading_wapper').fadeOut(500);
					})
					
					var url = "restaurant_fileUpLoad?rnum=${restaurantDTO.rnum}";
					$.ajax({
						url: url,
						method: 'post',
						data: data,
						dataType: 'json',
						processData: false,
						contentType: false,
						success: function(responseData) {
							if(responseData.failed) {
								alert("업로드할 수 없는 파일이 존재합니다.");
								return false;
							} else if (responseData.created_fail) {
								alert(responseData.created_fail);
								return false;
							} else if (responseData.upload_failed) {
								alert(responseData.upload_failed);
								return false;
							}  else {
								var size = responseData.fileList.length;
		 						$(window).on('hashchange', function() {
		 							$('#user_photo_intro > h2').empty();
		 	 						$('#user_photo_intro > h2').append('<a href="restaurant_content?rnum="' + rnum + '>' + rname +' : </a> Your Photos');
		 	 						$('#upload_title_text > b').text('Next, check your ' + size + ' photos below');
		 	 						$('#restaurant_photo_drop_container').hide();
		 	 						 						
		 	 						$.each(responseData.fileList, function(i, item) {
		 	 							$('#photo_box_grid_wide').append(
		 	 								'<li id="uploaded_photo">' +
		 	 									'<div id="photo_box">' +
		 	 										'<img id="photo_box_img" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/'+ item.filename +'">' +
		 	 										'<div id="photo_box_delete">' +
		 	 											'<a id="photo_box_action_link">' +
		 	 												'<span style="width: 24px; height: 24px; fill: #fff;" class="icon">' +
		 	 													'<svg class="icon_svg" height="100%" viewBox="0 0 24 24" width="100%">' + 
		 	 														'<path d="M5 7V5a1 1 0 0 1 1-1h4V3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v1h4a1 1 0 0 1 1 1v2H5zm13 12a3 3 0 0 1-3 3H9a3 3 0 0 1-3-3V8h12v11zm-8-8H9v8h1v-8zm5 0h-1v8h1v-8z"></path>' +
		 	 													'</svg>' +
		 	 												'</span>' +
		 	 											
		 	 												'<span id="tooltip_wrapper">' +
		 														'<span id="tooltip">' +
		 															'Delete' +
		 														'</span>' +
		 	 												'</span>' +
		 	 											'</a>' +
		 	 										'</div>' +
		 	 									'</div>' +
		 									'</li>'
		 	 							);
		 	 						})
		 	 						$('#restaurant_photo_upload_container').show();
		 							
		 						});
							}
						}
					});
				});
				F_FileMultiUpload(files, objDragAndDrop);
			});
		});
		
		$(document).ready(function() {
			
			$('#file_browser_button').hover(function() {
				$(this).css('background-color', 'red');
			})
			$('#file_browser_button').mouseleave(function() {
				$(this).css('background-color', '#d90007');
			})
			$('#file_browser_button').click(function() {
				$('#file_browser_input').click();				
			})
		});
		
		
		$(document).on('click', '#photo_box_action_link', function() {
			var src = $(this).parent().parent().children('#photo_box_img').attr('src');
			var pathpoint = src.lastIndexOf('/');
			var filename = src.substring(pathpoint+1, src.length);
			$(document).ajaxStart(function() {
				$(this).parent().parent().parent().css('opacity', '1');
			})
			
			$(document).ajaxStop(function() {
				$(this).parent().parent().parent().css('opacity', '0.3');
			})
			$.ajax({
		        type : 'post',
		        url : 'restaurant_delete_ajax?rnum=' + rnum + '&filename=' + filename,
		        dataType : 'json',
		        async: false,
		        success : function(responseData){
		        	if(responseData.url) {
		        		window.location = responseData.url; 
 		        	}
		        	if(responseData.success) {
		        		$(this).parent().parent().parent().css('opacity', '0');
		        		$(this).parent().parent().parent().remove();
		        	}
		        }
			});
		});
		
		$(document).on('click', '#finish_button', function() {
			$('#finishForm').submit();
		})
		
		
	</script>
<%@ include file="../bottom.jsp"%>
