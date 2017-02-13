package com.dlpu.eva.service;

import hibernate.Eva;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.common.EvaTitle;
import com.dlpu.eva.dboperate.EvaDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class EvaService {

	@ManyToOne
	private EvaDBOperate edbo;

	public EvaService() {
		edbo = new EvaDBOperate();
	}

	/**
	 * ��ȡרҵ������(��������ʱ������)
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ����
	 */
	public ArrayList<Eva> getEva(int num) {
		List<Eva> el = edbo.GetEva(num);
		ArrayList<Eva> es = new ArrayList<Eva>();
		for (Eva e : el) {
			es.add(e);
		}
		return es;
	}

	/**
	 * ��ȡרҵ�����ı���
	 * 
	 * @param num
	 *            ��ȡ������
	 * @param page
	 *            ��ǰҳ��
	 * @return
	 */
	public ArrayList<EvaTitle> getEvaTitles(int num, int page) {
		return edbo.getEvaTitles(num, page);
	}

	/**
	 * ��ȡ�ļ�������
	 * 
	 * @return �����ļ��ĸ���
	 */
	public int GetEvaNum() {
		return edbo.GetEvaNum();
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ�ļ�
	 * 
	 * @param id
	 *            �ļ����
	 * @return һ���ļ���
	 */
	public Eva GetEvaById(String id) {
		return edbo.GetOneEva(id);
	}

	/**
	 * ��ݱ��ɾ������ļ�
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneEva(String id) {
		// ɾ����ļ�
		Eva e = GetEvaById(id);
		if (e.getEvaurl() != null) {
			if (!e.getEvaurl().equals("")) {
				// ����ļ���ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetEvafileURL(), e.getEvaurl(), false);
			}
		}
		// ɾ����ļ���¼
		return edbo.DelOneEva(id);
	}

	/**
	 * ����ļ�
	 * 
	 * @param e
	 *            ׼����ӵ��ļ���
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneEva(Eva e) {
		return edbo.AddOneEva(e);
	}

	/**
	 * �����ļ�
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateEva(Eva e) {
		return edbo.UpdateOneEva(e);
	}

}
