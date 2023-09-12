<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                <td>이름</td>
                <td>내용</td>
                <td>작성시간</td>
            </tr>
            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td>${board.boardPass}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardContents}</td>
                <td>${board.createdAt}</td>
                <td>${board.boardHits}</td>
            </tr>
            <tr>
                <td>댓글</td>
            </tr>
            <tr>
                <td>id</td>
                <td>작성자</td>
                <td>댓글</td>
                <td>작성시간</td>
            </tr>
            <li class="comment-list" id="comment-list">

            </li>
            <c:forEach items="${commentList}" var="commentList">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.commentWriter}</td>
                    <td>${comment.commentContents}</td>
                    <td>${comment.commentCreatedDate}</td>
                </tr>
            </c:forEach>
        </table>
        <form action="/comment/save" method="post">
            <input type="text" name="commentWriter" id="commentWriter" placeholder="이름"> <br>
            <input type="text" name="commentContents" id="commentContents" placeholder="내용"> <br>
            <button class="btn btn-info" onclick="commentWriter_fn('${board.id}')">댓글</button>
        </form>
        <a href="/">시작페이지 이동</a>
    </div>
</body>
<script>
    const commentWriter_fn = () => {
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = document.getElementById("commentContents").value;
        const boardId = ${board.id};
        console.log(commentWriter+commentContents+boardId);
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: commentWriter,
                commentContents: commentContents,
                boardId: boardId
            },
            success: function () {
                document.location.submit();
                    },
            error: function () {
                console.log("실패")
            }
        })
    }
    const commentList = document.getElementById("comment-list");
    const commentBoardId = '${sessionScope.id}';
    if(commentBoardId.length != 0){
        commentList.innerHTML = "";
    }else {
        commentList.innerHTML = "아직 작성된 댓글이 없습니다.";
    }
</script>
</html>
