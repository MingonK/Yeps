<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<script type="text/javascript">
		  $(document).ready(function(){
		    $("#popbutton").click(function(){
		        $('div.modal').modal();
		    })
		})
</script>
<%-- 	<c:if test="${count>0}">
					<c:set var="pageCount" value="${(count + pageSize-1) / pageSize}" />
					<c:set var="pageBlock" value="3" />
					<c:set var="startPage"
						value="${(currentPage-1) / pageBlock * pageBlock + 1}" />
					<c:set var="endPage" value="${startPage + pageBlock - 1}" />
					<c:if test="${endPage > pageCount}">
						<c:set var="endPage" value="${pageCount}" />
					</c:if>
					<c:if test="${startPage > pageBlock}">
						<a href="yeps_message?pageNum=${startPage - pageBlock}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="1" end="${endPage}" step="1">
						<a href="yeps_message?pageNum=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="yeps_message?pageNum=${startPage+pageBlock}">[다음]</a>
					</c:if>
				</c:if> --%>
				
				//		ModelAndView mav = new ModelAndView();
//		int pageSize = 10;
//		int pageBlock = 5;
//	   '                      (@RequestParam(defaultValue="1") int curPage'
//	    int count =  yepsMessageMapper.getMessageCount();;
//	  /*  int endRow = pageSize * currentPage;
//	    if(endRow > count) {
//			endRow = count;
//	     }
//	    int startRow = endRow - pageSize;*/
//	    int startRow = (currentPage - 1) * pageSize + 1;
//	    int endRow = startRow + pageSize - 1;
//	    if(endRow > count) {
//			endRow = count;
//	     }
//	    int num = count - pageSize * (currentPage - 1);   
//	    int totalPage = ((count -1)/pageSize) + 1; 
//	    int prevBlock = (int)Math.floor((currentPage-1)/pageBlock)*pageBlock; 
//	    int nextBlock = prevBlock + pageBlock +1;  
//	    List<MessageDTO> list = yepsMessageMapper.messageList(startRow, endRow);
//		mav.addObject("pageSize", pageSize);
//		mav.addObject("pageBlcok",pageBlock);
//		mav.addObject("currentPage", currentPage);
//		mav.addObject("count", count);
//		mav.addObject("endRow", endRow);
//		mav.addObject("startRow",startRow);
//		mav.addObject("num", num);
//		mav.addObject("totalPage", totalPage);
//		mav.addObject("prevBlock", prevBlock);
//		mav.addObject("neyesxtBlock", nextBlock);
//		mav.addObject("messageList", list);
//		mav.setViewName("message/yepsMessage");
<%@ include file="../bottom.jsp"%>

 /* var left1,top1;
	         left1=(screen.width-300)/2;
	         top1=(screen.height-300)/2;
	         openWin = window.open("message_reply","addr", "left="+left1+", location=no, toolbar=no, resizable=no, top="+top1+",width=600,height=400,scrollbars=yes");
	         openWin.document.getElementById("msgNum").value()=document.getElementById("msgNum").value();  */