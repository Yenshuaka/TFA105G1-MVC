package com.postcomment.model;

import java.sql.Timestamp;
import java.util.List;

import com.postgoodrecord.model.PostGoodRecordBean;

public interface PostCommentDAO {

	public abstract PostCommentBean select(Integer commentid);

	public abstract List<PostCommentBean> select();

	public abstract PostCommentBean insert(PostCommentBean bean);

	public abstract PostCommentBean update(Integer memberid, Integer postid, String commentcontent, Timestamp commenttime, Integer commentid);

	public abstract boolean delete(Integer commentid);
}
