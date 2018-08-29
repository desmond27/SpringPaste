package com.desmond_david.SpringPaste.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="pastes")
public class Paste {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="content")
	@Lob
	private String content;
	
	@Temporal(TemporalType.DATE)
	@Column(name="timestamp")
	private Date timestamp;
	
	@Column(name="username")
	private String username;
	
	@Column(name="public")
	private boolean publicPaste;
	
	public Paste() {}

	public Paste(int id, String title, String content, Date timestamp) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.timestamp = timestamp;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isPublicPaste() {
		return publicPaste;
	}

	public void setPublicPaste(boolean publicPaste) {
		this.publicPaste = publicPaste;
	}

	@Override
	public String toString() {
		return "Paste [id=" + id + ", title=" + title + ", content=" + content + ", timestamp=" + timestamp
				+ ", username=" + username + ", isPublic=" + publicPaste + "]";
	}
	
}
