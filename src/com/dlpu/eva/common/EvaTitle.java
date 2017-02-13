package com.dlpu.eva.common;

import javax.persistence.Entity;

@Entity
public class EvaTitle {

	private String evaid;
	private String evatitle;
	private String evadate;

	public String getEvaid() {
		return evaid;
	}

	public void setEvaid(String evaid) {
		this.evaid = evaid;
	}

	public String getEvatitle() {
		return evatitle;
	}

	public void setEvatitle(String evatitle) {
		this.evatitle = evatitle;
	}

	public String getEvadate() {
		return evadate;
	}

	public void setEvadate(String evadate) {
		this.evadate = evadate;
	}

}
