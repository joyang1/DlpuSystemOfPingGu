package com.dlpu.eva.dboperate;

import hibernate.Eva;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.EvaTitle;

@Entity
public class EvaDBOperate {

	/**
	 * ��ȡָ����Ŀ����
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ����
	 */
	@SuppressWarnings("unchecked")
	public List<Eva> GetEva(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Eva as p order by p.evadate desc");
		q.setMaxResults(num);
		List<Eva> list = q.list();
		s.close();
		return list;
	}

	/**
	 * ��ȡ������
	 * 
	 * @param num
	 *            ÿҳ������
	 * @param page
	 *            ҳ��
	 * @return ������
	 */
	public ArrayList<EvaTitle> getEvaTitles(int num, int page) {
		int mynum = page * num;
		List<Eva> list = GetEva(mynum);
		ArrayList<EvaTitle> ets = new ArrayList<EvaTitle>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			Eva e = list.get(i);
			EvaTitle et = new EvaTitle();
			et.setEvaid(e.getEvaid());
			et.setEvatitle(e.getEvatitle());
			et.setEvadate(e.getEvadate().toString());
			ets.add(et);
		}
		return ets;
	}

	/**
	 * ��ȡ���м�¼������
	 * 
	 * @return ��¼����
	 */
	public int GetEvaNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Eva");
		int totolRows = Integer.parseInt((q.uniqueResult().toString()));
		return totolRows;
	}

	/**
	 * ���id��ѯ���жԵļ�¼
	 * 
	 * @param id
	 *            ׼����ѯ��id
	 * @return
	 */
	public Eva GetOneEva(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Eva q where q.evaid = :id");
		q.setString("id", id);
		Eva e = (Eva) q.uniqueResult();
		s.close();
		return e;
	}

	/**
	 * ɾ����ж�Ӧ�ļ�¼
	 * 
	 * @param id
	 * 
	 * @return ɾ���� true: �ɹ� | false : ʧ��
	 */
	public boolean DelOneEva(String id) {
		Eva e = GetOneEva(id);
		EvaDao ed = new EvaDao();
		return ed.Delete(e);
	}

	/**
	 * ���������һ����¼
	 * 
	 * @param e
	 * 
	 * @return true:�ɹ� | false: ʧ��
	 */
	public boolean AddOneEva(Eva e) {
		EvaDao ed = new EvaDao();
		return ed.Save(e);
	}

	/**
	 * �޸�һ����¼
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateOneEva(Eva e) {
		EvaDao ed = new EvaDao();
		return ed.Update(e);
	}

}
