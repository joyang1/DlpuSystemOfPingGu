package com.dlpu.eva.dboperate;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import hibernate.Noticefile;

@Entity
public class NoticeFileDBOperate {

	/**
	 * ����һ���ļ���¼
	 * 
	 * @param nf
	 * @return
	 */
	public boolean AddOneNoticeFile(Noticefile nf) {
		EvaDao ed = new EvaDao();
		return ed.Save(nf);
	}

	/**
	 * ���һ����¼�ļ�����,���������һ��֪ͨ�����и���
	 * 
	 * @param nfs
	 * @return
	 */
	public boolean AddNoticeFiles(ArrayList<Noticefile> nfs) {
		int l = 0;// ����ĸ��������
		for (Noticefile nf : nfs) {
			if (!AddOneNoticeFile(nf)) {
				l++;
			}
			if (l == nfs.size()) {
				return false;// ��¼ȫ���ϴ�ʧ��
			}
		}
		return true;
	}

	/**
	 * ɾ��һ��֪ͨ�����ļ�¼
	 * 
	 * @param noticefileid
	 * @return
	 */
	public boolean DeleteOneNoticeFile(String noticefileid) {
		EvaDao ed = new EvaDao();
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Noticefile n where n.noticefileid = :nid");
		q.setString("nid", noticefileid);
		Noticefile nf = (Noticefile) q.uniqueResult();
		return ed.Delete(nf);
	}

	/**
	 * ɾ��һ��֪ͨ�����и�����¼
	 * 
	 * @param noticeid
	 * @return
	 */
	public boolean DeleteOneNoticeFiles(String noticeid) {
		ArrayList<Noticefile> nfs = GetOneNoticeFiles(noticeid);
		EvaDao ed = new EvaDao();
		int l = 0;// ����ִ�м�����
		for (Noticefile nf : nfs) {
			if (!ed.Delete(nf)) {
				l++;
			}
			if (l == nfs.size()) {
				return false;
			}
		}
		return true;
	}

	/**
	 * ��ѯһ��֪ͨ�����и�����¼
	 * 
	 * @param noticeid
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ArrayList<Noticefile> GetOneNoticeFiles(String noticeid) {
		ArrayList<Noticefile> nfs = new ArrayList<Noticefile>();
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Noticefile n where n.noticeid = :nid");
		q.setString("nid", noticeid);
		List<Noticefile> nfl = q.list();
		for (Noticefile nf : nfl) {
			nfs.add(nf);
		}
		s.close();
		return nfs;
	}

	/**
	 * ��ݸ�����Ų�ѯ����
	 * 
	 * @param noticefileid
	 * @return
	 */
	public Noticefile GetOneNoticeFile(String noticefileid) {
		Noticefile nf = new Noticefile();
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Noticefile n where n.noticefileid = :nid");
		q.setString("nid", noticefileid);
		nf = (Noticefile) q.uniqueResult();
		s.close();
		return nf;
	}

}
