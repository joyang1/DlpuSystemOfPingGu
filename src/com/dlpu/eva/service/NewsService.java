package com.dlpu.eva.service;

import hibernate.News;
import java.util.ArrayList;
import java.util.List;

import com.dlpu.eva.common.NewsPicture;
import com.dlpu.eva.common.NewsTitle;
import com.dlpu.eva.dboperate.NewsDBOperate;
import com.dlpu.eva.file.FileOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class NewsService {

	@ManyToOne
	private NewsDBOperate ndbo;

	public NewsService() {
		ndbo = new NewsDBOperate();
	}

	/**
	 * ��ȡ������(��������ʱ������)
	 * 
	 * @param num
	 *            ��Ҫ��ȡ����Ŀ
	 * @return ָ����Ŀ��������
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<News> GetNews(int num) {
		List<News> allnews = ndbo.GetNews(num);
		ArrayList<News> getNews = new ArrayList();
		for (News news : allnews) {
			getNews.add(news);
		}
		return getNews;
	}

	/**
	 * ��ȡ���ŵ���Ƭ��
	 * 
	 * @param num
	 *            ��ȡ������
	 * @return ��Ƭ��
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<NewsPicture> GetNewsPictures(int num) {
		ArrayList<NewsPicture> npat = ndbo.GetNewsPicture(100);// ����100���������ͼƬ
		ArrayList<NewsPicture> npa = new ArrayList();
		int i = 0;
		for (NewsPicture np : npat) {
			if (np.getPictureurl() != null && (!np.getPictureurl().equals(""))) {
				npa.add(np);
				i++;
				if (i >= num) {// ֻȡnum��ͼƬ����
					break;
				}
			}
		}
		return npa;
	}

	/**
	 * ��ȡ���ŵı���,������ʾ����ҳ��
	 * 
	 * @param num
	 *            ��ȡ������
	 * @param page
	 *            ��ǰҳ��
	 * @return ���ű�����
	 */
	public ArrayList<NewsTitle> GetNewsTitle(int num, int page) {
		ArrayList<NewsTitle> nta = ndbo.GetNewsTitle(num, page);
		return nta;
	}

	/**
	 * ��ȡ���ŵ�����
	 * 
	 * @return �������ŵĸ���
	 */
	public int GetNewsNum() {
		int num = ndbo.GetNewsNum();
		return num;
	}

	/**
	 * ͨ���Ż�ȡ��Ӧ����
	 * 
	 * @param id
	 *            ���ű��
	 * @return һ��������
	 */
	public News GetNewsById(String id) {
		News n = ndbo.GetOneNews(id);
		return n;
	}

	/**
	 * ��ݱ��ɾ���������
	 * 
	 * @param id
	 *            ���
	 * @return ɾ����
	 */
	public boolean DelOneNews(String id) {
		// ɾ������ŵ�ͼƬ
		News n = GetNewsById(id);
		if (n.getNewsfileurl() != null) {
			if (!n.getNewsfileurl().equals("")) {
				// �����Ƭ��ַ��Ϊ��
				GetSourceUrlService gsus = new GetSourceUrlService();
				FileOperate fo = new FileOperate();
				fo.DelOneFile(gsus.GetNewsFileUrl(), n.getNewsfileurl(), false);
			}
		}
		// ɾ������ż�¼
		return ndbo.DelOneNews(id);
	}

	/**
	 * ���һ������
	 * 
	 * @param aNews
	 *            ׼����ӵ�������
	 * @return true: ��ӳɹ� | false: ���ʧ��
	 */
	public boolean AddOneNews(News aNews) {
		return ndbo.AddOneNews(aNews);
	}

	/**
	 * �޸�һ������
	 * 
	 * @param oneNews
	 * @return
	 */
	public boolean UpdateOneNews(News oneNews) {
		return ndbo.UpdateOneNews(oneNews);
	}

}
