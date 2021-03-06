/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.dlpu.eva.struts.action;

import hibernate.Material;

import javax.persistence.Entity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dlpu.eva.file.FileNameFactory;
import com.dlpu.eva.file.FileOperate;
import com.dlpu.eva.service.GetSourceUrlService;
import com.dlpu.eva.service.MaterialService;
import com.dlpu.eva.struts.form.MaterialuploadForm;

/**
 * MyEclipse Struts Creation date: 10-28-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/materialchange" name="materialuploadForm"
 *                scope="request"
 */
@Entity
public class MaterialchangeAction extends Action {
	/*
	 * Generated Methods
	 */
	private static final String SUCCESS = "success";
	private static final String ERROR = "error";
	private static final String FERROR = "fileerror";
	private static final String DERROR = "dataerror";

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		MaterialuploadForm materialuploadForm = (MaterialuploadForm) form;
		Object s = request.getSession().getAttribute("adminuser");
		if (s == null) {// ��ֹ����
			return mapping.findForward(ERROR);
		}

		String id = request.getParameter("id");
		if (id == null) {// ��ֹ����
			return mapping.findForward(ERROR);
		}

		MaterialService ms = new MaterialService();
		Material m = new Material();
		Material orgm = ms.GetMaterialById(id);

		m.setMaterialid(id);
		//m.setMaterialname(materialuploadForm.getThetitle());
//		if(materialuploadForm.getThetitle().substring(0, 1).equals(" ") || materialuploadForm.getThetitle().substring(0, 1).equals("")||materialuploadForm.getThetitle().equals(null)){
//			m.setMaterialname(materialuploadForm.getThefile().getFileName());
//		}else{
//			m.setMaterialname(materialuploadForm.getThetitle());
//		}
		String filenameString = materialuploadForm.getThefile().getFileName();
		
		if(!filenameString.equals(null) && !filenameString.equals("")){
			if(materialuploadForm.getThetitle().substring(0, 1).equals(" ") || materialuploadForm.getThetitle().equals("") || materialuploadForm.getThetitle().equals(null)){
				m.setMaterialname(filenameString);
			}else{
				m.setMaterialname(materialuploadForm.getThetitle());
			}
		}
		
		if (filenameString != null && !filenameString.equals("")) {
			FileNameFactory fnf = new FileNameFactory();
			filenameString = fnf.changeFileName(id, filenameString);
			if (filenameString == null) {
				return mapping.findForward(FERROR);
			}
			m.setMaterialurl(filenameString);
			GetSourceUrlService gsus = new GetSourceUrlService();
			FileOperate fo = new FileOperate();
			fo.DelOneFile(gsus.GetMaterialfileURL(), orgm.getMaterialurl(), false);
			if (!fo.AddOneFile(gsus.GetMaterialfileURL(), m.getMaterialurl(), materialuploadForm.getThefile())) {
				return mapping.findForward(FERROR);
			}
		} else {
			m.setMaterialurl(orgm.getMaterialurl());
		}

		if (ms.UpdateMaterial(m)) {
			return mapping.findForward(SUCCESS);
		} else {
			return mapping.findForward(DERROR);
		}
	}
}