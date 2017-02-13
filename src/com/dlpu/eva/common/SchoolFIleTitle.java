package com.dlpu.eva.common;

import javax.persistence.Entity;

@Entity
public class SchoolFIleTitle {

	private String schoolfileid;
	private String schoolfiletitle;
	private String schoolfiletime;

	public String getSchoolfileid() {
		return schoolfileid;
	}

	public void setSchoolfileid(String schoolfileid) {
		this.schoolfileid = schoolfileid;
	}

	public String getSchoolfiletitle() {
		return schoolfiletitle;
	}

	public void setSchoolfiletitle(String schoolfiletitle) {
		this.schoolfiletitle = schoolfiletitle;
	}

	public String getSchoolfiletime() {
		return schoolfiletime;
	}

	public void setSchoolfiletime(String schoolfiletime) {
		this.schoolfiletime = schoolfiletime;
	}

}
