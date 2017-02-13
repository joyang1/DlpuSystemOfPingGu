package com.dlpu.eva.service;

import java.util.List;

import com.dlpu.eva.dboperate.AdminDBOperate;
import com.dlpu.eva.mymd5.MyMD5;

import hibernate.Admin;
import javax.persistence.Entity;

@Entity
public class AdminService {

	/**
	 * ���׼����½�Ĺ���Ա����ȷ��
	 * 
	 * @param admin
	 *            һ��׼����¼�Ĺ���Ա��
	 * @return true: ��¼�ɹ� | false: ��¼ʧ��
	 */
	public boolean CheckAdmin(Admin admin) {
		MyMD5 md5 = new MyMD5();
		admin.setPassword(md5.MD5Encoding(admin.getPassword()));
		AdminDBOperate adbo = new AdminDBOperate();
		List<Admin> allAdmin = adbo.GetAdmin();
		for (Admin a : allAdmin) {
			if (a.getUsername().equals(admin.getUsername()) && a.getPassword().equals(admin.getPassword())) {
				return true;
			}
		}
		return false;
	}

	/**
	 * �޸Ĺ���Ա����
	 * 
	 * @param orgAdmin
	 *            ׼���޸ĵĹ���Ա��
	 * @param newAdmin
	 *            Ԥ���޸ĳɵĹ���Ա��
	 * @return true���޸ĳɹ� | false: �޸�ʧ��
	 */
	public boolean ChangeAdminPassword(Admin orgAdmin, Admin newAdmin) {
		boolean isRightAdmin = CheckAdmin(orgAdmin);
		if (isRightAdmin) {
			AdminDBOperate adbo = new AdminDBOperate();
			MyMD5 md5 = new MyMD5();
			newAdmin.setPassword(md5.MD5Encoding(newAdmin.getPassword()));
			return adbo.ChangeAdminPassword(newAdmin);
		}
		return false;
	}

}
