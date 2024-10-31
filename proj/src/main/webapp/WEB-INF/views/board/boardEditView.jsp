<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>

	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	
	
	
	<section class="page-section" style="margin-top:100px" id="contact">
        <div class="container">
    	    <!-- Contact Section Form-->
    	    <div class="row justify-content-center">
    	    	<div class="col-lg-8 col-xl-7">
    	    		<form action="<c:url value="/boardEditDo" />" method="post">
    	    			<!-- title input -->
    	    			<div class="mb-3">
    	    				<label for="title">제목</label>
    	    				<input class="form-control" id="title" name="boardTitle" type="text" value="${board.boardTitle}" />
    	    			</div>
    	    			<!-- content input -->
    	    			<div class="mb-3">
    	    				<textarea class="form-control" name="boardContent" style="height: 20rem">${board.boardContent}</textarea>
    	    			</div>
    	    			<input type="hidden" name="boardNo" value="${board.boardNo}" />
    	    			<!-- Submit Button -->
    	    			<button class="btn btn-primary btn-xl" type="submit">등록</button>
    	    		</form>
    	    	</div>
    	    </div>
    	    
        </div>
    </section>
	
	
	
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>