package com.mashirong.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mashirong.IDao.CommentMapper;
import com.mashirong.domain.Comment;
import com.mashirong.domain.CommentVo;
import com.mashirong.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentMapper cm;
	
	@Override
	public List<CommentVo> getAllCommentOfShop(int shopid) {
		// TODO Auto-generated method stub
		List<Comment> listC = cm.selectAllCommentByShopId(shopid);
		
		List<CommentVo> requirementVoList = this.buildMenuByRecursive(listC);
		
		return requirementVoList;
	}

	private List<CommentVo> buildMenuByRecursive(List<Comment> comments){
        List<CommentVo> commentVos = new ArrayList<>();
        for(Comment comment : comments){
            if(comment.getCommParentid() == null){
            	CommentVo commentVo = this.createCommentVo(comment);
            	commentVos.add(this.findChildren(commentVo, comments));
            }
        }
        return commentVos;
    }
	
	private CommentVo findChildren(CommentVo commentVo, List<Comment> comments){
        for(Comment comment : comments){
            if(comment.getCommParentid() != null && commentVo.getCommid() == comment.getCommParentid()){
            	CommentVo commentVo1 = this.createCommentVo(comment);
                if(commentVo.getList() == null){   //子节点没有new list
                	commentVo.setList(new ArrayList<CommentVo>());
                }
                commentVo.getList().add(this.findChildren(commentVo1, comments));
            }
        }
        return commentVo;
    }


    private CommentVo createCommentVo(Comment comment) {
        CommentVo commentVo = new CommentVo();
        commentVo.setCommid(comment.getCommid());
        commentVo.setCommParentid(comment.getCommParentid());
        commentVo.setEmail(comment.getEmail());
        commentVo.setScore(comment.getScore());
        commentVo.setShopid(comment.getShopid());
        commentVo.setUserid(comment.getUserid());
        commentVo.setCommcontent(comment.getCommcontent());
        commentVo.setCommtime(comment.getCommtime());
        return commentVo;
    }

	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return cm.insert(comment);
	}

	@Override
	public int getCountOfComment(int shopid) {
		// TODO Auto-generated method stub
		return cm.getCountOfComment(shopid);
	}
}
