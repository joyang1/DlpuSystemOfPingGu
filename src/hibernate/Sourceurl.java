package hibernate;

import javax.persistence.Entity;

/**
 * Sourceurl entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Sourceurl implements java.io.Serializable {

	// Fields

	private String type;
	private String url;

	// Constructors

	/** default constructor */
	public Sourceurl() {
	}

	/** full constructor */
	public Sourceurl(String type, String url) {
		this.type = type;
		this.url = url;
	}

	// Property accessors

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}