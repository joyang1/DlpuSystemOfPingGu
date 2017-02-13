package com.dlpu.eva.dboperate;

import hibernate.Myeva;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.MyevaTitle;

@Entity
public class MyevaDBOperate {

	/**
	 * ��ȡָ����Ŀ����
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ����
	 */
	@SuppressWarnings("unchecked")
	public List<Myeva> GetMyeva(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Myeva as p order by p.myevadate desc");
		q.setMaxResults(num);
		List<Myeva> list = q.list();
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
	public ArrayList<MyevaTitle> getMyevaTitles(int num, int page) {
		int mynum = page * num;
		List<Myeva> list = GetMyeva(mynum);
		ArrayList<MyevaTitle> mts = new ArrayList<MyevaTitle>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			Myeva m = list.get(i);
			MyevaTitle mt = new MyevaTitle();
			mt.setMyevaid(m.getMyevaid());
			mt.setMyevatitle(m.getMyevatitle());
			mt.setMyevadate(m.getMyevadate().toString());
			mts.add(mt);
		}
		return mts;
	}

	/**
	 * ��ȡ���м�¼������
	 * 
	 * @return ��¼����
	 */
	public int GetMyevaNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Myeva");
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
	public Myeva GetOneMyeva(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Myeva q where q.myevaid = :id");
		q.setString("id", id);
		Myeva m = (Myeva) q.uniqueResult();
		s.close();
		return m;
	}

	/**
	 * ɾ����ж�Ӧ�ļ�¼
	 * 
	 * @param id
	 * 
	 * @return ɾ���� true: �ɹ� | false : ʧ��
	 */
	public boolean DelOneMyeva(String id) {
		Myeva m = GetOneMyeva(id);
		EvaDao ed = new EvaDao();
		return ed.Delete(m);
	}

	/**
	 * ���������һ����¼
	 * 
	 * @param e
	 * 
	 * @return true:�ɹ� | false: ʧ��
	 */
	public boolean AddOneMyeva(Myeva e) {
		EvaDao ed = new EvaDao();
		return ed.Save(e);
	}

	/**
	 * �޸�һ����¼
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateOneMyeva(Myeva e) {
		EvaDao ed = new EvaDao();
		return ed.Update(e);
	}

}
