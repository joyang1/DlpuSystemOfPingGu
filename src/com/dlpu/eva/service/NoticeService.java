package com.dlpu.eva.service;

import hibernate.Notice;
import hibernate.Noticefile;

import java.util.ArrayList;

import com.db.hibernate.EvaDao;
import com.dlpu.eva.common.NoticeTitle;
import com.dlpu.eva.common.OneNotice;
import com.dlpu.eva.dboperate.NoticeDBOperate;
import com.dlpu.eva.dboperate.NoticeFileDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class NoticeService {

	@ManyToOne
	NoticeDBOperate nodbo;
	@ManyToOne
	NoticeFileDBOperate nfdbo;

	public NoticeService() {
		nodbo = new NoticeDBOperate();
		nfdbo = new NoticeFileDBOperate();
	}

	/**
	 * ������ͺ���Ŀ��ȡ֪ͨ������
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @param page
	 * @param type
	 *            ��Ҫ��ȡ������(1:����֪ͨ|2:����֪ͨ)
	 * @return
	 */
	public ArrayList<NoticeTitle> GetNoticeTitles(int num, int page, int type) {
		ArrayList<NoticeTitle> nts = new ArrayList<NoticeTitle>();
		ArrayList<Notice> notices = nodbo.GetNotice(num, page, type);
		for (Notice notice : notices) {
			NoticeTitle nt = new NoticeTitle();
			nt.setNoticeid(notice.getNoticeid());
			nt.setNoticetitle(notice.getNoticetitle());
			nt.setNoticetime(notice.getNoticetime().toString());
			nts.add(nt);
		}
		return nts;
	}

	/**
	 * ���֪ͨ��Ż�ȡһ��֪ͨ
	 * 
	 * @param noticeid
	 * @return
	 */
	public OneNotice getOneNotice(String noticeid) {
		OneNotice on = new OneNotice();
		Notice n = nodbo.GetOneNotice(noticeid);
		ArrayList<Noticefile> nfs = nfdbo.GetOneNoticeFiles(noticeid);
		on.setNotice(n);
		on.setNoticefiles(nfs);
		return on;
	}

	/**
	 * ��ȡtype���͵�֪ͨ��Ŀ
	 * 
	 * @param type
	 * @return
	 */
	public int GetNoticeNum(int type) {
		return nodbo.GetNoticeNum(type);
	}

	/**
	 * ���һ��֪ͨ
	 * 
	 * @param oneNotice
	 * @return
	 */
	public boolean AddOneNotice(Notice oneNotice) {
		return nodbo.AddOneNotice(oneNotice);
	}

	/**
	 * ���һ������
	 * 
	 * @param nf
	 * @return
	 */
	public boolean AddOneNoticeFile(Noticefile nf) {
		return nfdbo.AddOneNoticeFile(nf);
	}

	/**
	 * ɾ��һ��֪ͨ
	 * 
	 * @param noticeid
	 * @return
	 */
	public boolean DeleteOneNotice(String noticeid) {
		ArrayList<Noticefile> nfs = nfdbo.GetOneNoticeFiles(noticeid);
		// ɾ��֪ͨ�ĸ���
		GetSourceUrlService gsus = new GetSourceUrlService();
		FileOperate fo = new FileOperate();
		for (Noticefile nf : nfs) {
			fo.DelOneFile(gsus.GetNoticeFileUrl(), nf.getNoticeurl(), false);
		}
		nfdbo.DeleteOneNoticeFiles(noticeid);
		return nodbo.DelOneNotice(noticeid);
	}

	/**
	 * ɾ��ָ������
	 * 
	 * @param noticefileid
	 * @param strict
	 * @return
	 */
	public boolean DeleteOneNoticefile(String noticefileid, boolean strict) {
		Noticefile nf = nfdbo.GetOneNoticeFile(noticefileid);
		FileOperate fo = new FileOperate();
		GetSourceUrlService gsus = new GetSourceUrlService();
		if (!fo.DelOneFile(gsus.GetNoticeFileUrl(), nf.getNoticeurl(), strict)) {
			return false;
		}
		if (!nfdbo.DeleteOneNoticeFile(noticefileid)) {
			return false;
		}
		return true;
	}

	/**
	 * �޸�һ��֪ͨ����
	 * 
	 * @param notice
	 * @return
	 */
	public boolean UpdateOneNotice(Notice notice) {
		EvaDao ed = new EvaDao();
		return ed.Update(notice);
	}

}
