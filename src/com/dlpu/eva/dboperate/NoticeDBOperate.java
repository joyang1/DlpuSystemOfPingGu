package com.dlpu.eva.dboperate;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;

import hibernate.Notice;

@Entity
public class NoticeDBOperate {

	/**
	 * ��ȡ֪ͨ��
	 * 
	 * @param num
	 *            ��Ҫ������
	 * @param page
	 *            ��ǰҳ��
	 * @param type
	 *            ֪ͨ���� 1�� ����֪ͨ | 2: ����֪ͨ
	 * @return ֪ͨ��
	 */
	@SuppressWarnings("unchecked")
	public ArrayList<Notice> GetNotice(int num, int page, int type) {
		ArrayList<Notice> notices = new ArrayList<Notice>();
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Notice as p where p.noticetype = :type order by p.noticetime desc");
		q.setInteger("type", type);
		int mynum = num * page;
		q.setMaxResults(mynum);
		List<Notice> list = q.list();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			notices.add(list.get(i));
		}
		s.close();
		return notices;
	}

	/**
	 * ��ȡtype���͵�֪ͨ��Ŀ
	 * 
	 * @param type
	 *            ֪ͨ���� 1�� ����֪ͨ | 2: ����֪ͨ
	 * @return
	 */
	public int GetNoticeNum(int type) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from Notice n where noticetype = :type");
		q.setInteger("type", type);
		int totolRows = Integer.parseInt((q.uniqueResult().toString()));
		return totolRows;
	}

	/**
	 * ���ID��ȡ֪ͨ��
	 * 
	 * @param id
	 * @return
	 */
	public Notice GetOneNotice(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Notice n where n.noticeid = :id");
		q.setString("id", id);
		Notice n = (Notice) q.uniqueResult();
		s.close();
		return n;
	}

	/**
	 * ��notice��������һ����¼
	 * 
	 * @param oneNotice
	 * @return
	 */
	public boolean AddOneNotice(Notice oneNotice) {
		EvaDao ed = new EvaDao();
		return ed.Save(oneNotice);
	}

	/**
	 * ��ݱ��ɾ��һ��֪ͨ��¼
	 * 
	 * @param noticeId
	 * @return
	 */
	public boolean DelOneNotice(String noticeId) {
		Notice n = GetOneNotice(noticeId);
		EvaDao ed = new EvaDao();
		return ed.Delete(n);
	}

	/**
	 * �޸�һ��֪ͨ����
	 * 
	 * @param oneNotice
	 * @return
	 */
	public boolean UpdateOneNotice(Notice oneNotice) {
		EvaDao ed = new EvaDao();
		return ed.Update(oneNotice);
	}

}
