import com.example.mvc.model.BoardDAO;
import com.example.mvc.model.BoardDTO;
import  org.junit.jupiter.api.Test;
import java.sql.SQLException;

public class BoardTests {
    @Test
    public void testBoardInsert() throws SQLException {
        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = new BoardDTO();
        for(int i=1; i<=100; i++){
            boardDTO.setMemberId("test");
            boardDTO.setSubject("제목");
            boardDTO.setContent("내용");
            boardDTO.setName("작성자");
            boardDTO.setName("작성자");
            boardDTO.setHit(1);
            boardDTO.setAddDate("2020-01-01");
            boardDAO.insertBoard(boardDTO);
        }
    }

    @Test//아래의 메서드는 테스트 코드라는것을 알려주는 이노테이션
    public void testGetBoardByNum(){
        int num =1;

        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = boardDAO.getBoardByNum(num);
        System.out.println(boardDTO);
    }

    @Test
    public void testUpdateBoard(){
        int num =99;

        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = boardDAO.getBoardByNum(num);

        BoardDTO board = new BoardDTO();
        board.setNum(num);
        board.setSubject("제목 수정");
        board.setContent("내용 수정");
        board.setName("작성자 수정");
        boardDAO.updateBoard(board);

        boardDTO = boardDAO.getBoardByNum(num);
        System.out.println(boardDTO);
    }

    @Test
    public void textdeleteBoard(){
        int num =110;

        BoardDAO boardDAO = BoardDAO.getInstance();
        boardDAO.deleteBoard(num);

    }
}
