package com.dlpu.eva.time;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Entity;

@Entity
public class GetSystemTime {

	/**
	 * ��ȡ����ʽ������ʱ��
	 * 
	 * @return Date����ʱ��
	 */
	public Date GetFullTime() {
		Date now = new Date();
		return now;
	}

	/**
	 * ����TimeStamp����ʱ��
	 * 
	 * @return
	 */
	public Timestamp GetFullTimeStamp() {
		return new Timestamp(System.currentTimeMillis());
	}
	

	/**
	 * ��ȡ��ǰϵͳ����ʱ��,���Դ�����ݿ���Ϊ���
	 * 
	 * @return
	 */
	public String GetFullTimeSQLHelper() {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String newtime = dateFormat.format(now);
		return newtime;
	}

	/**
	 * ��ȡϵͳʱ��
	 * 
	 * @return
	 */
	public String GetDate() {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy��MM��dd�� EEEE");
		String newtime = dateFormat.format(now);
		return newtime;
	}

}
