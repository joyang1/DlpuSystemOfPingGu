package com.dlpu.eva.service;

import hibernate.Downfile;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.dboperate.DownfileDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class DownfileService {

	@ManyToOne
	private DownfileDBOperate ddbo;

	public DownfileService() {
		ddbo = new DownfileDBOperate();
	}

	/**
	 * ��ȡ
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ����
	 */
	public ArrayList<Downfile> getDownfile(int num) {
		List<Downfile> el = ddbo.GetDownfile(num);
		ArrayList<Downfile> es = new ArrayList<Downfile>();
		for (Downfile e : el) {
			es.add(e);
		}
		return es;
	}

	/**
	 * ��ȡ
	 * 
	 * @param num
	 *            ��ȡ������
	 * @param page
	 *            ��ǰҳ��
	 * @return
	 */
	public ArrayList<Downfile> getDownfile(int num, int page) {
		return ddbo.getDownfile(num, page);
	}

	/**
	 * ��ȡ�ļ�������
	 * 
	 * @return �����ļ��ĸ���
	 */
	public int GetDownfileNum() {
		return ddbo.GetDownfileNum();
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ�ļ�
	 * 
	 * @param id
	 *            �ļ����
	 * @return һ���ļ���
	 */
	public Downfile GetDownfileById(String id) {
		return ddbo.GetOneDownfile(id);
	}

	/**
	 * ��ݱ��ɾ������ļ�
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneDownfile(String id) {
		// ɾ����ļ�
		Downfile e = GetDownfileById(id);
		if (e.getFileurl() != null) {
			if (!e.getFileurl().equals("")) {
				// ����ļ���ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetDownfileURL(), e.getFileurl(), false);
			}
		}
		// ɾ����ļ���¼
		return ddbo.DelOneDownfile(id);
	}

	/**
	 * ����ļ�
	 * 
	 * @param e
	 *            ׼����ӵ��ļ���
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneDownfile(Downfile e) {
		return ddbo.AddOneDownfile(e);
	}

	/**
	 * �����ļ�
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateDownfile(Downfile e) {
		return ddbo.UpdateOneDownfile(e);
	}

}
