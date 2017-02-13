package com.dlpu.eva.dboperate;

import hibernate.Schoolfile;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.SchoolFIleTitle;

@Entity
public class SchoolFileDBOperate {

	/**
	 * ��ȡָ����Ŀ��ѧУ�ļ���
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ��ѧУ�ļ���
	 */
	@SuppressWarnings("unchecked")
	public List<Schoolfile> GetSchoolFile(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Schoolfile as p order by p.filedate desc");
		q.setMaxResults(num);
		List<Schoolfile> list = q.list();
		s.close();
		return list;
	}

	/**
	 * ��ȡѧУ�ļ��ı�����
	 * 
	 * @param num
	 *            ÿҳ������
	 * @param page
	 *            ҳ��
	 * @return ѧУ�ļ��ı�����
	 */
	public ArrayList<SchoolFIleTitle> getSchoolFIleTitles(int num, int page) {
		int mynum = page * num;
		List<Schoolfile> list = GetSchoolFile(mynum);
		ArrayList<SchoolFIleTitle> sfits = new ArrayList<SchoolFIleTitle>();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			Schoolfile q = list.get(i);
			SchoolFIleTitle sfit = new SchoolFIleTitle();
			sfit.setSchoolfileid(q.getFileid());
			sfit.setSchoolfiletime(q.getFiledate().toString());
			sfit.setSchoolfiletitle(q.getFiletitle());
			sfits.add(sfit);
		}
		return sfits;
	}

	/**
	 * ��ȡSchoolfile���м�¼������
	 * 
	 * @return Schoolfile��¼����
	 */
	public int GetSchoolfileNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Schoolfile");
		int totolRows = Integer.parseInt((q.uniqueResult().toString()));
		return totolRows;
	}

	/**
	 * ���id��ѯSchoolfile���ж�Ӧfileid�ļ�¼
	 * 
	 * @param id
	 *            ׼����ѯ��id
	 * @return һ��Schoolfile��
	 */
	public Schoolfile GetOneSchoolfile(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Schoolfile q where q.fileid = :id");
		q.setString("id", id);
		Schoolfile sf = (Schoolfile) q.uniqueResult();
		s.close();
		return sf;
	}

	/**
	 * ���fileidɾ��Schoolfile���ж�Ӧ�ļ�¼
	 * 
	 * @param quaId
	 *            ����������
	 * @return ɾ���� true: �ɹ� | false : ʧ��
	 */
	public boolean DelOneSchoolfile(String fileid) {
		Schoolfile sf = GetOneSchoolfile(fileid);
		EvaDao ed = new EvaDao();
		return ed.Delete(sf);
	}

	/**
	 * ��Schoolfile��������һ����¼
	 * 
	 * @param schoolfile
	 *            һ��Schoolfile����
	 * @return true:�ɹ� | false: ʧ��
	 */
	public boolean AddOneSchoolfile(Schoolfile schoolfile) {
		EvaDao ed = new EvaDao();
		return ed.Save(schoolfile);
	}

	/**
	 * �޸�һ����¼
	 * 
	 * @param schoolfile
	 * @return
	 */
	public boolean UpdateOneSchoolfile(Schoolfile schoolfile) {
		EvaDao ed = new EvaDao();
		return ed.Update(schoolfile);
	}

}
