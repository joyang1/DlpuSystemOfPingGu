package com.dlpu.eva.dboperate;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.NewsPicture;
import com.dlpu.eva.common.NewsTitle;

import hibernate.News;

@Entity
public class NewsDBOperate {

	/**
	 * ��ȡָ����Ŀ��������
	 * 
	 * @param num
	 *            ָ������Ŀ
	 * @return ָ����Ŀ��������
	 */
	@SuppressWarnings("unchecked")
	public List<News> GetNews(int num) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from News as p order by p.newstime desc");
		q.setMaxResults(num);
		List<News> list = q.list();
		s.close();
		return list;
	}

	/**
	 * ��ȡ��Ƭ�������Լ���Ե�ַ
	 * 
	 * @param num
	 *            ��ȡ����
	 * @return ��Ƭ��
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<NewsPicture> GetNewsPicture(int num) {
		List<News> list = GetNews(num);
		ArrayList<NewsPicture> npa = new ArrayList();
		for (News l : list) {
			NewsPicture np = new NewsPicture();
			np.setPictureid(l.getNewsid());
			np.setPicturetitle(l.getNewsfiletitle());
			np.setPictureurl(l.getNewsfileurl());
			npa.add(np);
		}
		return npa;
	}

	/**
	 * ��ȡ���ŵı�����
	 * 
	 * @param num
	 *            ÿҳ������
	 * @param page
	 *            ҳ��
	 * @return �ŵı�����
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<NewsTitle> GetNewsTitle(int num, int page) {
		int mynum = page * num;
		List<News> list = GetNews(mynum);
		ArrayList<NewsTitle> nta = new ArrayList();
		for (int i = ((page - 1) * num); i < mynum; i++) {
			if (i >= list.size()) {// ��ֹList���
				break;
			}
			News n = list.get(i);
			NewsTitle nt = new NewsTitle();
			nt.setNewsid(n.getNewsid());
			nt.setNewstitle(n.getNewstitle());
			nt.setNewstime(n.getNewstime().toString());
			nta.add(nt);
		}
		return nta;
	}

	/**
	 * ��ȡnews���м�¼������
	 * 
	 * @return news��¼����
	 */
	public int GetNewsNum() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("select count(*) from News");
		int totolRows = Integer.parseInt((q.uniqueResult().toString()));
		return totolRows;
	}

	/**
	 * ���id��ѯnews���ж�Ӧnewsid�ļ�¼
	 * 
	 * @param id
	 *            ׼����ѯ��id
	 * @return һ��News��
	 */
	public News GetOneNews(String id) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from News n where n.newsid = :newsid");
		q.setString("newsid", id);
		News n = (News) q.uniqueResult();
		s.close();
		return n;
	}

	/**
	 * ���newsidɾ��news���ж�Ӧ�ļ�¼
	 * 
	 * @param newsId
	 *            ���ű��
	 * @return ɾ���� true: �ɹ� | false : ʧ��
	 */
	public boolean DelOneNews(String newsId) {
		News n = GetOneNews(newsId);
		EvaDao ed = new EvaDao();
		return ed.Delete(n);
	}

	/**
	 * ��news��������һ����¼
	 * 
	 * @param oneNews
	 *            һ��News����
	 * @return true:�ɹ� | false: ʧ��
	 */
	public boolean AddOneNews(News oneNews) {
		EvaDao ed = new EvaDao();
		return ed.Save(oneNews);
	}

	/**
	 * �޸�һ��������Ϣ
	 * 
	 * @param oneNews
	 * @return
	 */
	public boolean UpdateOneNews(News oneNews) {
		EvaDao ed = new EvaDao();
		return ed.Update(oneNews);
	}

}
