<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>자유 게시판</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
		
	<section class="page-section" style="margin-top:100px">
    	<div class="container">
    		<div class="d-flex justify-content-end"></div>
    		<table class="table table-hover">
    			<thead>
					<td style="width: 10%; border: 1px solid #ddd; text-align: center; background-color: rgb(240, 240, 240);">번호</td>
                    <td style="width: 45%; border: 1px solid #ddd; text-align: center; background-color: rgb(240, 240, 240);">제목</td>
                    <td style="width: 15%; border: 1px solid #ddd; text-align: center; background-color: rgb(240, 240, 240);">작성자</td>
                    <td style="width: 15%; border: 1px solid #ddd; text-align: center; background-color: rgb(240, 240, 240);">작성일</td>
                    <td style="width: 15%; border: 1px solid #ddd; text-align: center; background-color: rgb(240, 240, 240);">조회 수</td>
    			</thead>
    			<tbody>
				    <c:forEach items="${boardList}" var="board">
				        <tr>
							<td style="text-align: center; width: 10%; border: 1px solid #ddd;">${board.boardNo}</td>
    						<td style="text-align: center; width: 10%; border: 1px solid #ddd;">
    							<a href="<c:url value="/boardDetailView?boardNo=${board.boardNo}" /> "> 
    							   ${board.boardTitle}
    							 </a>
    					    </td>
    						<td style="text-align: center; width: 10%; border: 1px solid #ddd;">${board.memName}</td>
    						<td style="text-align: center; width: 10%; border: 1px solid #ddd;">${board.createDt}</td>
    						<td style="text-align: center; width: 10%; border: 1px solid #ddd;">99</td>
				        </tr>
				    </c:forEach>
				</tbody>
    		</table>
    		<a href="<c:url value="/boardWriteView" /> ">
    			<button type="button" class="btn btn-primary">글쓰기</button>
    		</a>
    	</div>
    </section>			
		
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>