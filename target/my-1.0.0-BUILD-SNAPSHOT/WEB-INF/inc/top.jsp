<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version) -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- Core theme CSS (includes Bootstrap) -->
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />

<style>
    .dropdown-menu {
        width: max-content; /* 드롭다운 제목에 맞춰 너비 조정 */
    }
    .dropdown-menu .dropdown-item {
        height: 50px; /* 각 항목의 높이 */
        display: flex; /* Flexbox 사용 */
        align-items: center; /* 수직 중앙 정렬 */
        justify-content: center; /* 수평 중앙 정렬 */
        padding: 0; /* 기본 패딩 제거 */
    }
    .dropdown-toggle {
        font-weight: 300; /* 드롭다운 제목의 글씨 굵기 조정 */
    }
</style>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/" style="display: flex; align-items: center;">
            <img alt="logo" src="${pageContext.request.contextPath}/assets/img/logo.png" style="height: 40px; margin-right: 10px;">
            <span style="font-size: 40px; line-height: 40px;">프로젝트</span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="탐색 전환">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav mx-auto"> 
                <li class="nav-item dropdown" style="margin-right: 20px;">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        사이트 소개
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">인사말</a>
                    </div>
                </li>
                <li class="nav-item dropdown" style="margin-right: 20px;">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        반려동물 케어
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">반려동물 가이드</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/hospital">동물병원 찾기</a>
                    </div>
                </li>
                <li class="nav-item dropdown" style="margin-right: 20px;">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        갤러리
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">개</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">고양이</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">조류</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">파충류</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">기타 동물</a>
                    </div>
                </li>
                <li class="nav-item dropdown" style="margin-right: 20px;">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        게시판
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">공지사항</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/boardView">자유게시판</a>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto"> 
                <c:if test="${sessionScope.login == null }">
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded" href="<c:url value="/loginView" />">로그인</a>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/registView">회원가입</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.login != null }">
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded" href="#">${sessionScope.login.memNm} 님</a>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/logoutDo">로그아웃</a>
                    </li>
                </c:if>
            </ul>
        </div>	
    </div>
</nav>
