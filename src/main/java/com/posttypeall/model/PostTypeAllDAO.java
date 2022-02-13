package com.posttypeall.model;

import java.util.List;

import com.postgoodrecord.model.PostGoodRecordBean;

public interface PostTypeAllDAO {

	public abstract PostTypeAllBean select(Integer posttypeid);

	public abstract List<PostTypeAllBean> select();

	public abstract PostTypeAllBean insert(PostTypeAllBean bean);

	public abstract PostTypeAllBean update(String posttypename, Integer typecount, Integer posttypeid);

	public abstract boolean delete(Integer posttypeid);
}
