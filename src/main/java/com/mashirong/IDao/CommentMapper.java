package com.mashirong.IDao;

import java.util.List;

import com.mashirong.domain.Comment;

public interface CommentMapper {
	List<Comment> selectAllCommentByShopId(int shopId);
	int insert(Comment record);
}
