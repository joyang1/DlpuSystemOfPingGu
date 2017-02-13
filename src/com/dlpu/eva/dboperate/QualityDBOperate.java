package com.dlpu.eva.dboperate;

import hibernate.Quality;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.QualityTitle;

@Entity
public class QualityDBOperate {

	@SuppressWarnings("unchecked")
	public List<Quality> GetQuality(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Quality as p order by p.quadate desc");
		q.setMaxResults(num);
		List<Quality> list = q.list();
		s.close();
		return list;
	}
	
	/**
	 * ��ȡָ����Ŀ������������
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ������������
	 */
	@SuppressWarnings("unchecked")
	public List<Quality> GetQuality(int num,int type) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Quality as p where p.quatype = ? order by p.quadate desc");
		q.setString(0, type+"");
		q.setMaxResults(num);
		List<Quality> list = q.list();
		s.close();
		return list;
	}

	/**
	 * ��ȡ��������ı�����
	 * 
	 * @param num
	 *            ÿҳ������
	 * @param page
	 *            ҳ��
	 * @return ��������ı�����
	 */
	public ArrayList<QualityTitle> GetQuaTitle(int num, int page, int type) {
		int mynum = page * num;
		List<Quality> list = GetQuality(mynum,type);
		ArrayList<QualityTitle> qta = new ArrayList<QualityTitle>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			Quality q = list.get(i);
			QualityTitle qt = new QualityTitle();
			qt.setQuaid(q.getQuaid());
			qt.setQuatitle(q.getQuatitle());
			qt.setQuadate(q.getQuadate().toString());
			qta.add(qt);
		}
		return qta;
	}
	
	public ArrayList<QualityTitle> GetQuaTitle(int num, int page) {
		int mynum = page * num;
		List<Quality> list = GetQuality(mynum);
		ArrayList<QualityTitle> qta = new ArrayList<QualityTitle>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			Quality q = list.get(i);
			QualityTitle qt = new QualityTitle();
			qt.setQuaid(q.getQuaid());
			qt.setQuatitle(q.getQuatitle());
			qt.setQuadate(q.getQuadate().toString());
			qta.add(qt);
		}
		return qta;
	}

	/**
	 * ��ȡQuality���м�¼������
	 * 
	 * @return Quality��¼����
	 */
	public int GetQuaNum(int type) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Quality as p where p.quatype = ?");
		q.setString(0, type+"");
		int totolRows = Integer.parseInt((q.uniqueResult().toString()));
		return totolRows;
	}
	
	public int GetQuaNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Quality");
		int totolRows = Integer.parseInt((q.uniqueResult().toString()));
		return totolRows;
	}

	/**
	 * ���id��ѯQuality���ж�Ӧquaid�ļ�¼
	 * 
	 * @param id
	 *            ׼����ѯ��id
	 * @return һ��News��
	 */
	public Quality GetOneQua(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Quality q where q.quaid = :quaid");
		q.setString("quaid", id);
		Quality n = (Quality) q.uniqueResult();
		s.close();
		return n;
	}

	/**
	 * ���quaidɾ��Quality���ж�Ӧ�ļ�¼
	 * 
	 * @param quaId
	 *            ����������
	 * @return ɾ���� true: �ɹ� | false : ʧ��
	 */
	public boolean DelOneQua(String quaId) {
		Quality n = GetOneQua(quaId);
		EvaDao ed = new EvaDao();
		return ed.Delete(n);
	}

	/**
	 * ��Quality��������һ����¼
	 * 
	 * @param oneQua
	 *            һ��Quality����
	 * @return true:�ɹ� | false: ʧ��
	 */
	public boolean AddOneQua(Quality oneQua) {
		EvaDao ed = new EvaDao();
		return ed.Save(oneQua);
	}

	/**
	 * �޸�һ����¼
	 * 
	 * @param quality
	 * @return
	 */
	public boolean UpdateOneQuality(Quality quality) {
		EvaDao ed = new EvaDao();
		return ed.Update(quality);
	}

}
