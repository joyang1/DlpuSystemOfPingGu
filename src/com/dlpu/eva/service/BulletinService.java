package com.dlpu.eva.service;

import hibernate.Bulletin;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.common.BulletinTitle;
import com.dlpu.eva.dboperate.BulletinDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class BulletinService {

	@ManyToOne
	private BulletinDBOperate bdbo;

	public BulletinService() {
		bdbo = new BulletinDBOperate();
	}

	/**
	 * ��ȡ��������(��������ʱ������)
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ����
	 */
	public ArrayList<Bulletin> getBulletins(int num) {
		List<Bulletin> el = bdbo.GetBulletin(num);
		ArrayList<Bulletin> bs = new ArrayList<Bulletin>();
		for (Bulletin e : el) {
			bs.add(e);
		}
		return bs;
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
	public ArrayList<BulletinTitle> getBulletinTitles(int num, int page) {
		return bdbo.getBulletinTitles(num, page);
	}

	/**
	 * ��ȡ�ļ�������
	 * 
	 * @return �����ļ��ĸ���
	 */
	public int GetBulletinNum() {
		return bdbo.GetBulletinNum();
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ�ļ�
	 * 
	 * @param id
	 *            �ļ����
	 * @return һ���ļ���
	 */
	public Bulletin GetBulletinById(String id) {
		return bdbo.GetOneBulletin(id);
	}

	/**
	 * ��ݱ��ɾ������ļ�
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneBulletin(String id) {
		// ɾ����ļ�
		Bulletin e = GetBulletinById(id);
		if (e.getBulletinurl() != null) {
			if (!e.getBulletinurl().equals("")) {
				// ����ļ���ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetBulletinfileURL(), e.getBulletinurl(), false);
			}
		}
		// ɾ����ļ���¼
		return bdbo.DelOneBulletin(id);
	}

	/**
	 * ����ļ�
	 * 
	 * @param e
	 *            ׼����ӵ��ļ���
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneBulletin(Bulletin e) {
		return bdbo.AddOneBulletin(e);
	}

	/**
	 * �����ļ�
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateBulletin(Bulletin e) {
		return bdbo.UpdateOneBulletin(e);
	}

}
