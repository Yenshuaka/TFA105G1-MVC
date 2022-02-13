package com.postgoodrecord.model;

import java.util.List;

public interface PostGoodRecordDAO {

		public abstract PostGoodRecordBean select(Integer recordid);

		public abstract List<PostGoodRecordBean> select();

		public abstract PostGoodRecordBean insert(PostGoodRecordBean bean);

		public abstract PostGoodRecordBean update(Boolean trueorfalse, Integer memberid, Integer postid, Integer recordid);

		public abstract boolean delete(Integer recordid);

	
}
