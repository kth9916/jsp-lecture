<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>파일 게시판</title>                    
<style>a{text-decoration:none;}</style>
</head>
<body>
    <h2>파일 첨부형 게시판 - 목록 보기(List)</h2>

    <!-- 목록 테이블 -->
    <table border="1" width="90%">
        <tr>
            <th width="10%">순서</th>
            <th width="*">아이디</th>
            <th width="15%">비밀번호</th>
             <th width="10%">이름</th>
            <th width="10%">이메일</th>
            <th width="15%">입사일</th>
            <th width="15%">삭제</th>
        </tr>
<c:choose>    
    <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
        <tr>
            <td colspan="6" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
    </c:when>
    <c:otherwise>  <!-- 게시물이 있을 때 -->
        <c:forEach items="${ boardLists }" var="row" varStatus="loop">    
        <tr align="center">
            <td>  <!-- 번호 -->
                ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}   
            </td>
            <td>${ row.id }</td>
            <td>${ row.pwd }</td> 
            <td>${ row.name }</td>  <!-- 작성자 -->
            <td>${ row.email }</td>  <!-- 조회수 -->
            <td>${ row.joindate }</td>  <!-- 작성일 -->
            <td><button type = "button" onclick = "location.href='../member/delete.do'">삭제하기</button></td>
        </tr>
        </c:forEach>        
    </c:otherwise>    
</c:choose>
    </table>

    <!-- 하단 메뉴(바로가기, 글쓰기) -->
    <table border="1" width="90%">
        <tr align="center">
            <td>
                ${ map.pagingImg }
            </td>
            <td width="100"><button type="button"
                onclick="location.href='../member/insert.do';">글쓰기</button></td>
        </tr>
    </table>
</body>
</html>