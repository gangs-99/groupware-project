package com.sh.groupware.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.sh.groupware.board.model.dto.Board;
import com.sh.groupware.common.dto.Attachment;

public interface BoardService {

	List<Board> selectBoardList(RowBounds rowBounds);

	int insertBoard(Board board);

	Board selectOneBoardCollection(String no);

	Attachment selectOneAttachment(String no);

	int selectBoardCount();

	Board selectBoardByNo(String no);

	int deleteBoard(String no);

	int updateBoard(Board board);




}
