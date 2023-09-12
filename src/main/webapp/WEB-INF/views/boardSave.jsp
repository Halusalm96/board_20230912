<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글작성 페이지</title>
</head>
<body>
    <form action="/board/save" method="post" enctype="multipart/form-data">
        <input type="text" name="boardWriter" placeholder="본인 이름"><br>
        <input type="text" name="boardPass" placeholder="비밀번호"><br>
        <input type="text" name="boardTitle" placeholder="제목"><br>
        <input type="text" name="boardContents" placeholder="내용"><br>
        <input type="file" name="boardFile"> <br>
        <input type="submit" value="저장">
    </form>
</body>
</html>
