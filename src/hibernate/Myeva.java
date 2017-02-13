package hibernate;

import java.sql.Timestamp;
import javax.persistence.Entity;

/**
 * Myeva entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Myeva implements java.io.Serializable {

	// Fields

	private String myevaid;
	private String myevatitle;
	private Timestamp myevadate;
	private String myevafilename;
	private String myevafileurl;

	// Constructors

	/** default constructor */
	public Myeva() {
	}

	/** minimal constructor */
	public Myeva(String myevaid, String myevatitle, Timestamp myevadate) {
		this.myevaid = myevaid;
		this.myevatitle = myevatitle;
		this.myevadate = myevadate;
	}

	/** full constructor */
	public Myeva(String myevaid, String myevatitle, Timestamp myevadate, String myevafilename, String myevafileurl) {
		this.myevaid = myevaid;
		this.myevatitle = myevatitle;
		this.myevadate = myevadate;
		this.myevafilename = myevafilename;
		this.myevafileurl = myevafileurl;
	}

	// Property accessors

	public String getMyevaid() {
		return this.myevaid;
	}

	public void setMyevaid(String myevaid) {
		this.myevaid = myevaid;
	}

	public String getMyevatitle() {
		return this.myevatitle;
	}

	public void setMyevatitle(String myevatitle) {
		this.myevatitle = myevatitle;
	}

	public Timestamp getMyevadate() {
		return this.myevadate;
	}

	public void setMyevadate(Timestamp myevadate) {
		this.myevadate = myevadate;
	}

	public String getMyevafilename() {
		return this.myevafilename;
	}

	public void setMyevafilename(String myevafilename) {
		this.myevafilename = myevafilename;
	}

	public String getMyevafileurl() {
		return this.myevafileurl;
	}

	public void setMyevafileurl(String myevafileurl) {
		this.myevafileurl = myevafileurl;
	}

}