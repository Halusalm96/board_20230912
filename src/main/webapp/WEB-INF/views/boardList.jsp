<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>글목록 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
    <div id="board-list">
        <form action="/board/search" method="get" name="frm">
            <label for="searchType">검색 유형:</label>
            <select name="searchType" id="searchType">
                <option value="name">이름</option>
                <option value="title">제목</option>
            </select>
            <input type="text" name="query" id="query" placeholder="검색어 입력">
            <input type="button" value="검색" onclick="search_fn()">
        </form>
        <table class="table table-bordered">
            <tr>
                <td>id</td>
                <td>이름</td>
                <td>비밀번호</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성시간</td>
                <td>조회수</td>
            </tr>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.id}</td>
                    <td>${board.boardWriter}</td>
                    <td>${board.boardPass}</td>
                    <td>${board.boardTitle}</td>
                    <td>${board.boardContents}</td>
                    <td>${board.createdAt}</td>
                    <td>${board.boardHits}</td>
                    <td>
                        <button class="btn btn-info" onclick="detail_fn('${board.id}')">조회</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
<script>
    const detail_fn = (id) => {
        location.href = "/board/detail?id=" + id;
    }
    const search_fn = () => {
        const searchType = document.getElementById("searchType").value;
        const query = document.getElementById("query").value;
        $.ajax({
            success: function () {
                console.log(searchType,query);
                $(frm).submit();
            },
            error: function () {
                console.log("실패");
            }
        })
    }
</script>
</html>
