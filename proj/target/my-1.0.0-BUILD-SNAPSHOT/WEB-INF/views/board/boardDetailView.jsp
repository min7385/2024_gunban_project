<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>게시글</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<div class="col-lg-8 col-xl-7">
		<!-- tilte input -->
		<div class="mb-3">
			<label for="title">제목</label>
			<h6 id="title">${board.boardTitle}</h6>
		</div>
		<div class="mb-3">
			<label for="nm">작성자</label>
			<h6 id="nm">${board.memNm}</h6>
		</div>
		<!-- content input -->
		<div class="mb-3">
			<textarea class="form-control bg-white" style="height: 20rem" readonly>${board.boardContent}</textarea>
		</div>
	</div>
	<c:if test="${sessionScope.login.memId == board.memId}">
		<div class="col-lg-8 col-xl-7 d-flex justify-content-end">
			<from action="<c:url value="/boardEditView" />" method="post">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
				<button type="submit" class="btn btn-info me-2">수정</button>
			</from>
			<from action="<c:url value="/boardDelDo" />" method="post" id="delForm">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
				<button type="button" class="btn btn-danger me-2" onclick="f_boardDel()">삭제</button>
			</from>
		</div>
	</c:if>
	
	<!-- 댓글 관련 작업 시작 -->
	            <div class="divider-custom divider-light">
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                 <div class="divider-custom-line"></div>
             </div>
             
			<!-- 댓글작성 -->
            <div class="row justify-content-center pt-1">
            	<div class="col-lg-8 col-xl-7 d-flex">
            		<div class="col-lg-10">
            			<input type="text" id="replyInput" class="form-control">
            		</div>
            		<div class="col-lg-2">
            			<button type="button" onclick="fn_write()" class="btn btn-info me-2">등록</button>
            		</div>
            	</div>
            </div>
			<!-- 댓글출력 -->
            <div class="row justify-content-center pt-1">
            	<div class="col-lg-8 col-xl-7">
            		<table class="table">
            			<tbody id="replyBody">
	            			<c:forEach items="${replyList}" var="reply">
	            				<tr id="${reply.replyNo}">
	            					<td>${reply.replyContent}</td>
	            					<td>${reply.memNm}</td>
	            					<td>${reply.replyDate}</td>
	            					<c:if test="${sessionScope.login.memId == reply.memId }">
	            						<td><a onclick="fn_del('${reply.replyNo}')">X</a></td>
	            					</c:if>
	            				</tr>
	            			</c:forEach>
            			</tbody>
            		</table>
            	</div>
            </div>
	<!-- 댓글 관련 작업 끝 -->
	
	<script type="text/javascript">
	
		function f_boardDel(){
			if(confirm("정말로 삭제 하시겠나요?")){
				document.getElementByid("delForm").submit();
			}
		}
		
		
		/* 댓글 관련 작업 */
	    function fn_write(){
   		let memId = '${sessionScope.login.memId}';
   		let boardNo = '${board.boardNo}';
   		let msg = $("#replyInput").val();
   		if(memId == ''){
   			alert("댓글은 로그인 해야함!!!");
   			return;
   		}
   		if(msg == ''){
   			alert("내용을 작성해주세요!!!");
   			return;
   		}
   		let sendData = JSON.stringify({  "memId":memId
   			                           , "boardNo":boardNo
   			                           , "replyContent":msg });
   		console.log(sendData);
   		$.ajax({
   				 url : '<c:url value="/writeReplyDo" />'
   				,type : 'POST'
   				,contentType: 'application/json'
   				,dataType :'json'
   				,data : sendData
   				,success:function(res){
   					console.log('응답');
   					console.log(res);
   					let str = "";
   					str +="<tr id='"+res.replyNo+"'>";
   					str +="<td>" +res.replyContent + "</td>";
   					str +="<td>" +res.memNm + "</td>";
   					str +="<td>" +res.replyDate + "</td>";
   					str +="<td><a onclick='fn_del(\""+res.replyNo+"\")'>X</a></td>";
   					str +="</tr>";
   					$("#replyBody").append(str);
   				}
   				,error : function(e){
   					console.log(e);
   				}
	   		});
	   		
	   	}
		
	</script>
	
	
	
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>