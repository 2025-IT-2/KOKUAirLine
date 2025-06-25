package com.KOKUAirLine.project.model;

import java.util.Date;

public class NoticeDTO {
	private Long id;
    private String title;
    private String content;
    private Date regDate;
    
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Date getRegDate() { return regDate; }
    public void setRegDate(Date regDate) { this.regDate = regDate; }

}
