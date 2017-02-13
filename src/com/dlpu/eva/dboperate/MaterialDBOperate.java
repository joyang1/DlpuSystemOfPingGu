package com.dlpu.eva.dboperate;

import hibernate.Material;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;

@Entity
public class MaterialDBOperate {
	
	/**
	 * ��ȡָ����Ŀ����
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ����
	 */
	@SuppressWarnings("unchecked")
	public List<Material> GetMaterial(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Material m order by m.materialid desc");
		q.setMaxResults(num);
		List<Material> list = q.list();
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
	public ArrayList<Material> getMaterial(int num, int page) {
		int mynum = page * num;
		List<Material> list = GetMaterial(mynum);
		ArrayList<Material> ets = new ArrayList<Material>();
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
	public int GetMaterialNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Material");
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
	public Material GetOneMaterial(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Material q where q.materialid = :id");
		q.setString("id", id);
		Material e = (Material) q.uniqueResult();
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
	public boolean DelOneMaterial(String id) {
		Material e = GetOneMaterial(id);
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
	public boolean AddOneMaterial(Material e) {
		EvaDao ed = new EvaDao();
		return ed.Save(e);
	}

	/**
	 * �޸�һ����¼
	 * 
	 * @param e
	 * @return
	 */
	public boolean UpdateOneMaterial(Material e) {
		EvaDao ed = new EvaDao();
		return ed.Update(e);
	}
	
}
