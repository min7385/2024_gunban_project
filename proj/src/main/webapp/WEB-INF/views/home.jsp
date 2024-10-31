<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>스프링 프로젝트</title>
    <style>
        /* 여기에서 글씨 색상 설정 */
        .masthead-heading, .masthead-subheading {
            color: black; /* 검정색으로 변경 */
        }

        /* 배경 이미지 설정 */
        .masthead {
            background-image: url('/assets/img/home사진.png'); /* 절대 경로 */
            background-size: cover; /* 이미지가 영역을 완전히 채우도록 설정 */
            background-position: center; /* 이미지 중앙 정렬 */
            height: 100vh; /* 헤더 높이를 100%로 설정 */
            display: flex; /* flexbox 사용 */
            align-items: center; /* 수직 중앙 정렬 */
            justify-content: center; /* 수평 중앙 정렬 */
            text-align: center; /* 텍스트 중앙 정렬 */
        }

        .container {
            z-index: 1; /* 텍스트를 이미지 위에 표시하기 위해 z-index 설정 */
        }
    </style>
</head>
<body id="page-top">

    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>






    <header class="masthead text-white">
        <div class="container d-flex flex-column">
            <!-- Masthead Heading-->
            <h1 class="masthead-heading text-uppercase mb-0">스프링 프로젝트</h1>
            <!-- Icon Divider-->
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Masthead Subheading-->
            <p class="masthead-subheading">* 환영합니다 *</p>
        </div>
    </header>






    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>