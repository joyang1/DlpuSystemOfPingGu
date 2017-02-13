package com.dlpu.eva.service;

import hibernate.Policy;

import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.common.PolicyTitle;
import com.dlpu.eva.dboperate.PolicyDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class PolicyService {

	@ManyToOne
	PolicyDBOperate pdbo;

	public PolicyService() {
		pdbo = new PolicyDBOperate();
	}

	/**
	 * ��ȡ������
	 * 
	 * @param num
	 * @return
	 */
	public ArrayList<Policy> GetPolicy(int num) {
		List<Policy> allp = pdbo.GetNews(num);
		ArrayList<Policy> getP = new ArrayList<Policy>();
		for (Policy p : allp) {
			getP.add(p);
		}
		return getP;
	}

	/**
	 * ���������ҳ���ȡ���߱�����
	 * 
	 * @param num
	 *            ����
	 * @param page
	 *            ҳ��
	 * @return
	 */
	public ArrayList<PolicyTitle> GetPolicyTitle(int num, int page) {
		ArrayList<PolicyTitle> pta = pdbo.GetPolicyTitle(num, page);
		return pta;
	}

	/**
	 * ��ȡ���ߵ���Ŀ
	 * 
	 * @return
	 */
	public int GetPolicyNum() {
		int num = pdbo.GetPolicyNum();
		return num;
	}

	/**
	 * ��ݱ�Ż�ȡ��Ӧ��������
	 * 
	 * @param id
	 * @return
	 */
	public Policy GetPolicyById(String id) {
		Policy n = pdbo.GetOnePolicy(id);
		return n;
	}

	/**
	 * ����һ�����߾���
	 * 
	 * @param p
	 * @return
	 */
	public boolean AddOnePolicy(Policy p) {
		return pdbo.AddOnePolicy(p);
	}

	/**
	 * ɾ��һ�����߾���
	 * 
	 * @param id
	 * @return
	 */
	public boolean DelOnePolicy(String id) {
		// ɾ������߾���ĸ���
		Policy p = GetPolicyById(id);
		if (p.getPolicyurl() != null) {
			if (!p.getPolicyurl().equals("")) {
				// �����Ƭ��ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetPolicyFileURL(), p.getPolicyurl(), false);
			}
		}
		return pdbo.DelOnePolicy(id);
	}

	/**
	 * �޸�һ������
	 * 
	 * @param policy
	 * @return
	 */
	public boolean UpdateOnePolicy(Policy policy) {
		return pdbo.UpdateOnePolicy(policy);
	}

}
