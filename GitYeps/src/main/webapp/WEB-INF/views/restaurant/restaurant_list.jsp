<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/restStyle.css"/>"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.checked {
    color: red;
}
</style>
<script src="resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>
</head>
<%@include file="../top.jsp" %>
	<div id="main" style="width: auto;padding: 0;margin: 0;font: inherit;vertical-align: baseline;">
		<div class="header">
			<div class="content-container" style="width: 1100px;height:100%;margin: 0 auto;padding: 0 15px;">
				<div class="clearfix layout-block layout-full search-page-top" style="margin: 0 -15px;">
					<div class="column column-alpha" style="float: left;padding: 0 15px;min-height: 1px;box-sizing: border-box;width: 100%;height:60%;">
						<div class="search-header clearfix" style="width:1100px;height:80px;padding-top: 12px;padding-bottom: 7px;">
							<div class="search-header-title-container" style="width:100%;height:40px;">
								<h1 style="font-size:21px;padding-top: 6px;">베스트 10 레스토랑<span>   인천</span></h1>
							</div>
						<div class="breadcrumbs-hierarchy" style="width:100%;height:18px;margin-bottom:6px;">
							<span style="width:100px;height:30px"><a href="#">인천</a><a href="#"> > 레스토랑</a></span>
						</div>
						</div>
						<div class="filter-panel" style="width:100%;height:62px">
							<div class="suggested-filters_filter-list" style="width:100%;height:42px;padding-bottom:18px;">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="super-container" style="width:1100px;margin: 0 auto;padding:15px 15px 36px 15px;display: table;vertical-align: middle;">
			<div class="middle-container" style="width:1100px;display:inline-block;">
			<div class="scroll-map" style="width:1100px;margin-left:15px;margin-right:15px;display:inline-block;">
					
			<div class="column-alpha" style="width:700px; height:100%;display:inline-block;float:left;padding:0px 15px 0px 15px">
				<ul style="display: inline-block;">
					<c:forEach var="dto" items="${map.list}">
						<li style="width: 700px;padding:16px 0px 16px 0px;border-bottom: 1px solid #e6e6e6;">
							<div class="biz-listing-large"style="width: 700px; height: 110px; position: relative;">
								<div class="main-attribute"style="width: 420px; height: 90px; display: inline-block; float: left;">
									<div class="midea-block"style="width: 390px; height: 90px; position:relative">
										<div class="midea-avata"style="width: 100px; height: 90px; display: inline-block;">
											<div class="photo-box"style="width: 90px; height: 90px; float: left;">
												<c:if test="${!empty dto.filename }">
													<img width="70px" height="70px"src="getImage/${dto.filename }">
												</c:if>
												<c:if test="${dto.filename==null}">
													<img width="90px" height="90px" src="getImage/x.jpg">
												</c:if>
											</div>
										</div>
										<div class="midea-story"
											style="width: 280px; height: 90px; display: inline-block; float: right;">
											<h3><a href="restaurant_content?rnum=${dto.rnum }">${dto.rname }</a></h3>
											<div class="rating" style="width: 280px; height: 17px">
												<div class="star"style="width: 120px; height: 18px; display: inline-block">
													<span class="fa fa-star checked"></span> 
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</div>
												<span class="review-count rating-qualifier">1201reviews</span>
											</div>
											<div class="price-category"style="width: 280px; height: 19px">
												<span class="business-attribute price-range">￦￦￦</span>
												<span class="category-str-list">${dto.foodstyle}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="second-attribute"
									style="width: 280px; height: 110px; display: inline-block; position: absolute">
									<span class="address">${dto.roadAddrPart1}</span><br>
									<span class="address">${dto.addrDetail }</span><br>
									<span class="address">${dto.roadAddrPart2 }</span><br>
									<span class="hp">${dto.raddress}-${dto.hp2}-${dto.hp3 }</span>
								</div>
							</div>
							<div class="search-avatar-offset snippet-block media-block"
								style="width: 700px; height: 50px;">
								<div class="media-avatar" style="width: 70px; height: 50px; float: left; padding-right: 10px">
									<img width="50px" height="50px"src="getImage/pepe.jpg">
								</div>
								<div class="media-story" style="width: 700px; height: 36px; margin-top: 10px">
									<span style="font-size: 100%; font: inherit; vertical-align: baseline;">좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="page">
					<div class="page-arange" style="width:350px;height:40px;float:left;">
					
					</div>
							<div class="paging"
								style="width: 350px; height: 40px; display: inline-block; white-space: nowrap; 
								margin-left: 3px; margin-right: 3px; border-collapse: collapse; border-spacing: 0 0;
								 vertical-align: baseline; box-sizing: border-box; display: table-cell;">
								<c:if test="${map.boardPager.curBlock > 1}">
									<a class="number" href="javascript:list('1')">[처음]</a>
								</c:if>
								<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a class="number"
										href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
								</c:if>

								<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
								<c:forEach var="num" begin="${map.boardPager.blockBegin}"
									end="${map.boardPager.blockEnd}">
									<!-- **현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${num == map.boardPager.curPage}">
											<span class="number" style="color: red">${num}</span>&nbsp;
                        </c:when>
										<c:otherwise>
											<a class="number" href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
								<c:if
									test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
									<a class="number"
										href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
								</c:if>

								<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
									<a class="number"
										href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
								</c:if>
							</div>
						</div>
			</div>
				<div class="column-beta" style="width:330px;height:323px;float:left;padding:0px 15px;">
				<div class="wrap">
					<div id="map" style="width: 330px; height:300px;"></div>
				<script>
	  var map = new naver.maps.Map('map',{
  	  zoom:8
    });
	  var markers = [],infoWindows = [];
	   var j=0;
	   var k=1;
	   var rname=new Array();
	   var rnum=new Array();
	   var foodstyle=new Array();
	   var roadAddrPart1=new Array();
	   var addrDetail=new Array();
	   var roadAddrPart2=new Array();
	   var filename=new Array();
	   var hp=new Array();
	  	 <c:forEach items="${map.list}" var="item">
	   	
		rname.push("${item.rname}");
		rnum.push("${item.rnum}");
		foodstyle.push("${item.foodstyle}");
		roadAddrPart1.push("${item.roadAddrPart1}");
		addrDetail.push("${item.addrDetail}");
		roadAddrPart2.push("${item.roadAddrPart2}");
		hp.push("${item.raddress}" + "-" + "${item.hp2}" + "-" + "${item.hp3}");
		filename.push("${item.filename}");
		</c:forEach>

		for (var i = 0; i < roadAddrPart1.length; i++) {
			naver.maps.Service.geocode({address : roadAddrPart1[i]},
							function(status, response) {
								var result = response.result;
								var myaddr = new naver.maps.Point(
										result.items[0].point.x,
										result.items[0].point.y);
								map.setCenter(myaddr); // 검색된 좌표로 지도 이동
								// 마커 표시
								var marker = new naver.maps.Marker({
									position : myaddr,
									map : map,
									icon : {
										url : './getImage/pin_s_'+ (j + 1)+'.png',
										size : new naver.maps.Size(22, 30),
										anchor : new naver.maps.Point(11, 30)
									}
								});        
								iwContent = [
									'<div class="scrollFix" style="width:300px;height:140px;padding:12px;">',
										'<div class="left" style="width:200px;height:140px;display:inline-block;float:left">',
											'<div class="rname" style="width:210px;height:20px">',
												'<span><a href="restaurant_content?rnum='+rnum[j]+'">'+rname[j]+'</a></span>',
											'</div>',
											'<div class="rating" style="width:">',
												'<span class="fa fa-star checked"></span>',
												'<span class="fa fa-star checked"></span>',
												'<span class="fa fa-star"></span>',
												'<span class="fa fa-star"></span>',
												'<span class="fa fa-star"></span>',
												'<span class="review">리뷰</span>',
											'</div>',
											'<div class="price-range">',
												'<span>￦￦￦</span><span>●</span><span class="foodstyle">'+foodstyle[j]+'</span>',
											'</div>',
											'<div class="address">',
											'<span>'+roadAddrPart1[j]+'</span><br>',
											'<span>'+addrDetail[j]+'</span><br>',
											'<span>'+roadAddrPart2[j]+'</span>',
											'</div>',
									'</div>',
									'<div class="right"style="width:100px;height:140px;float:left">',
										'<img width="90px" height="90px"src="getImage/'+filename[j]+'">',
									'</div>'
									].join('')
								var infowindow = new naver.maps.InfoWindow({
									content : iwContent,
								});
								markers.push(marker)
								infoWindows.push(infowindow);

								function getClickHandler(seq) {
									return function(e) {
										var marker = markers[seq], infoWindow = infoWindows[seq];

										if (infoWindow.getMap()) {
											infoWindow.close();
										} else {
											infoWindow.open(map, marker);
										}
									}
								}
								naver.maps.Event.addListener(markers[j],
										'click', getClickHandler(j));
								j++
							});
						};
			</script>
				</div>
				
			</div>
			</div>
			
		
		</div>
			<div class="footer-block" style="width:990px;height:214px;margin:0px -15px;">
				<div class="feedback-container" style="width:300px;height:214px; float: left;padding: 0 15px;">
				
				</div>
			</div>
		</div>
	</div>
	
	<script>
    // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="restaurant_list?curPage="+page;
    }
</script>
<script>
//   $(window).scroll(function(){
// 	  if ($(window).scrollTop() == $(document).height()-$(window).height()) {
// 			alert('End of Window');
// 		}
//       if ($(this).scrollTop() > 300) {
//     	 $('.wrap').addClass('fixed');
//       }else {
//     	  $('.wrap').removeClass('fixed');
//       }
//   });
  

// 	$(window).scroll(function() {
// 				if ($(window).scrollTop() == $(document).height()-$(window).height()) {
// 					alert('End of Window');
// 				}
// 			});​
</script>
<%@include file="../bottom.jsp" %>



