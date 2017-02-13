package com.dlpu.eva.service;

import hibernate.Datasystem;

import java.util.ArrayList;

import com.dlpu.eva.dboperate.DatasystemDBOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class DatasystemService {

	@ManyToOne
	private DatasystemDBOperate ddbo;

	public DatasystemService() {
		ddbo = new DatasystemDBOperate();
	}

	/**
	 * ��ȡ��
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ����
	 */
	public ArrayList<Datasystem> getDatasystem(int num) {
		return ddbo.GetDatasystem(num);
	}

	/**
	 * ��ȡ�ļ�������
	 * 
	 * @return �����ļ��ĸ���
	 */
	public int GetDatasystemNum() {
		return ddbo.GetDatasystemNum();
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ�ļ�
	 * 
	 * @param id
	 *            �ļ����
	 * @return һ���ļ���
	 */
	public Datasystem GetDatasystemById(String id) {
		return ddbo.GetOneDatasystem(id);
	}
	
	/**
	 * ��ҳ��ȡ
	 * @param num
	 * @param page
	 * @return
	 */
	public ArrayList<Datasystem> GetDatasystem(int num, int page){
		return ddbo.getDatasystem(num, page);
	}

	/**
	 * ��ݱ��ɾ������ļ�
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneDatasystem(String id) {
		return ddbo.DelOneDatasystem(id);
	}

	/**
	 * ����ļ�
	 * 
	 * @param e
	 *            ׼����ӵ��ļ���
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneDatasystem(Datasystem e) {
		return ddbo.AddOneDatasystem(e);
	}

	/**
	 * �����ļ�
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateDatasystem(Datasystem e) {
		return ddbo.UpdateOneDatasystem(e);
	}

}
