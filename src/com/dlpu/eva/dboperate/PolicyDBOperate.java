package com.dlpu.eva.dboperate;

import hibernate.Policy;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.PolicyTitle;

@Entity
public class PolicyDBOperate {

	/**
	 * ��ȡָ��num��Policy��
	 * 
	 * @param num
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Policy> GetNews(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Policy as p order by p.policydate desc");
		q.setMaxResults(num);
		List<Policy> list = q.list();
		s.close();
		return list;
	}

	/**
	 * ��ȡָ��numָ��page�����߱�����
	 * 
	 * @param num
	 *            ÿҳ��ʾ������
	 * @param page
	 *            ��ǰҳ��
	 * @return
	 */
	public ArrayList<PolicyTitle> GetPolicyTitle(int num, int page) {
		int mynum = page * num;
		List<Policy> list = GetNews(mynum);
		ArrayList<PolicyTitle> pta = new ArrayList<PolicyTitle>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			Policy n = list.get(i);
			PolicyTitle pt = new PolicyTitle();
			pt.setPolicyId(n.getPolicyid());
			pt.setPolicyTitle(n.getPolicytitle());
			pt.setPolicyTime(n.getPolicydate().toString());
			pta.add(pt);
		}
		return pta;
	}

	/**
	 * ��ȡ���ߵ���Ŀ
	 * 
	 * @return
	 */
	public int GetPolicyNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Policy");
		int totolRows = Integer.parseInt((q.uniqueResult().toString()));
		return totolRows;
	}

	/**
	 * ���id��ѯһ��Policy��¼
	 * 
	 * @param id
	 * @return
	 */
	public Policy GetOnePolicy(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Policy n where n.policyid = :id");
		q.setString("id", id);
		Policy p = (Policy) q.uniqueResult();
		s.close();
		return p;
	}

	/**
	 * ���һ�����߾���
	 * 
	 * @param onePolicy
	 * @return
	 */
	public boolean AddOnePolicy(Policy onePolicy) {
		EvaDao ed = new EvaDao();
		return ed.Save(onePolicy);
	}

	/**
	 * ɾ��һ�����߾����¼
	 * 
	 * @param policyId
	 * @return
	 */
	public boolean DelOnePolicy(String policyId) {
		Policy p = GetOnePolicy(policyId);
		EvaDao ed = new EvaDao();
		return ed.Delete(p);
	}

	/**
	 * �޸�һ������
	 * 
	 * @param policy
	 * @return
	 */
	public boolean UpdateOnePolicy(Policy policy) {
		EvaDao ed = new EvaDao();
		return ed.Update(policy);
	}

}
