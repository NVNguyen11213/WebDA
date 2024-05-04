package webgiay.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_news")
public class News extends BaseModel{
	@Column(name = "name", length = 200, nullable = false)
	private String name;

	@Column(name = "description", length = 500, nullable = true)
	private String description;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateNews;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateNews;

	public News() {
		super();
	}

	public News(Integer id, Date createDate, Date updateDate, Boolean status, String name, String description,
			 User userCreateNews, User userUpdateNews) {
		super(id, createDate, updateDate,status);
		this.name = name;
		this.description = description;
		this.userCreateNews = userCreateNews;
		this.userUpdateNews = userUpdateNews;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUserCreateNews() {
		return userCreateNews;
	}

	public void setUserCreateNews(User userCreateNews) {
		this.userCreateNews = userCreateNews;
	}

	public User getUserUpdateNews() {
		return userUpdateNews;
	}

	public void setUserUpdateNews(User userUpdateNews) {
		this.userUpdateNews = userUpdateNews;
	}
	
}
