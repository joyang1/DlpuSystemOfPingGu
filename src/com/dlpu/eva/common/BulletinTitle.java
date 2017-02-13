package com.dlpu.eva.common;

import javax.persistence.Entity;

@Entity
public class BulletinTitle {

	private String bulletinid;
	private String bulletintitle;
	private String bulletindate;

	public String getBulletinid() {
		return bulletinid;
	}

	public void setBulletinid(String bulletinid) {
		this.bulletinid = bulletinid;
	}

	public String getBulletintitle() {
		return bulletintitle;
	}

	public void setBulletintitle(String bulletintitle) {
		this.bulletintitle = bulletintitle;
	}

	public String getBulletindate() {
		return bulletindate;
	}

	public void setBulletindate(String bulletindate) {
		this.bulletindate = bulletindate;
	}

}
