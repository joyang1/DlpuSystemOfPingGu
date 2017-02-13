package com.dlpu.eva.dboperate;

import hibernate.Bulletin;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.BulletinTitle;

@Entity
public class BulletinDBOperate {

	/**
	 * ��ȡָ����Ŀ����
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ����
	 */
	@SuppressWarnings("unchecked")
	public List<Bulletin> GetBulletin(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Bulletin as p order by p.bulletindate desc");
		q.setMaxResults(num);
		List<Bulletin> list = q.list();
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
	public ArrayList<BulletinTitle> getBulletinTitles(int num, int page) {
		int mynum = page * num;
		List<Bulletin> list = GetBulletin(mynum);
		ArrayList<BulletinTitle> bts = new ArrayList<BulletinTitle>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			Bulletin e = list.get(i);
			BulletinTitle bt = new BulletinTitle();
			bt.setBulletinid(e.getBulletinid());
			bt.setBulletintitle(e.getBulletintitle());
			bt.setBulletindate(e.getBulletindate().toString());
			bts.add(bt);
		}
		return bts;
	}

	/**
	 * ��ȡ���м�¼������
	 * 
	 * @return ��¼����
	 */
	public int GetBulletinNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Bulletin");
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
	public Bulletin GetOneBulletin(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Bulletin q where q.bulletinid = :id");
		q.setString("id", id);
		Bulletin b = (Bulletin) q.uniqueResult();
		s.close();
		return b;
	}

	/**
	 * ɾ����ж�Ӧ�ļ�¼
	 * 
	 * @param id
	 * 
	 * @return ɾ���� true: �ɹ� | false : ʧ��
	 */
	public boolean DelOneBulletin(String id) {
		Bulletin e = GetOneBulletin(id);
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
	public boolean AddOneBulletin(Bulletin e) {
		EvaDao ed = new EvaDao();
		return ed.Save(e);
	}

	/**
	 * �޸�һ����¼
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateOneBulletin(Bulletin e) {
		EvaDao ed = new EvaDao();
		return ed.Update(e);
	}

}
