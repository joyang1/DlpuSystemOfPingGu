package com.dlpu.eva.service;

import hibernate.Material;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.dboperate.MaterialDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class MaterialService {

	@ManyToOne
	private MaterialDBOperate mdbo;

	public MaterialService() {
		mdbo = new MaterialDBOperate();
	}

	/**
	 * ��ȡ
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ����
	 */
	public ArrayList<Material> getMaterial(int num) {
		List<Material> el = mdbo.GetMaterial(num);
		ArrayList<Material> es = new ArrayList<Material>();
		for (Material e : el) {
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
	public ArrayList<Material> getMaterial(int num, int page) {
		return mdbo.getMaterial(num, page);
	}

	/**
	 * ��ȡ�ļ�������
	 * 
	 * @return �����ļ��ĸ���
	 */
	public int GetMaterialNum() {
		return mdbo.GetMaterialNum();
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ�ļ�
	 * 
	 * @param id
	 *            �ļ����
	 * @return һ���ļ���
	 */
	public Material GetMaterialById(String id) {
		return mdbo.GetOneMaterial(id);
	}

	/**
	 * ��ݱ��ɾ������ļ�
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneMaterial(String id) {
		// ɾ����ļ�
		Material e = GetMaterialById(id);
		if (e.getMaterialurl() != null) {
			if (!e.getMaterialurl().equals("")) {
				// ����ļ���ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetMaterialfileURL(), e.getMaterialurl(), false);
			}
		}
		// ɾ����ļ���¼
		return mdbo.DelOneMaterial(id);
	}

	/**
	 * ����ļ�
	 * 
	 * @param e
	 *            ׼����ӵ��ļ���
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneMaterial(Material e) {
		return mdbo.AddOneMaterial(e);
	}

	/**
	 * �����ļ�
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateMaterial(Material e) {
		return mdbo.UpdateOneMaterial(e);
	}

}
