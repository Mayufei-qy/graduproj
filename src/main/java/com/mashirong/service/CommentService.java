package com.mashirong.service;

import java.util.List;

import com.mashirong.domain.Comment;
import com.mashirong.domain.CommentVo;

public interface CommentService {
	List<CommentVo> getAllCommentOfShop(int shopid);
	int insertComment(Comment comment);
	int getCountOfComment(int shopid);
}
