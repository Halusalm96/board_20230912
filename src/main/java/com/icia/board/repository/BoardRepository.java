package com.icia.board.repository;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
public class BoardRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO boardSave(BoardDTO boardDTO) {
        sql.insert("Board.insert", boardDTO);
        return boardDTO;
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.selectList");
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.selectOne",id);
    }

    public void delete(Long id) {
        sql.delete("Board.delete",id);
    }

    public BoardDTO deleteCheck(Long id) {
        return sql.selectOne("Board.deleteCheck",id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update",boardDTO);
    }

    public List<BoardDTO> search(String searchType, String p) {
        if("name".equals(searchType)) {
            return sql.selectList("Board.searchName",p);
        }else if("title".equals(searchType)) {
            return sql.selectList("Board.searchTitle",p);
        }
        return Collections.emptyList();
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits",id);
    }

    public BoardDTO findByBoardId(Long boardId) {
        return sql.selectOne("Board.findByBoardId",boardId);
    }

    public void saveFile(BoardFileDTO boardFileDTO) {
        sql.insert("Board.saveFile",boardFileDTO);
    }
}
