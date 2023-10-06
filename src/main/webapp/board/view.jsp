<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-09-19
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.mvc.model.BoardDTO" %>
<%
    BoardDTO board = (BoardDTO) request.getAttribute("board");
   //int pageNum = Integer.parseInt(request.getParameter("pageNum"));
    String pageNum = request.getParameter("pageNum");
    String sessionMemberId = (String) session.getAttribute("sessionMemberId");
%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <meta charset="utf-8">
    <title>Board</title>
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">게시판</h1>
        </div>
    </div>

    <div class="container">
        <div class="form-group row">
            <label class="col-sm-2 control-label">성명</label>
            <div class="col-sm-3">
                <%=board.getName()%>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="form-group row">
            <label class="col-sm-2 control-label">제목</label>
            <div class="col-sm-5">
                <%=board.getSubject()%>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="form-group row">
            <label class="col-sm-2 control-label">내용</label>
            <div class="col-sm-5">
                <%=board.getContent()%>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-offset-2 col-sm-10">
            <%
                if(sessionMemberId != null && sessionMemberId.equals(board.getMemberId())){//앞에 조건에서 null 값으로 false 나오면 뒤에 는 검사 안한다
            %>
            <form name="frmView" method="post">
                <input type="hidden" name="pageNum" value="<%=pageNum%>">
                <input type="hidden" name="num" value="<%=board.getNum()%>">
            </form>
            <samp class="btn btn-danger btn-remove">삭제</samp>
            <samp class="btn btn-success btn-modify">수정</samp>
            <%
                }
            %>
            <a href="./boardList.do?pageNum=<%=pageNum%>" class="btn btn-primary">목록</a>
        </div>
    </div>
    <hr>
    <script>
        document.addEventListener('DOMContentLoaded', function(){
            const btnModidy = document.querySelector('.btn-modify');
            const btnRemove = document.querySelector('.btn-remove');
            const frmView = document.querySelector('form[name=frmView]');

            btnModidy.addEventListener('click', function(){
                frmView.action ='./boardModifyForm.do';
                frmView.submit();
            });
            btnRemove.addEventListener('click', function(){
                frmView.action = './boardRemoveAction.do';
                frmView.submit();
            });
        });
    </script>
    <jsp:include page="../inc/footer.jsp"/>
</body>
</html>
