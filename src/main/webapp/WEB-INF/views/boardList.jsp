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
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <%--  for(int i=startPage; i<=endPage; i++)      --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/list?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
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
