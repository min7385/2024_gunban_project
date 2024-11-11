<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글</title>
    <style>
        /* 전체 페이지에서 상단 헤더를 고려하여 자동으로 여백을 줌 */
        body {
            margin: 0;
            padding: 0;
        }

        /* 상단 헤더 영역의 높이를 동적으로 계산하여 하단 콘텐츠가 밀려나도록 설정 */
        .content-wrapper {
            margin-top: calc(60px + 1rem); /* top.jsp 높이에 맞춰서 margin-top 조정 */
        }

        /* 각 섹션마다 여백을 추가하여 내용을 보기 좋게 */
        .content-section {
            padding: 20px;
        }
    </style>
</head>
<body>
    <!-- 상단 포함 파일 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 콘텐츠 영역 시작 -->
    <div class="content-wrapper">
        <div class="content-section d-flex justify-content-center">
            <div class="col-lg-12 col-xl-7">
                <!-- 제목 출력 -->
				<div class="mb-3" style="display: flex; flex-direction: column;">
					<label style="color: white;">123</label>
					<label style="color: white;">1234</label>
				    <div style="display: flex; align-items: center;">
				        <label for="title" style="margin-right: 10px;">제목: </label>
				        <h6 id="title">${board.boardTitle}</h6>
				    </div>
				</div>
				
				<!-- 작성자 출력 -->
				<div class="mb-3" style="display: flex;">
				    <label for="nm" style="margin-right: 10px;">작성자: </label>
				    <h6 id="nm">${board.memName}</h6>
				</div>
				
				<!-- 날짜 출력 -->
				<div class="mb-3" style="display: flex;">
				    <label for="nm" style="margin-right: 10px;">날짜: </label>
				    <h6 id="nm">${board.createDt}</h6>
				</div>

                <!-- 내용 출력 -->
                <div class="mb-3 col-lg-10">
                    <label>내용</label>
                    <textarea class="form-control bg-white" style="height: 20rem" readonly>${board.boardContent}</textarea>
                </div>
            </div>
        </div>

        <!-- 수정 및 삭제 버튼 -->
        <c:if test="${sessionScope.login.memId == board.memId}">
        	<div style="display: flex; justify-content: center; align-items: center; margin-bottom: 10px;">
	            <form action="<c:url value='/boardEditView' />" method="post" style="display: inline-block;">
	                <input type="hidden" name="boardNo" value="${board.boardNo}">
	                <button type="submit" class="btn btn-info me-2">수정</button>
	            </form>
	            <form action="<c:url value='/boardDelDo' />" method="post" id="delForm">
	                <input type="hidden" name="boardNo" value="${board.boardNo}">
	                <button type="button" class="btn btn-danger me-2" onclick="f_boardDel()">삭제</button>
	            </form>
            </div>
        </c:if>

        <!-- 댓글 관련 작업 시작 -->
        <div class="divider-custom divider-light mt-4">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
            <div class="divider-custom-line"></div>
        </div>

        <!-- 댓글 작성 -->
        <div class="row justify-content-center pt-1" style="margin-top: 10px;">
            <div class="col-lg-8 col-xl-7 d-flex">
                <div class="col-lg-10">
                    <input type="text" id="replyInput" class="form-control" placeholder="댓글을 입력하세요">
                </div>
                <div class="col-lg-2">
                    <button type="button" onclick="fn_write()" class="btn btn-info me-2">등록</button>
                </div>
            </div>
        </div>

        <!-- 댓글 출력 -->
        <div class="row justify-content-center pt-1">
            <div class="col-lg-8 col-xl-7">
                <table class="table">
                    <tbody id="replyBody">
                        <c:forEach items="${replyList}" var="reply">
                            <tr id="${reply.replyNo}">
                                <td>${reply.replyContent}</td>
                                <td>${reply.memName}</td>
                                <td>${reply.replyDate}</td>
                                <c:if test="${sessionScope.login.memId == reply.memId}">
                                    <td><a onclick="fn_del('${reply.replyNo}')">X</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 댓글 영역 끝 -->
    </div>

    <!-- 스크립트 -->
    <script type="text/javascript">
        function f_boardDel() {
            if (confirm("정말로 삭제 하시겠나요?")) {
                document.getElementById("delForm").submit();
            }
        }
    </script>
    <!-- 댓글 등록 스크립트 -->
    <script type="text/javascript">
    	function fn_write(){
    		let memId = '${sessionScope.login.memId}';
    		let boardNo = '${board.boardNo}';
    		let msg = $("#replyInput").val();
    		if(memId == ''){
    			alert("로그인이 필요합니다")
    			return;
    		}
    		if(msg == ''){
    			alert("내용을 작성해주세요!");
    			return;
    		}
    		
    		let sendData = JSON.stringify({"memId":memId
							               ,"boardNo":boardNo
							               ,"replyContent":msg });
			console.log(sendData);
    		$.ajax({
    			 url: '<c:url value="/writeRepleDo" />'
    			,type: 'POST'
    			,data: sendData
    			,contentType: 'application/json'
    			,dataType: 'json'
    			,success: function(res){
    				console.log(res);
    				let replyContent = res.replyContent;
    				let memName = res.memName;
    				let replyDate = res.replyDate;
    				let replyNo = res.replyNo
    				const v_resp = res;
    				let str = "";
    				str +="<tr id='" + replyNo + "'>";
    				str +="<td>" + replyContent + "</td>";
    				str +="<td>" + memName + "</td>";
    				str +="<td>" + replyDate + "</td>";
    				str +="<td>" + "<a onclick='fn_del(\"" + replyNo + "\")'>X</a>" + "</td>";
    				str +="</tr>";
    				$("#replyBody").prepend(str);
    			}
    		});
    	}
    	function fn_del(reply_no){
    		if(confirm("댓글 삭제하겠니?")){
    		$.ajax({
    			 url: '<c:url value="/delRepleDo" />'
    			,type: 'POST'
    			,data: JSON.stringify({'replyNo': reply_no})
    			,contentType: 'application/json'
    			,dataType: 'text'
    			,success: function(res){
    				if(res == "success"){
    					$("#" + reply_no).remove();
    				}
    			}, error: function(e) {
    		       console.log(e);
    		    }
    		});
    	  }
    	}
    </script>

    <!-- 하단 포함 파일 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>