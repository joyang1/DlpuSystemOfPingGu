package com.dlpu.eva.common;

import javax.persistence.Entity;

@Entity
public class QualityTitle {

	private String quaid;
	private String quatitle;
	private String quadate;

	/**
	 * @return the quaid
	 */
	public String getQuaid() {
		return quaid;
	}

	/**
	 * @param quaid
	 *            the quaid to set
	 */
	public void setQuaid(String quaid) {
		this.quaid = quaid;
	}

	/**
	 * @return the quatitle
	 */
	public String getQuatitle() {
		return quatitle;
	}

	/**
	 * @param quatitle
	 *            the quatitle to set
	 */
	public void setQuatitle(String quatitle) {
		this.quatitle = quatitle;
	}

	/**
	 * @return the quadate
	 */
	public String getQuadate() {
		return quadate;
	}

	/**
	 * @param quadate
	 *            the quadate to set
	 */
	public void setQuadate(String quadate) {
		this.quadate = quadate;
	}

}
