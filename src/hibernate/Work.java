package hibernate;

import java.sql.Timestamp;
import javax.persistence.Entity;

/**
 * Work entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Work implements java.io.Serializable {

	// Fields

	private String workid;
	private String worktitle;
	private String workcontent;
	private Timestamp workdate;

	// Constructors

	/** default constructor */
	public Work() {
	}

	/** minimal constructor */
	public Work(String workid, String worktitle, Timestamp workdate) {
		this.workid = workid;
		this.worktitle = worktitle;
		this.workdate = workdate;
	}

	/** full constructor */
	public Work(String workid, String worktitle, String workcontent, Timestamp workdate) {
		this.workid = workid;
		this.worktitle = worktitle;
		this.workcontent = workcontent;
		this.workdate = workdate;
	}

	// Property accessors

	public String getWorkid() {
		return this.workid;
	}

	public void setWorkid(String workid) {
		this.workid = workid;
	}

	public String getWorktitle() {
		return this.worktitle;
	}

	public void setWorktitle(String worktitle) {
		this.worktitle = worktitle;
	}

	public String getWorkcontent() {
		return this.workcontent;
	}

	public void setWorkcontent(String workcontent) {
		this.workcontent = workcontent;
	}

	public Timestamp getWorkdate() {
		return this.workdate;
	}

	public void setWorkdate(Timestamp workdate) {
		this.workdate = workdate;
	}

}