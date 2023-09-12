package com.icia.board.repository;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void commentSave(CommentDTO commentDTO) {
        sql.insert("Comment.commentSave",commentDTO);
    }

    public List<CommentDTO> findByBoardId(Long boardId) {
        return sql.selectList("Comment.findByBoardId",boardId);
    }

}
