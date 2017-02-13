package com.dlpu.eva.checkurl;

import javax.persistence.Entity;

@Entity
public class CheckHttpURL {

	// �Գ����ӵļ��
	public String check(String url) {
		String head = url.substring(0, 4);
		if (!head.equals("http")) {
			String h = url.substring(0, 3);
			if (!h.equals("ftp")) {
				url = "http://" + url;
			}
		}
		return url;
	}

}
