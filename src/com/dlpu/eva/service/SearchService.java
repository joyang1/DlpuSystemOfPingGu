package com.dlpu.eva.service;

import java.util.ArrayList;

import com.dlpu.eva.common.NewsTitle;
import com.dlpu.eva.common.NoticeTitle;
import com.dlpu.eva.dboperate.SearchDBOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class SearchService {

	@ManyToOne
	private SearchDBOperate sdbo;

	public SearchService() {
		sdbo = new SearchDBOperate();
	}

	/**
	 * 
	 * @param word
	 * @return
	 */
	public ArrayList<NewsTitle> SearchNews(String word) {
		return sdbo.SearchNews(word);
	}

	public ArrayList<NoticeTitle> SearchNotice1(String word) {
		return sdbo.SearchNotice1(word);
	}

	public ArrayList<NoticeTitle> SearchNotice2(String word) {
		return sdbo.SearchNotice2(word);
	}

}
