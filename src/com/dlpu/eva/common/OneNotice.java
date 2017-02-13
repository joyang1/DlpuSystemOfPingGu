package com.dlpu.eva.common;

import java.util.ArrayList;

import hibernate.Notice;
import hibernate.Noticefile;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class OneNotice {

	@ManyToOne
	private Notice notice;
	private ArrayList<Noticefile> noticefiles;

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public ArrayList<Noticefile> getNoticefiles() {
		return noticefiles;
	}

	public void setNoticefiles(ArrayList<Noticefile> noticefiles) {
		this.noticefiles = noticefiles;
	}

}
