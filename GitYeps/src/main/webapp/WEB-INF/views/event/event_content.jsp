<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>이벤트 네임 그대로 올려</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=1"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<h2>${eventDTO.eventname}</h2><br>	
	<h2>${eventDTO.evnum}</h2>
	<h3><a href="event_update_photo?evnum=${eventDTO.evnum}">${eventDTO.eventname}</a></h3>
<%@ include file="../bottom.jsp"%>