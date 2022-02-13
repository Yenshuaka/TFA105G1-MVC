package com.commentbejudged.model;

import java.util.List;

import com.postbejudged.model.PostBeJudgedBean;

public interface CommentBeJudgedDAO {

	public abstract CommentBeJudgedBean select(Integer commentbejudgedid);

	public abstract List<CommentBeJudgedBean> select();

	public abstract CommentBeJudgedBean insert(CommentBeJudgedBean bean);

	public abstract CommentBeJudgedBean update(Integer commentid, Integer memberid, String commentbejudgedreason, Integer commentbejudgedid);

	public abstract boolean delete(Integer commentbejudgedid);
}
