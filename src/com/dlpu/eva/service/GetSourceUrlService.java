package com.dlpu.eva.service;

import com.dlpu.eva.dboperate.SourceUrlDBOperate;
import com.dlpu.eva.global.Global;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class GetSourceUrlService {

	@ManyToOne
	SourceUrlDBOperate sudbo;

	public GetSourceUrlService() {
		sudbo = new SourceUrlDBOperate();
	}

	/**
	 * ��ȡ�����ļ��Ĵ�ŵ�ַ
	 * 
	 * @return
	 */
	public String GetNewsFileUrl() {
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.NEWSFILE_STRING + "\\\\";
		return getTotalString;
	}

	/**
	 * ��ȡ֪ͨ�ļ��Ĵ�ŵ�ַ
	 * 
	 * @return
	 */
	public String GetNoticeFileUrl() {
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.NOTICEFILE_STRING + "\\\\";
		return getTotalString;
	}

	/**
	 * ��ȡ���߾����ļ��Ĵ�ŵ�ַ
	 * 
	 * @return
	 */
	public String GetPolicyFileURL() {
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.POLICYFILE_STRING + "\\\\";
		return getTotalString;
	}

	/**
	 * ��ȡ���������ļ��Ĵ�ŵ�ַ
	 * 
	 * @return
	 */
	public String GetQualityFileURL() {
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.QUAFILE_STRING + "\\\\";
		return getTotalString;
	}

	/**
	 * ��ȡѧУ��ͷ�ļ���ŵĵ�ַ
	 * 
	 * @return
	 */
	public String GetSchoolfileURL() {
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.SCHOOLFILE_STRING + "\\\\";
		return getTotalString;
	}
	
	/**
	 * ��ȡרҵ�����ļ���ŵ�ַ
	 * @return
	 */
	public String GetEvafileURL(){
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.EVAFILE_STRING + "\\\\";
		return getTotalString;
	}
	
	/**
	 * ��ȡ�������ļ���ŵ�ַ
	 * @return
	 */
	public String GetBulletinfileURL(){
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.BULLETINFILE_STRING + "\\\\";
		return getTotalString;
	}
	
	/**
	 * ��ȡ���������ļ��Ĵ�ŵ�ַ
	 * @return
	 */
	public String GetMyevafileURL(){
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.MYEVA_STRING + "\\\\";
		return getTotalString;
	}
	
	/**
	 * ��ȡ�����ļ��ĵ�ַ
	 * @return
	 */
	public String GetDownfileURL(){
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.FILEDOWNLOAD_STRING + "\\\\";
		return getTotalString;
	}
	
	/**
	 * ��ȡ�����ļ���ַ
	 * @return
	 */
	public String GetMaterialfileURL(){
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.MYEVA_STRING + "\\\\";
		return getTotalString;
	}
	
	/**
	 * ��ȡ��֯���ͼƬ�ļ���ַ
	 * @return
	 */
	public String GetTissuefileURL(){
		String getTotalString = sudbo.GetSourceFileURL();
		if (!getTotalString.endsWith("\\\\")) {
			getTotalString = getTotalString + "\\\\";
		}
		getTotalString = getTotalString + Global.TISSUE_STRING + "\\\\";
		return getTotalString;
	}
	
}
