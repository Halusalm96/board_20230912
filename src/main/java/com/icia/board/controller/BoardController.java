package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.BoardFileDTO;
import com.icia.board.dto.PageDTO;
import com.icia.board.service.BoardService;
import lombok.Getter;
import org.springframework.beans.Mergeable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService = new BoardService();

    @GetMapping("/save")
    public String boardSave(){
        return "boardSave";
    }
    @PostMapping("/save")
    public String boardSave(@ModelAttribute BoardDTO boardDTO, Model model) throws IOException {
        boardService.boardSave(boardDTO);
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "boardList";
    }
    @GetMapping("/list")
    public String boardList(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model){
        List<BoardDTO> boardDTOList = boardService.pagingList(page);
        model.addAttribute("boardList", boardDTOList);
       PageDTO pageDTO = boardService.pageNumber(page);
       model.addAttribute("paging",pageDTO);
        return "boardList";
    }
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id,Model model){
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.findFile(id);
            model.addAttribute("boardFile", boardFileDTOList);
        }
        return "boardDetail";
    }
    @GetMapping("/delete/check")
    public String deleteCheck(@RequestParam("id") Long id, Model model){
        BoardDTO boardDTO = boardService.deleteCheck(id);
        model.addAttribute("board", boardDTO);
        return "deleteCheck";
    }
    @PostMapping("/delete")
    public String delete(@RequestParam("id") Long id,Model model){
        boardService.delete(id);
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "boardList";
    }
    @GetMapping("/update")
    public String update(@RequestParam("id") Long id, Model model){
        BoardDTO boardDTO = boardService.deleteCheck(id);
        model.addAttribute("board",boardDTO);
        return "boardUpdate";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model){
        boardService.update(boardDTO);
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "boardList";
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,@RequestParam("query") String query,Model model){
        List<BoardDTO> boardDTOList = boardService.search(searchType,query);
        model.addAttribute("boardList", boardDTOList);
        return "boardList";
    }
}
