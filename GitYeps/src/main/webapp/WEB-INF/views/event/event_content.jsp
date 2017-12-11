<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>이벤트 네임 그대로 올려</title>
	<%@ include file="../style.jsp"%>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<h2>${eventDTO.eventname}</h2><br>	
	<h2>${eventDTO.evnum}</h2>
	<h3><a href="event_insert_photo?evnum=${eventDTO.evnum}">${eventDTO.eventname}</a></h3>
<%@ include file="../bottom.jsp"%>