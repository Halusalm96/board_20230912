package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.CommentDTO;
import com.icia.board.service.BoardService;
import com.icia.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    CommentService commentService = new CommentService();
    @Autowired
    BoardService boardService = new BoardService();

    @GetMapping("/comment")
    public String comment(@RequestParam("id") Long boardId, Model model,HttpSession session) {
        Long id =(Long)session.getAttribute("boardId");
        List<CommentDTO> commentDTOList = commentService.findByBoardId(id);
        model.addAttribute("commentList",commentDTOList);
        BoardDTO boardDTO = boardService.findByBoardId(boardId);
        model.addAttribute("board", boardDTO);
        return "commentWrite";
    }

    @PostMapping("/comment/save")
    public String commentSave(@ModelAttribute CommentDTO commentDTO,Model model) {
        commentService.commentSave(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findByBoardId(commentDTO.getBoardId());
        model.addAttribute("commentList",commentDTOList);
        BoardDTO boardDTO = boardService.findByBoardId(commentDTO.getBoardId());
        model.addAttribute("board", boardDTO);
        return "boardList";
    }

//    댓글 출력이 안되고 댓글달고 리스트로 이동하면 지금까지 등록된 개시판 글이 보이지 않고 댓글등록할때 2개가 등록이 된다.(9/12)
}
