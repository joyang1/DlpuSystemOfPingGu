package hibernate;

import javax.persistence.Entity;

/**
 * Datasystem entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Datasystem implements java.io.Serializable {

	// Fields

	private String dataid;
	private String datatitle;
	private String dataurl;

	// Constructors

	/** default constructor */
	public Datasystem() {
	}

	/** full constructor */
	public Datasystem(String dataid, String datatitle, String dataurl) {
		this.dataid = dataid;
		this.datatitle = datatitle;
		this.dataurl = dataurl;
	}

	// Property accessors

	public String getDataid() {
		return this.dataid;
	}

	public void setDataid(String dataid) {
		this.dataid = dataid;
	}

	public String getDatatitle() {
		return this.datatitle;
	}

	public void setDatatitle(String datatitle) {
		this.datatitle = datatitle;
	}

	public String getDataurl() {
		return this.dataurl;
	}

	public void setDataurl(String dataurl) {
		this.dataurl = dataurl;
	}

}