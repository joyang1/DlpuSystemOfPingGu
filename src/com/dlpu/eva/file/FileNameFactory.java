package com.dlpu.eva.file;

import javax.persistence.Entity;

@Entity
public class FileNameFactory {

	/**
	 * �޸��ļ���
	 * @param arg
	 * @param orgName
	 * @return
	 */
	public String changeFileName(String arg, String orgName) {
		if (orgName != null && !orgName.equals("")) {
			String[] tempString = orgName.split("\\.");
			if (tempString.length < 2) {
				return null;
			}
			return arg + "." + tempString[tempString.length - 1];
		} else {
			return null;
		}
	}

}
