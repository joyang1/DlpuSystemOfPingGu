package com.dlpu.eva.common;

import javax.persistence.Entity;

@Entity
public class NoticeTitle {

	private String noticeid;
	private String noticetitle;
	private String noticetime;

	public String getNoticeid() {
		return noticeid;
	}

	public void setNoticeid(String noticeid) {
		this.noticeid = noticeid;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticetime() {
		return noticetime;
	}

	public void setNoticetime(String noticetime) {
		this.noticetime = noticetime;
	}

}
