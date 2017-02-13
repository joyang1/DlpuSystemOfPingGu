package com.dlpu.eva.dboperate;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import org.hibernate.Query;
import org.hibernate.Session;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;

import hibernate.Tissue;

@Entity
public class TissueDBOperate {
	
	
	/**
	 * ��ѯָ����Tissue
	 * @param type
	 * @return
	 */
	public Tissue getTissue(int type){
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Tissue as p where p.tissueid = :type");
		q.setInteger("type", type);
		Tissue t = (Tissue)q.uniqueResult();
		return t;
	}
	
	/**
	 * �޸���֯������
	 * @param t
	 * @return
	 */
	public boolean UpdateTissue(Tissue t){
		EvaDao ed = new EvaDao();
		return ed.Update(t);
	}
	
	
}
