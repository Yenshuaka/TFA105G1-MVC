package com.postbejudged.model;

import java.util.List;

import com.postgoodrecord.model.PostGoodRecordBean;

public interface PostBeJudgedDAO {

	public abstract PostBeJudgedBean select(Integer postbejudgedid);

	public abstract List<PostBeJudgedBean> select();

	public abstract PostBeJudgedBean insert(PostBeJudgedBean bean);

	public abstract PostBeJudgedBean update(Integer postid, Integer memberid, String postbejudgedreason, Integer postbejudgedid);

	public abstract boolean delete(Integer postbejudgedid);
}
