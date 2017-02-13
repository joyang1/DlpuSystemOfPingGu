package com.dlpu.eva.dboperate;

import java.util.List;

import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.Admin;

import com.db.hibernate.EvaDao;
import com.db.hibernate.GetHibernateSession;

@Entity
public class AdminDBOperate {

	/**
	 * ��ȡ��ݿ��еĹ���Ա
	 * 
	 * @return ��ݿ�Admin�������еĹ���Ա
	 */
	@SuppressWarnings("unchecked")
	public List<Admin> GetAdmin() {
		Session s = GetHibernateSession.getSessionFactory().openSession();
		Query q = s.createQuery("from Admin");
		List<Admin> list = q.list();
		s.close();
		return list;
	}

	/**
	 * �޸Ĺ���Ա������
	 * 
	 * @param admin
	 *            ��Ҫ�޸ĵ���
	 * @return true: �޸ĳɹ� | false: �޸�ʧ��
	 */
	public boolean ChangeAdminPassword(Admin admin) {
		EvaDao ed = new EvaDao();
		return ed.Update(admin);
	}

}
