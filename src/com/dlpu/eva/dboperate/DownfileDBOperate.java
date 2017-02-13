package com.dlpu.eva.dboperate;

import hibernate.Downfile;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;

@Entity
public class DownfileDBOperate {
	
	/**
	 * ��ȡָ����Ŀ����
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ����
	 */
	@SuppressWarnings("unchecked")
	public List<Downfile> GetDownfile(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Downfile d order by d.fileid desc");
		q.setMaxResults(num);
		List<Downfile> list = q.list();
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
	public ArrayList<Downfile> getDownfile(int num, int page) {
		int mynum = page * num;
		List<Downfile> list = GetDownfile(mynum);
		ArrayList<Downfile> ets = new ArrayList<Downfile>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			ets.add(list.get(i));
		}
		return ets;
	}

	/**
	 * ��ȡ���м�¼������
	 * 
	 * @return ��¼����
	 */
	public int GetDownfileNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Downfile");
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
	public Downfile GetOneDownfile(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Downfile q where q.fileid = :id");
		q.setString("id", id);
		Downfile e = (Downfile) q.uniqueResult();
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
	public boolean DelOneDownfile(String id) {
		Downfile e = GetOneDownfile(id);
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
	public boolean AddOneDownfile(Downfile e) {
		EvaDao ed = new EvaDao();
		return ed.Save(e);
	}

	/**
	 * �޸�һ����¼
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateOneDownfile(Downfile e) {
		EvaDao ed = new EvaDao();
		return ed.Update(e);
	}
	
}
