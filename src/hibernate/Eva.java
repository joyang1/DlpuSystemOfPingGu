package hibernate;

import java.sql.Timestamp;
import javax.persistence.Entity;

/**
 * Eva entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Eva implements java.io.Serializable {

	// Fields

	private String evaid;
	private String evatitle;
	private Timestamp evadate;
	private String evaurl;
	private String evafilename;

	// Constructors

	/** default constructor */
	public Eva() {
	}

	/** minimal constructor */
	public Eva(String evaid, String evatitle, Timestamp evadate) {
		this.evaid = evaid;
		this.evatitle = evatitle;
		this.evadate = evadate;
	}

	/** full constructor */
	public Eva(String evaid, String evatitle, Timestamp evadate, String evaurl, String evafilename) {
		this.evaid = evaid;
		this.evatitle = evatitle;
		this.evadate = evadate;
		this.evaurl = evaurl;
		this.evafilename = evafilename;
	}

	// Property accessors

	public String getEvaid() {
		return this.evaid;
	}

	public void setEvaid(String evaid) {
		this.evaid = evaid;
	}

	public String getEvatitle() {
		return this.evatitle;
	}

	public void setEvatitle(String evatitle) {
		this.evatitle = evatitle;
	}

	public Timestamp getEvadate() {
		return this.evadate;
	}

	public void setEvadate(Timestamp evadate) {
		this.evadate = evadate;
	}

	public String getEvaurl() {
		return this.evaurl;
	}

	public void setEvaurl(String evaurl) {
		this.evaurl = evaurl;
	}

	public String getEvafilename() {
		return this.evafilename;
	}

	public void setEvafilename(String evafilename) {
		this.evafilename = evafilename;
	}

}