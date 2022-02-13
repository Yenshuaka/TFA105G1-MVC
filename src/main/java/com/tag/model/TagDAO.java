package com.tag.model;

import java.util.List;

import com.postgoodrecord.model.PostGoodRecordBean;

public interface TagDAO {

	public abstract TagBean select(Integer tagid);

	public abstract List<TagBean> select();

	public abstract TagBean insert(TagBean bean);

	public abstract TagBean update(String tagname, Integer tagid);

	public abstract boolean delete(Integer tagid);
}
