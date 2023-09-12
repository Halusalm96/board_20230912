<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>글조회 페이지</title>
</head>
<body>
<div class="container">
    <div id="board-list">
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
            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td>${board.boardPass}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardContents}</td>
                <td>${board.createdAt}</td>
                <td>${board.boardHits}</td>
                <c:if test="${board.fileAttached == 1}">
            <tr>
                <th>image</th>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                         alt="" width="100" height="100">
                </td>
            </tr>
            </c:if>
            <td>
                <button class="btn btn-info" onclick="deleteCheck_fn('${board.id}')">삭제</button>
            </td>
            <td>
                <button class="btn btn-info" onclick="boardUpdate_fn('${board.id}')">수정</button>
            </td>
            <td>
                <button class="btn btn-info" onclick="commentWriter_fn('${board.id}')">댓글</button>
            </td>
            </tr>
        </table>
        <a href="/">시작페이지 이동</a>
    </div>
</div>
</body>
<script>
    const deleteCheck_fn = (id) => {
        location.href = "/board/delete/check?id=" + id;
    }
    const boardUpdate_fn = (id) => {
        location.href = "/board/update?id=" + id;
    }
    const commentWriter_fn = (id) => {
        location.href = "/comment?id=" + id;
    }
</script>
</html>
