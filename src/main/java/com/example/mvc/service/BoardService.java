package com.example.mvc.service;

import com.example.mvc.model.BoardDAO;
import com.example.mvc.model.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

public class BoardService {
    static final int LISTCOUNT = 5;
    //싱글턴 타입으로 작성.
    private static BoardService instance;

    private BoardService(){}

    public static BoardService getInstance() {
        if (instance == null)
            instance = new BoardService();
        return instance;
    }

    public void requestBoardList(HttpServletRequest request) {
        //등록된 글목록 가져오기
        BoardDAO dao = BoardDAO.getInstance();
        List<BoardDTO> boardlist;

        int pageNum = 1;//페이지 번호의 기본 값
        int limit = LISTCOUNT;//페이지당 게시물 수
        if (request.getParameter("pageNume") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNume"));
        }

        String items = request.getParameter("items"); //검색어
        String text = request.getParameter("text");

        int totalRecord = dao.getListCount(items,text); //전체게시물 수
        boardlist = dao.getBoardList(pageNum,limit,items,text);

        int totalPage;
        if(totalRecord % limit == 0) {
            totalPage = totalRecord/limit;
            Math.floor(totalPage);
        }else {
            totalPage = totalRecord/limit;
            Math.floor(totalPage);
            totalPage = totalPage + 1;
        }

        int startNum = totalRecord - (pageNum -1)*limit;
        System.out.println("startNum : " + startNum);

        request.setAttribute("pageNum", pageNum);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("totalRecord", totalRecord);
        request.setAttribute("boardList", boardlist);
        request.setAttribute("startNum", startNum);
    }

    public void addBoard(HttpServletRequest request){

        BoardDAO dao = BoardDAO.getInstance();
        HttpSession session = request.getSession();//로그인 헸을데 받는 sessionMemberId값을 사용하기위해 session에 모든값을 session 변수에 저장

        BoardDTO board = new BoardDTO();
        board.setMemberId((String) session.getAttribute("sessionMemberId"));
        board.setName(request.getParameter("name"));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));

        System.out.println(request.getParameter("name"));
        System.out.println(request.getParameter("subject"));
        System.out.println(request.getParameter("content"));

        board.setHit(0);
        board.setIp(request.getRemoteAddr());

        dao.insertBoard(board);

    }

    public void getBoardView(HttpServletRequest request){
        BoardDAO dao = BoardDAO.getInstance();
        int num = Integer.parseInt(request.getParameter("num"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        BoardDTO board = dao.getBoardByNum(num);

        request.setAttribute("board", board);
    }

    public void modifyBoard(HttpServletRequest request){
        int num = Integer.parseInt(request.getParameter("num"));

        BoardDAO dao = BoardDAO.getInstance();

        BoardDTO board = new BoardDTO();
        board.setNum(num);
        board.setName(request.getParameter("name"));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));

        dao.updateBoard(board);
    }

    public void removeBoard(HttpServletRequest request){
        int num = Integer.parseInt(request.getParameter("num"));
        System.out.println(num);
        BoardDAO dao = BoardDAO.getInstance();
        dao.deleteBoard(num);
    }
}
