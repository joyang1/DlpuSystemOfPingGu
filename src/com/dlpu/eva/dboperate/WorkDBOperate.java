package com.dlpu.eva.dboperate;

import hibernate.Work;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.WorkTitle;

@Entity
public class WorkDBOperate {

	/**
	 * ��ȡָ����Ŀ�Ĺ�����
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ�Ĺ�����
	 */
	@SuppressWarnings("unchecked")
	public List<Work> GetWork(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Work as p order by p.workdate desc");
		q.setMaxResults(num);
		List<Work> list = q.list();
		s.close();
		return list;
	}

	/**
	 * ��ȡ�����ı�����
	 * 
	 * @param num
	 *            ÿҳ������
	 * @param page
	 *            ҳ��
	 * @return �ŵı�����
	 */
	public ArrayList<WorkTitle> GetWorkTitle(int num, int page) {
		int mynum = page * num;
		List<Work> list = GetWork(mynum);
		ArrayList<WorkTitle> nta = new ArrayList<WorkTitle>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			Work n = list.get(i);
			WorkTitle nt = new WorkTitle();
			nt.setWorkid(n.getWorkid());
			nt.setWorktitle(n.getWorktitle());
			nt.setWorkdate(n.getWorkdate().toString());
			nta.add(nt);
		}
		return nta;
	}

	/**
	 * ��ȡWork���м�¼������
	 * 
	 * @return news��¼����
	 */
	public int GetWorkNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Work");
		int totolRows = Integer.parseInt((q.uniqueResult().toString()));
		return totolRows;
	}

	/**
	 * ���id��ѯWork���ж�ӦWorkid�ļ�¼
	 * 
	 * @param id
	 *            ׼����ѯ��id
	 * @return һ��Work��
	 */
	public Work GetOneWork(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Work n where n.workid = :id");
		q.setString("id", id);
		Work n = (Work) q.uniqueResult();
		s.close();
		return n;
	}

	/**
	 * ɾ����ж�Ӧ�ļ�¼
	 * 
	 * @param Id
	 * @return ɾ���� true: �ɹ� | false : ʧ��
	 */
	public boolean DelOneWork(String Id) {
		Work n = GetOneWork(Id);
		EvaDao ed = new EvaDao();
		return ed.Delete(n);
	}

	/**
	 * ��news��������һ����¼
	 * 
	 * @param oneWork
	 * 
	 * @return true:�ɹ� | false: ʧ��
	 */
	public boolean AddOneWork(Work oneWork) {
		EvaDao ed = new EvaDao();
		return ed.Save(oneWork);
	}

	/**
	 * �޸�һ����Ϣ
	 * 
	 * @param oneWork
	 * @return
	 */
	public boolean UpdateOneWork(Work oneWork) {
		EvaDao ed = new EvaDao();
		return ed.Update(oneWork);
	}

}
