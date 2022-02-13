package com.post.model;

import java.util.List;

import com.postbejudged.model.PostBeJudgedBean;

public interface PostDAO {

	public abstract PostBean select(Integer postid);

	public abstract List<PostBean> select();

	public abstract PostBean insert(PostBean bean);

	public abstract PostBean update(Integer memberid, String posttitle, Integer posttypeid, 
			String postcontent, java.sql.Timestamp posttime, Integer poststatus, Integer postrewardpoints,
			byte[] postpicture, Integer postid);

	public abstract boolean delete(Integer postid);
}
