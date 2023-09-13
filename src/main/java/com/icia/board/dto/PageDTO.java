package com.icia.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Service;

@Setter
@Getter
@ToString
public class PageDTO {
    private int page;
    private int maxPage;
    private int startPage;
    private int endPage;
}
