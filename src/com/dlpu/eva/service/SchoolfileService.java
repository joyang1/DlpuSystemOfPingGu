package com.dlpu.eva.service;

import hibernate.Schoolfile;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.common.SchoolFIleTitle;
import com.dlpu.eva.dboperate.SchoolFileDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class SchoolfileService {

	@ManyToOne
	private SchoolFileDBOperate sfdbo;

	public SchoolfileService() {
		sfdbo = new SchoolFileDBOperate();
	}

	/**
	 * ��ȡѧУ�ļ���(��������ʱ������)
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ��ѧУ�ļ���
	 */
	public ArrayList<Schoolfile> getSchoolfiles(int num) {
		List<Schoolfile> sfs = sfdbo.GetSchoolFile(num);
		ArrayList<Schoolfile> getsf = new ArrayList<Schoolfile>();
		for (Schoolfile sf : sfs) {
			getsf.add(sf);
		}
		return getsf;
	}

	/**
	 * ��ȡѧУ�ļ��ı���
	 * 
	 * @param num
	 *            ��ȡ������
	 * @param page
	 *            ��ǰҳ��
	 * @return �ļ�������
	 */
	public ArrayList<SchoolFIleTitle> getSchoolfileTitles(int num, int page) {
		return sfdbo.getSchoolFIleTitles(num, page);
	}

	/**
	 * ��ȡ�ļ�������
	 * 
	 * @return �����ļ��ĸ���
	 */
	public int GetSchoolfileNum() {
		int num = sfdbo.GetSchoolfileNum();
		return num;
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ�ļ�
	 * 
	 * @param id
	 *            �ļ����
	 * @return һ���ļ���
	 */
	public Schoolfile GetSchoolfileById(String id) {
		return sfdbo.GetOneSchoolfile(id);
	}

	/**
	 * ��ݱ��ɾ������ļ�
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneSchoolfile(String id) {
		// ɾ����ļ�
		Schoolfile sf = GetSchoolfileById(id);
		if (sf.getFileurl() != null) {
			if (!sf.getFileurl().equals("")) {
				// ����ļ���ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetSchoolfileURL(), sf.getFileurl(), false);
			}
		}
		// ɾ����ļ���¼
		return sfdbo.DelOneSchoolfile(id);
	}

	/**
	 * ����ļ�
	 * 
	 * @param schoolfile
	 *            ׼����ӵ��ļ���
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneSchoolfile(Schoolfile schoolfile) {
		return sfdbo.AddOneSchoolfile(schoolfile);
	}

	/**
	 * �����ļ�
	 * 
	 * @param schoolfile
	 * @return
	 */
	public boolean UpdateSchoolfile(Schoolfile schoolfile) {
		return sfdbo.UpdateOneSchoolfile(schoolfile);
	}

}
