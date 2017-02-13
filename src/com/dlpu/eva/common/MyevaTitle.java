package com.dlpu.eva.common;

import javax.persistence.Entity;

@Entity
public class MyevaTitle {

	private String myevaid;
	private String myevatitle;
	private String myevadate;

	public String getMyevaid() {
		return myevaid;
	}

	public void setMyevaid(String myevaid) {
		this.myevaid = myevaid;
	}

	public String getMyevatitle() {
		return myevatitle;
	}

	public void setMyevatitle(String myevatitle) {
		this.myevatitle = myevatitle;
	}

	public String getMyevadate() {
		return myevadate;
	}

	public void setMyevadate(String myevadate) {
		this.myevadate = myevadate;
	}

}
