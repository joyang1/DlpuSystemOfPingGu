package com.dlpu.eva.dboperate;

import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.GetHibernateSession;

import hibernate.*;

@Entity
public class SourceUrlDBOperate {

	/**
	 * ��ȡ�ļ�·������ܵ�ַ
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String GetSourceFileURL() {
		String url = "";
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Sourceurl");
		List<Sourceurl> su = q.list();
		for (Sourceurl as : su) {
			if (as.getType().equals("file")) {
				url = as.getUrl();
				url = url.replace("\\", "\\\\");
			}
		}
		s.close();
		return url;
	}

}
