package com.dlpu.eva.service;

import hibernate.Tissue;

import com.dlpu.eva.dboperate.TissueDBOperate;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class TissueService {
	
	@ManyToOne
	private TissueDBOperate tdbo;
	
	public TissueService(){
		tdbo  = new TissueDBOperate();
	}
	
	/**
	 * �õ���һ��Tissue
	 * @return
	 */
	public Tissue getTissue1(){
		return tdbo.getTissue(1);
	}
	
	/**
	 * �õ��ڶ���
	 * @return
	 */
	public Tissue getTissue2(){
		return tdbo.getTissue(2);
	}
	
	/**
	 * �õ������
	 * @return
	 */
	public Tissue getTissue3(){
		return tdbo.getTissue(3);
	}
	
	/**
	 * �޸�
	 * @param t
	 * @return
	 */
	public boolean UpdateTissue(Tissue t){
		return tdbo.UpdateTissue(t);
	}
	
}
