package hibernate;

import java.sql.Timestamp;
import javax.persistence.Entity;

/**
 * Policy entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Policy implements java.io.Serializable {

	// Fields

	private String policyid;
	private String policytitle;
	private String policycontent;
	private Timestamp policydate;
	private String policyurl;
	private String policyfilename;

	// Constructors

	/** default constructor */
	public Policy() {
	}

	/** minimal constructor */
	public Policy(String policyid, String policytitle, Timestamp policydate) {
		this.policyid = policyid;
		this.policytitle = policytitle;
		this.policydate = policydate;
	}

	/** full constructor */
	public Policy(String policyid, String policytitle, String policycontent, Timestamp policydate, String policyurl, String policyfilename) {
		this.policyid = policyid;
		this.policytitle = policytitle;
		this.policycontent = policycontent;
		this.policydate = policydate;
		this.policyurl = policyurl;
		this.policyfilename = policyfilename;
	}

	// Property accessors

	public String getPolicyid() {
		return this.policyid;
	}

	public void setPolicyid(String policyid) {
		this.policyid = policyid;
	}

	public String getPolicytitle() {
		return this.policytitle;
	}

	public void setPolicytitle(String policytitle) {
		this.policytitle = policytitle;
	}

	public String getPolicycontent() {
		return this.policycontent;
	}

	public void setPolicycontent(String policycontent) {
		this.policycontent = policycontent;
	}

	public Timestamp getPolicydate() {
		return this.policydate;
	}

	public void setPolicydate(Timestamp policydate) {
		this.policydate = policydate;
	}

	public String getPolicyurl() {
		return this.policyurl;
	}

	public void setPolicyurl(String policyurl) {
		this.policyurl = policyurl;
	}

	public String getPolicyfilename() {
		return this.policyfilename;
	}

	public void setPolicyfilename(String policyfilename) {
		this.policyfilename = policyfilename;
	}

}