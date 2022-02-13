package com.posttag.model;

import java.util.List;

import com.postgoodrecord.model.PostGoodRecordBean;

public interface PostTagDAO {

	public abstract PostTagBean select(Integer posttagid);

	public abstract List<PostTagBean> select();

	public abstract PostTagBean insert(PostTagBean bean);

	public abstract PostTagBean update(Integer postid, Integer tagid, Integer posttagid);

	public abstract boolean delete(Integer posttagid);
}
