package com.example.mvc.controller;

import com.example.mvc.service.BoardService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"*.do"})//확장자가 do 로 시작하는 html에  dlass 를 실행
public class BoradController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardService boardService = BoardService.getInstance();

        String RequestURI = req.getRequestURI();//getRequestURI() 는 req가 이디서 날라왔는지 그 주소(URL) 를 나타낸다
        String contextPath = req.getContextPath();//getContextPath() 웹 에플리 케이션 주소 주소로 값을 사용할때 이친구 도 가치 오는데 임마는 빼야함
        String command = RequestURI.substring(contextPath.length());
        System.out.println("command : " + command);

        resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");

        if (command.equals("/boardController/boardList.do")) {//boardList.do 에
            boardService.requestBoardList(req);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("../board/list.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(command.equals("/boardController/boardAddForm.do")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("../board/addForm.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(command.equals("/boardController/boardAddAction.do")) {
            boardService.addBoard(req);
            resp.sendRedirect("./boardList.do");
        }
        if(command.equals("/boardController/boardView.do")){
            boardService.getBoardView(req);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("../board/view.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(command.equals("/boardController/boardModifyForm.do")){
            boardService.getBoardView(req);//url 주소 받고 url 의 주소 화면 보여줌
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("../board/modifyForm.jsp");
            requestDispatcher.forward(req, resp); //resp 는 리스폰스 (응답)
        }
        if(command.equals("/boardController/boardModifyAction.do")){
            boardService.modifyBoard(req);
            resp.sendRedirect("./boardList.do");
        }
        if(command.equals("/boardController/boardRemoveAction.do")){
            boardService.removeBoard(req);
            resp.sendRedirect("./boardList.do");
        }
    }
}
