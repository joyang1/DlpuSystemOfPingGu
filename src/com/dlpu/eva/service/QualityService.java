package com.dlpu.eva.service;

import hibernate.Quality;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.common.QualityTitle;
import com.dlpu.eva.dboperate.QualityDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class QualityService {

	@ManyToOne
	private QualityDBOperate qdbo;

	public QualityService() {
		qdbo = new QualityDBOperate();
	}

	/**
	 * ��ȡ�ļ���(��������ʱ������)
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ��������
	 */
	public ArrayList<Quality> getQualities(int num,int type) {
		List<Quality> alleva = qdbo.GetQuality(num,type);
		ArrayList<Quality> getQuality = new ArrayList<Quality>();
		for (Quality eva : alleva) {
			getQuality.add(eva);
		}
		return getQuality;
	}

	/**
	 * ��ȡ�ļ��ı���,������ʾ����ҳ��
	 * 
	 * @param num
	 *            ��ȡ������
	 * @param page
	 *            ��ǰҳ��
	 * @return �ļ�������
	 */
	public ArrayList<QualityTitle> getQualityTitles(int num, int page,int type) {
		ArrayList<QualityTitle> eta = qdbo.GetQuaTitle(num, page,type);
		return eta;
	}
	public ArrayList<QualityTitle> getQualityTitles(int num, int page) {
		ArrayList<QualityTitle> eta = qdbo.GetQuaTitle(num, page);
		return eta;
	}

	/**
	 * ��ȡ�ļ�������
	 * 
	 * @return �����ļ��ĸ���
	 */
	public int GetQuaNum(int type) {
		int num = qdbo.GetQuaNum(type);
		return num;
	}
	public int GetQuaNum() {
		int num = qdbo.GetQuaNum();
		return num;
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ�ļ�
	 * 
	 * @param id
	 *            �ļ����
	 * @return һ���ļ���
	 */
	public Quality GetQuaById(String id) {
		Quality e = qdbo.GetOneQua(id);
		return e;
	}

	/**
	 * ��ݱ��ɾ������ļ�
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneQua(String id) {
		// ɾ����ļ�
		Quality e = GetQuaById(id);
		if (e.getQuaurl() != null) {
			if (!e.getQuaurl().equals("")) {
				// ����ļ���ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetQualityFileURL(), e.getQuaurl(), false);
			}
		}
		// ɾ����ļ���¼
		return qdbo.DelOneQua(id);
	}

	/**
	 * ����ļ�
	 * 
	 * @param aEva
	 *            ׼����ӵ��ļ���
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneQua(Quality aEva) {
		return qdbo.AddOneQua(aEva);
	}

	/**
	 * �����ļ�
	 * 
	 * @param quality
	 * @return
	 */
	public boolean UpdateQuailty(Quality quality) {
		return qdbo.UpdateOneQuality(quality);
	}

}
