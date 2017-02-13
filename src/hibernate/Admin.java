package hibernate;

import javax.persistence.Entity;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Admin implements java.io.Serializable {

	// Fields

	private String username;
	private String password;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** full constructor */
	public Admin(String username, String password) {
		this.username = username;
		this.password = password;
	}

	// Property accessors

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}