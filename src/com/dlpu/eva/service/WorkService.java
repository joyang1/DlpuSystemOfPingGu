package com.dlpu.eva.service;

import hibernate.Work;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.common.WorkTitle;
import com.dlpu.eva.dboperate.WorkDBOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class WorkService {
	
	@ManyToOne
	private WorkDBOperate wdbo;

	public WorkService() {
		wdbo = new WorkDBOperate();
	}

	/**
	 * ��ȡ������(��������ʱ������)
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return 
	 */
	public ArrayList<Work> GetWork(int num) {
		List<Work> allWork = wdbo.GetWork(num);
		ArrayList<Work> getworks = new ArrayList<Work>();
		for (Work works : allWork) {
			getworks.add(works);
		}
		return getworks;
	}

	/**
	 * ��ȡ����
	 * 
	 * @param num
	 *            ��ȡ������
	 * @param page
	 *            ��ǰҳ��
	 * @return 
	 */
	public ArrayList<WorkTitle> GetWorkTitle(int num, int page) {
		ArrayList<WorkTitle> nta = wdbo.GetWorkTitle(num, page);
		return nta;
	}

	/**
	 * ��ȡ����
	 * 
	 * @return 
	 */
	public int GetWorkNum() {
		int num = wdbo.GetWorkNum();
		return num;
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ����
	 * 
	 * @param id
	 *            
	 * @return 
	 */
	public Work GetWorkById(String id) {
		return wdbo.GetOneWork(id);
	}

	/**
	 * ��ݱ��ɾ��
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneWork(String id) {
		return wdbo.DelOneWork(id);
	}

	/**
	 * ���һ����¼
	 * 
	 * @param work
	 *            
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneWork(Work work) {
		return wdbo.AddOneWork(work);
	}

	/**
	 * �޸�һ���¼
	 * 
	 * @param work
	 * @return
	 */
	public boolean UpdateOneWork(Work work) {
		return wdbo.UpdateOneWork(work);
	}
	
}
