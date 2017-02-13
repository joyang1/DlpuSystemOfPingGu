package com.dlpu.eva.common;

import javax.persistence.Entity;

@Entity
public class WorkTitle {

	private String workid;
	private String worktitle;
	private String workdate;

	public String getWorkid() {
		return workid;
	}

	public void setWorkid(String workid) {
		this.workid = workid;
	}

	public String getWorktitle() {
		return worktitle;
	}

	public void setWorktitle(String worktitle) {
		this.worktitle = worktitle;
	}

	public String getWorkdate() {
		return workdate;
	}

	public void setWorkdate(String workdate) {
		this.workdate = workdate;
	}

}
