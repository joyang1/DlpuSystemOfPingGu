package hibernate;

import javax.persistence.Entity;

/**
 * Tissue entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Tissue implements java.io.Serializable {

	// Fields

	private String tissueid;
	private String tissuetitle;
	private String tissueimg;

	// Constructors

	/** default constructor */
	public Tissue() {
	}

	/** minimal constructor */
	public Tissue(String tissueid, String tissuetitle) {
		this.tissueid = tissueid;
		this.tissuetitle = tissuetitle;
	}

	/** full constructor */
	public Tissue(String tissueid, String tissuetitle, String tissueimg) {
		this.tissueid = tissueid;
		this.tissuetitle = tissuetitle;
		this.tissueimg = tissueimg;
	}

	// Property accessors

	public String getTissueid() {
		return this.tissueid;
	}

	public void setTissueid(String tissueid) {
		this.tissueid = tissueid;
	}

	public String getTissuetitle() {
		return this.tissuetitle;
	}

	public void setTissuetitle(String tissuetitle) {
		this.tissuetitle = tissuetitle;
	}

	public String getTissueimg() {
		return this.tissueimg;
	}

	public void setTissueimg(String tissueimg) {
		this.tissueimg = tissueimg;
	}

}