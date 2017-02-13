package com.dlpu.eva.dboperate;

import hibernate.Datasystem;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;

@Entity
public class DatasystemDBOperate {
	
	/**
	 * ��ȡָ����Ŀ����
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ����
	 */
	@SuppressWarnings("unchecked")
	public ArrayList<Datasystem> GetDatasystem(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Datasystem");
		q.setMaxResults(num);
		ArrayList<Datasystem> ds = new ArrayList<Datasystem>();
		List<Datasystem> list = q.list();
		for(Datasystem datasystem : list){
			ds.add(datasystem);
		}
		s.close();
		return ds;
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
	public ArrayList<Datasystem> getDatasystem(int num, int page) {
		int mynum = page * num;
		List<Datasystem> list = GetDatasystem(mynum);
		ArrayList<Datasystem> ets = new ArrayList<Datasystem>();
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
	public int GetDatasystemNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Datasystem");
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
	public Datasystem GetOneDatasystem(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Datasystem q where q.dataid = :id");
		q.setString("id", id);
		Datasystem e = (Datasystem) q.uniqueResult();
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
	public boolean DelOneDatasystem(String id) {
		Datasystem e = GetOneDatasystem(id);
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
	public boolean AddOneDatasystem(Datasystem e) {
		EvaDao ed = new EvaDao();
		return ed.Save(e);
	}

	/**
	 * �޸�һ����¼
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateOneDatasystem(Datasystem e) {
		EvaDao ed = new EvaDao();
		return ed.Update(e);
	}
	
}
