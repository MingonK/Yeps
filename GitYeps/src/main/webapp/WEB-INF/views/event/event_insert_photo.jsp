<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Add a Event Photo - Yeps</title>
	<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/event_insert_photo.css"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<style>
		#main_header_baseline_back a:hover, #main_header_baseline_text a:hover, #user_photo_write_info a:hover, #delete_button:hover {
			text-decoration: underline;
		}
		#file_browser_input {
			display: none;
		}
		
	</style>
</head>
<body ondragstart="return false">
<input type="hidden" id="mode" value="${param.mode}">
	<%@ include file="../top.jsp"%>
	<div id="insert_photo_super_wrap" style="background: white; min-width: 1020px; margin: 0; padding: 0; border: 0; font-size: 100%; font: inherit; vertical-align: baseline; display: block;">
		<div id="insert_photo_middle_wrap" style="padding-top: 15px; padding-bottom: 36px; width: 960px; margin: 0 auto; padding-left: 15px; padding-right: 15px;">
			<div id="result_photo_status_text" style="background: #d0ecfb; width: 100%; box-sizing: border-box; position: relative; margin-bottom: 12px; padding: 18px 18px 18px 24px; border-radius: 3px; font-size: 16px; line-height: 1.5em; display: none;">
				<p style="margin: 0; padding-right: 30px; display: block;">Your photo has been removed.</p>
			</div>
			<div id="insert_photo_main_wrap">
				<div id="main_header" style="margin-bottom: 11px; border-bottom: 1px solid #e6e6e6;">
					<div id="main_header_baseline" style="display: table; min-width: 100%; table-layout: auto;">
						<div id="main_header_baseline_text" style="vertical-align: baseline; width: 100%; box-sizing: border-box; display: table-cell;">
							<h2 style="word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; 
							font-weight: bold; margin-bottom: 6px; font-size: 21px; line-height: 1.28571em; color: #d32323; margin: 0 0 6px;">Add A Photo To <a href="event_content?evnum=${eventDTO.evnum}">${eventDTO.eventname}</a></h2>
						</div>
						<div id="main_header_baseline_back" style="vertical-align: baseline; box-sizing: border-box; display: table-cell; white-space: nowrap;">
							<a href="event_content?evnum=${eventDTO.evnum}">Back</a>
						</div>
					</div>
				</div>
				<div id="photo_drop_super_container" style="margin: 0 -15px;">
					<div id="photo_drop_container" style="padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 100%;">
						<div id="file_uploader_container">
							<div id="file_uploder" data-component-bound="true" ondrop="odDrop(event)" ondragover="onDragOver(event)" ondragenter="onDragEnter(event)">
								<div id="file_drop_area" style="width: 100%; margin: 24px auto; padding: 50px 0; display: table; box-sizing: border-box; border: 3px dashed #999; border-radius: 8px; text-align: center; pointer-events: none;">
									<div id="file_drop_area_inner" style="display: table-cell; vertical-align: middle; padding: 12px; text-align: center; pointer-events: none;">
										<h1 style="font-weight: bold; margin-bottom: 6px; font-size: 30px; line-height: 1.2em; color: #333; padding-top: 6px; margin: 0 0 6px; display: block; vertical-align: baseline;">업로드할 파일을 올려주세요.</h1>
										<fieldset id="or_line" style="max-width: 80%; margin: 18px auto; border: none; border-top: 1px solid #ccc; border-bottom: 1px solid transparent; text-align: center; padding: 0; font-size: 100%; font: inherit; vertical-align: baseline; display: block;">
											<legend style="font-size: 1em; padding: 0 15px; margin: 0 auto; color: #666; border: 0; font: inherit; text-align: center; display: block; vertical-align: baseline;">OR</legend>
										</fieldset>
										<div id="file_browser" style="pointer-events: auto;">
											<input type="file" id="file_browser_input" onchange="javascript:fileCheck(this)" accept="image/gif, image/jpeg, image/png">
											<button type="submit" value="submit" id="file_browser_button" style="color: white; box-shadow: 0 1px 1px rgba(0,0,0,0.3); background-color: #d90007;
													display: inline-block; vertical-align: middle; margin: 0; cursor: pointer; border: 1px solid #8d0005; font-weight: bold; text-align: center;
													user-select: none; font-size: 14px; padding: 8px 19px 9px; border-radius: 3px; overflow: visible; align-items: flex-start; box-sizing: border-box;">
												<span>Browse Files</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<div id="sucess_file_upload_header" style="margin-bottom: 11px; border-bottom: 1px solid #e6e6e6; ">
							<h2 style="word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; 
							font-weight: bold; margin-bottom: 6px; font-size: 21px; line-height: 1.28571em; color: #d32323; margin: 0 0 6px;">Photos</h2>
						</div>
						<div id="user_photo_edit_cotainer" style="margin-top: -30px; margin-left: -15px; margin-right: -15px; display: block; font-size: 0; line-height: 1; text-align: left; border-collapse: separate; border-spacing: 30px 0;min-width: 100%; table-layout: auto;">
							<div id="user_photo_edit" style="margin-top: 30px; margin-left: auto; margin-right: auto; padding-left: 15px; padding-right: 15px; width: 33.33333%; display: inline-block; font-size: 14px; line-height: 1.28571em; vertical-align: top; box-sizing: border-box;">
								<div id="user_photo_edit_top" style="margin-bottom: 18px !important; position: relative; display: flex;">
									<div id="user_photo_area" style="border-right: 12px solid transparent; border-left: none;">
										<div id="user_photo_box" style="position: relative;">
											<img alt="event_photo" id="photo_box_img" width="168" height="168" src="#">
										</div>
									</div>
									<div id="user_photo_write_info" style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
										<p style="margin-bottom: 12px; margin: 0; padding: 0; border: 0; font-size: 100%; font: inherit; vertical-align: baseline; display: block; -webkit-margin-before: 1em; -webkit-margin-after: 1em; -webkit-margin-start: 0px; -webkit-margin-end: 0px;">From <a href="#" style="font-weight: bold;">사진 업로더의 아이디 표시</a></p> 
										<form id="info_photo" method="post">
											<input type="hidden" name="photoname" style="display: none; cursor: auto;">
											<button id="delete_button" style="margin: 0 !important; padding: 0 !important; background: none !important; border: 0 !important; outline: 0 !important; color: #0073bb !important; cursor: pointer !important; font-family: inherit !important; font-size: inherit !important; box-shadow: none; overflow: visible; font-weight: normal; align-items: flex-start; text-align: center;">Delete</button> 
										</form>
									</div>
								</div>
								
								<form name="photo_description" method="post" action="#" style="margin-bottom: 18px; display: block;">
									<input type="hidden">
									<input type="hidden">
									<input type="hidden">
									<label style="display: inline-block; font-weight: bold; margin: 0 0 6px; cursor: default;">Description</label>
									<div id="description_container">
										<textarea height="78px;" style="resize: vertical; display: block; box-sizing: border-box; width: 100%; margin: 0 0 18px; padding: 5px 9px; background: #fff; border: 1px solid #999; border-radius: 3px; font-size: 14px; line-height: 1.29em; color: inherit; font: inherit; font-weight: normal; cursor: auto;"></textarea>
									</div>
									<button type="submit" id="Save_button" style="padding: 5px 8px; font-size: 12px; line-height: 1.5em; display: inline-block; vertical-align: middle; margin: 0; cursor: pointer; border: 1px solid; font-weight: bold; text-align: center; user-select: none;border-color: #ccc; color: #666; background-color: #f7f7f7; background: linear-gradient(#fff, #f7f7f7); box-shadow: 0 1px 1px rgba(0,0,0,0.1); border-radius: 3px; overflow: visible;">
										<span style="cursor: pointer; user-select: none;">Save</span>
									</button>
								</form>
								
								
							</div>
						</div>
						
						
						
						
						
						
						
						
					</div>
				
				
				</div>
				
				
				
				
				
				
				
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			var mode = $('#mode');
			if(mode.val() == 'photo_del') {
				$('#result_photo_status_text').show();
			} else {
				$('#result_photo_status_text').hide();
			}
			
			$('#file_browser_button').hover(function() {
				$(this).css('background-color', 'red');
			})
			$('#file_browser_button').mouseleave(function() {
				$(this).css('background-color', '#d90007');
			})
			$('#file_browser_button').click(function() {
				$('#file_browser_input').click();
			})
			$('#delete_button').click(function() {
				$('#info_photo').attr('action', 'event_insert_photo?mode=photo_del&evnum=' + ${eventDTO.evnum}); //파라미터로 photo_del을 보내서 사진 지워진 후 인지 아닌지 판별
			})
		});
	</script>
	<script type="text/javascript">
		function fileCheck(obj) {
			var pathpoint = obj.value.lastIndexOf('.');
			var filepoint = obj.value.substring(pathpoint+1, obj.length);
			var filetype = filepoint.toLowerCase();
			if(filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg' || filetype == 'bmp') {
				
				return true;
			} else {
				alert('이미지 파일만 선택할 수 있습니다.');
				var parentObj = obj.parentNode;
				var node = parentObj.replaceChild(obj.cloneNode(true), obj);
				return false;
			}
			if(filetype == 'bmp') {
				alert('.bmp형식의 이미지는 적절한 형식이 아닙니다. 다른 형식의 이미지 파일을 선택해주세요.');
				return false;
			}
		}
		
		function odDrop(event) {
			event.preventDefault();
		    var data = event.dataTransfer.getData("text");
		    alert(data);
		    document.getElementById('photo_box_img').src = data;
		    
// 			var file = event.dataTransfer.files[0];
//			var imageType = /image.*/;
//			var textType = /text.*/;
/* 		    var isImage;
		    
			if(file.type.match(imageType)){
				isImage = true; 
			} else if (file.type.match(textType)) {
				isImage = false;
			}
			
			var reader = new FileReader();
			reader.onload = (function(aFile) {return function(e) {         
				var result = e.target.result;  
				if(isImage) {
					dropImage.src = result;                                                                            
					dropBox.appendChild(dropImage)
				} else {
					dropBox.innerHTML = result;
				}        
			};
			})(file);
		      
		    if(isImage) { 
		    	reader.readAsDataURL(file); 
		    }
		    else { 
		    	reader.readAsText(file,"UTF-8"); 
		    }
		    event.stopPropagation();
		    event.preventDefault();  */
			
			
			
/* 			event.preventDefault();
			var dt = event.dataTransfer;
			dt.mozSetDataAt("image/png", stream, 0);
			dt.mozSetDataAt("application/x-moz-file", file, 0);
			dt.setData("text/uri-list", imageurl);
			dt.setData("text/plain", imageurl); */
		}
		
/* 		dropImage.addEventListener("load", function(e) {
		    //이미지 로딩 시 추가 처리할 로직 기입(사이즈 조절 등)           
		  }, true);  */
		
		
		function onDragOver(event) {
			  event.preventDefault();
/* 			if (event.dataTransfer.dropEffect == "move") {
				event.preventDefault();
			} */
		}
		function onDragEnter(event) {
			event.dataTransfer.setData("text", event.target.id);
/* 			if (event.dataTransfer.dropEffect == "move") {
				event.preventDefault();
			} */
		}
	</script>

<%@ include file="../bottom.jsp"%>