package hibernate;

import javax.persistence.Entity;

/**
 * Material entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Material implements java.io.Serializable {

	// Fields

	private String materialid;
	private String materialname;
	private String materialurl;

	// Constructors

	/** default constructor */
	public Material() {
	}

	/** full constructor */
	public Material(String materialid, String materialname, String materialurl) {
		this.materialid = materialid;
		this.materialname = materialname;
		this.materialurl = materialurl;
	}

	// Property accessors

	public String getMaterialid() {
		return this.materialid;
	}

	public void setMaterialid(String materialid) {
		this.materialid = materialid;
	}

	public String getMaterialname() {
		return this.materialname;
	}

	public void setMaterialname(String materialname) {
		this.materialname = materialname;
	}

	public String getMaterialurl() {
		return this.materialurl;
	}

	public void setMaterialurl(String materialurl) {
		this.materialurl = materialurl;
	}

}