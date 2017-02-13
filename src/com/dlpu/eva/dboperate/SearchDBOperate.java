package com.dlpu.eva.dboperate;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.*;

import com.db.hibernate.GetHibernateSession;
import com.dlpu.eva.common.NewsTitle;
import com.dlpu.eva.common.NoticeTitle;

@Entity
public class SearchDBOperate {

	/**
	 * ��ѯ
	 * 
	 * @param word
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ArrayList<NewsTitle> SearchNews(String word) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from News as p where p.newstitle like :word");
		q.setString("word", "%" + word + "%");
		List<News> nl = q.list();
		ArrayList<NewsTitle> nts = new ArrayList<NewsTitle>();
		for (News n : nl) {
			NewsTitle nt = new NewsTitle();
			nt.setNewsid(n.getNewsid());
			nt.setNewstime(n.getNewstime().toString());
			nt.setNewstitle(n.getNewstitle());
			nts.add(nt);
		}
		return nts;
	}

	/**
	 * ��ѯ
	 * 
	 * @param word
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ArrayList<NoticeTitle> SearchNotice1(String word) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Notice as p where p.noticetitle like :word and p.noticetype = 1");
		q.setString("word", "%" + word + "%");
		List<Notice> nl = q.list();
		ArrayList<NoticeTitle> nts = new ArrayList<NoticeTitle>();
		for (Notice n : nl) {
			NoticeTitle nt = new NoticeTitle();
			nt.setNoticeid(n.getNoticeid());
			nt.setNoticetime(n.getNoticetime().toString());
			nt.setNoticetitle(n.getNoticetitle());
			nts.add(nt);
		}
		return nts;
	}
	
	/**
	 * ��ѯ
	 * 
	 * @param word
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ArrayList<NoticeTitle> SearchNotice2(String word) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Notice as p where p.noticetitle like :word and p.noticetype = 2");
		q.setString("word", "%" + word + "%");
		List<Notice> nl = q.list();
		ArrayList<NoticeTitle> nts = new ArrayList<NoticeTitle>();
		for (Notice n : nl) {
			NoticeTitle nt = new NoticeTitle();
			nt.setNoticeid(n.getNoticeid());
			nt.setNoticetime(n.getNoticetime().toString());
			nt.setNoticetitle(n.getNoticetitle());
			nts.add(nt);
		}
		return nts;
	}

}
