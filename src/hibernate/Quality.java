package hibernate;

import java.sql.Timestamp;

import javax.persistence.Entity;

/**
 * Quality entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Quality implements java.io.Serializable {

	// Fields

	private String quaid;
	private String quatitle;
	private Timestamp quadate;
	private String quaurl;
	private String quafilename;
	private String quatype;

	// Constructors

	/** default constructor */
	public Quality() {
	}

	/** minimal constructor */
	public Quality(String quaid, String quatitle, Timestamp quadate) {
		this.quaid = quaid;
		this.quatitle = quatitle;
		this.quadate = quadate;
	}

	/** full constructor */
	public Quality(String quaid, String quatitle, Timestamp quadate,
			String quaurl, String quafilename, String quatype) {
		super();
		this.quaid = quaid;
		this.quatitle = quatitle;
		this.quadate = quadate;
		this.quaurl = quaurl;
		this.quafilename = quafilename;
		this.quatype = quatype;
	}

	// Property accessors

	public String getQuatype() {
		return quatype;
	}

	public void setQuatype(String quatype) {
		this.quatype = quatype;
	}

	public String getQuaid() {
		return this.quaid;
	}

	public void setQuaid(String quaid) {
		this.quaid = quaid;
	}

	public String getQuatitle() {
		return this.quatitle;
	}

	public void setQuatitle(String quatitle) {
		this.quatitle = quatitle;
	}

	public Timestamp getQuadate() {
		return this.quadate;
	}

	public void setQuadate(Timestamp quadate) {
		this.quadate = quadate;
	}

	public String getQuaurl() {
		return this.quaurl;
	}

	public void setQuaurl(String quaurl) {
		this.quaurl = quaurl;
	}

	public String getQuafilename() {
		return this.quafilename;
	}

	public void setQuafilename(String quafilename) {
		this.quafilename = quafilename;
	}

}