package com.dlpu.eva.service;

import hibernate.Myeva;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.common.MyevaTitle;
import com.dlpu.eva.dboperate.MyevaDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class MyevaService {
	@ManyToOne
	private MyevaDBOperate mdbo;

	public MyevaService() {
		mdbo = new MyevaDBOperate();
	}

	/**
	 * ��ȡ��������(��������ʱ������)
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ����
	 */
	public ArrayList<Myeva> getMyevas(int num) {
		List<Myeva> ml = mdbo.GetMyeva(num);
		ArrayList<Myeva> ms = new ArrayList<Myeva>();
		for (Myeva m : ml) {
			ms.add(m);
		}
		return ms;
	}

	/**
	 * ��ȡ�����򱨵ı���
	 * 
	 * @param num
	 *            ��ȡ������
	 * @param page
	 *            ��ǰҳ��
	 * @return
	 */
	public ArrayList<MyevaTitle> getMyevaTitles(int num, int page) {
		return mdbo.getMyevaTitles(num, page);
	}

	/**
	 * ��ȡ�ļ�������
	 * 
	 * @return �����ļ��ĸ���
	 */
	public int GetMyevaNum() {
		return mdbo.GetMyevaNum();
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ�ļ�
	 * 
	 * @param id
	 *            �ļ����
	 * @return һ���ļ���
	 */
	public Myeva GetMyevaById(String id) {
		return mdbo.GetOneMyeva(id);
	}

	/**
	 * ��ݱ��ɾ������ļ�
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneMyeva(String id) {
		// ɾ����ļ�
		Myeva e = GetMyevaById(id);
		if (e.getMyevafileurl() != null) {
			if (!e.getMyevafileurl().equals("")) {
				// ����ļ���ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetMyevafileURL(), e.getMyevafileurl(), false);
			}
		}
		// ɾ����ļ���¼
		return mdbo.DelOneMyeva(id);
	}

	/**
	 * ����ļ�
	 * 
	 * @param e
	 *            ׼����ӵ��ļ���
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneMyeva(Myeva e) {
		return mdbo.AddOneMyeva(e);
	}

	/**
	 * �����ļ�
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateMyeva(Myeva e) {
		return mdbo.UpdateOneMyeva(e);
	}
}
