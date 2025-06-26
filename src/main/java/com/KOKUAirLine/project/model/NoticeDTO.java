package com.KOKUAirLine.project.model;

import java.util.Date;



import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class NoticeDTO {
	
	@Id
	private Long id;
    private String title;
    private String content;
    private Date regDate;
   

}
