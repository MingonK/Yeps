<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Add a Event Photo - Yeps</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/event_update_photo.css?ver=1"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
</head>
<body ondragstart="return false">
<input type="hidden" id="mode" value="${param.mode}">
	<%@ include file="../top.jsp"%>
	<div id="insert_photo_super_wrap">
		<div id="insert_photo_middle_wrap">
			<div id="result_photo_status_text">
				<p>Your photo has been removed.</p>
			</div>
			<div id="insert_photo_main_wrap">
				<div id="main_header">
					<div id="main_header_baseline">
						<div id="main_header_baseline_text">
							<h2>Add A Photo To <a href="event_content?evnum=${eventDTO.evnum}">${eventDTO.eventname}</a></h2>
						</div>
						<div id="main_header_baseline_back">
							<a href="event_content?evnum=${eventDTO.evnum}">Back</a>
						</div>
					</div>
				</div>
				<div id="photo_drop_super_container">
					<div id="photo_drop_container">
						<div id="file_uploader_container" data-component-bound="true">
							<div id="file_uploader" data-component-bound="true" style="opacity: 1;">
								<div id="file_drop_area">
									<div id="file_drop_area_inner">
										<h1>업로드할 파일을 올려주세요.</h1>
										<fieldset id="or_line">
											<legend>OR</legend>
										</fieldset>
										<div id="file_browser" style="pointer-events: auto;">
											<input type="file" id="file_browser_input" onchange="javascript:fileCheck(this)" accept="image/gif, image/jpeg, image/png">
											<button type="submit" id="file_browser_button">
												<span>Browse Files</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<div id="sucess_file_upload_header">
							<h2>Photos</h2>
						</div>
						<div id="user_photo_edit_cotainer">
							<div id="user_photo_edit">
								<div id="user_photo_edit_top">
									<div id="user_photo_area">
										<div id="user_photo_box" style="position: relative;">
											<img alt="event_photo" id="photo_box_img" width="168px" height="168px">
										</div>
									</div>
									<div id="user_photo_write_info">
										<p>
											From 
											<a href="#" style="font-weight: bold;">
												${sessionScope.memberinfo.email}
											</a>
										</p> 
										<form id="info_photo" method="post" enctype="multipart/form-data">
											<input type="hidden" id="photoname" style="display: none; cursor: auto;">
											<button id="delete_button">Delete</button> 
										</form>
									</div>
								</div>
								
								<form id="photo_description" method="post" style="margin-bottom: 18px; display: block;" enctype="multipart/form-data">
									<input type="hidden" name="evnum" id="evnum">
									<input type="hidden" name="mnum" id="mnum">
									<input type="hidden" name="filenum" id="filenum">
									<label>Description</label>
									<div id="description_container">
										<textarea rows="4" name="file_content"></textarea>
									</div>
									<button type="submit" id="Save_button">
										<span>Save</span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
 		function fileCheck(obj) {
			var pathpoint = obj.value.lastIndexOf('.');
			var filepoint = obj.value.substring(pathpoint+1, obj.length);
			var filetype = filepoint.toLowerCase();
			
			if(filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg') {
				var fileObject = document.getElementById('file_browser_input');
				if(fileObject.files[0].size > 10485760) {
					alert("이미지의 크기가 10MB를 초과할 수 없습니다.");
					return false;
				}
				var data = new FormData();
				data.append('filename', fileObject.files[0]);
				
				var url = "event_fileUpLoad?evnum=${eventDTO.evnum}";
				$.ajax({
					url: url,
					method: 'post',
					data: data,
					dataType: 'json',
					processData: false,
					contentType: false,
					success: function(responseData) {
						if(responseData.failed) {
							alert("잠시후 다시 시도해주세요.");
							return false;
						} 
						$('#result_photo_status_text').hide();
						$('#sucess_file_upload_header').show();
						$('#user_photo_edit_cotainer').show();
						$('#filenum').val(responseData.filenum);
						$('#photoname').val(responseData.filename);
						var url = "getImage/" + responseData.filename;
						$('#photo_box_img').attr('src', url);
					}
				});
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
				} else if (files.length > 1) {
					alert("하나의 파일만 올려주세요.");
					return;
				}
				
				var pathpoint = files[0].name.lastIndexOf('.');
				var filepoint = files[0].name.substring(pathpoint+1, files[0].name.length);
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
				
				(F_FileMultiUpload = function(file, objDragAndDrop) {
					var data = new FormData();
					data.append('filename', file);
						
					var url = "event_fileUpLoad?evnum=${eventDTO.evnum}";
					$.ajax({
						url: url,
						method: 'post',
						data: data,
						dataType: 'json',
						processData: false,
						contentType: false,
						success: function(responseData) {
							if(responseData.failed) {
								alert("잠시후 다시 시도해주세요.");
								return false;
							}
							
							$('#result_photo_status_text').hide();
							$('#sucess_file_upload_header').show();
							$('#user_photo_edit_cotainer').show();
							$('#filenum').val(responseData.filenum);
							$('#photoname').val(responseData.filename);
							var url = "getImage/" + responseData.filename;
							$('#photo_box_img').attr('src', url);
						},
						error: function() {
							alert("아작스 에러");
						}
					});
				});
				F_FileMultiUpload(files[0], objDragAndDrop);
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			var mode = $('#mode');
			
			if(mode.val() == 'photo_del') {
				$('#result_photo_status_text').show();
				$('#sucess_file_upload_header').hide();
				$('#user_photo_edit_cotainer').hide();
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
				var filename = $('#photoname').val();
				if(confirm('정말 삭제하시겠습니까?')) {
					$('#info_photo').attr('action', 'event_update_photo?mode=photo_del&evnum=${eventDTO.evnum}&filename='+filename); //파라미터로 photo_del을 보내서 사진 지워진 후 인지 아닌지 판별
				} else {
					return false;
				}
			})
		});
		
		$(document).on('click', '#Save_button', function(e) {
			$('#evnum').val('${eventDTO.evnum}');
			$('#mnum').val('${sessionScope.memberinfo.mnum}');
			$('#photo_description').attr('action', 'event_updatePro_photo');
		})
	</script>
<%@ include file="../bottom.jsp"%>