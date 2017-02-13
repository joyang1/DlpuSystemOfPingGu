package com.db.hibernate;

import javax.persistence.Entity;
import org.hibernate.Session;

@Entity
public class EvaDao {

	/**
	 * DAO save
	 * 
	 * @param o
	 * @return
	 */
	public boolean Save(Object o) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		try {
			s.beginTransaction();
			s.save(o);
			s.getTransaction().commit();
		} catch (Exception e) {
			return false;
		}
		s.close();
		return true;
	}

	/**
	 * DAO update
	 * 
	 * @param o
	 * @return
	 */
	public boolean Update(Object o) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		try {
			s.beginTransaction();
			s.update(o);
			s.getTransaction().commit();
		} catch (Exception e) {
			return false;
		}
		s.close();
		return true;
	}

	/**
	 * Delete DAO
	 * 
	 * @param o
	 * @return
	 */
	public boolean Delete(Object o) {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		s.beginTransaction();
		try {
			s.delete(o);
			s.getTransaction().commit();
		} catch (Exception e) {
			// ɾ��ʧ��
			s.getTransaction().rollback();
			s.close();
			return false;
		}
		s.close();
		return true;
	}

}
