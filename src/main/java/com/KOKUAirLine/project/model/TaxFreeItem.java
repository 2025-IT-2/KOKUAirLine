package com.KOKUAirLine.project.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.SequenceGenerator;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class TaxFreeItem {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "product_seq")
    @SequenceGenerator(name = "product_seq", sequenceName = "PRODUCT_SEQ", allocationSize = 1)
	private int product_id;
	
	private String product_name;
	
	@Lob
	private byte[] imageData;
	
	private int price;
	private int count;
	
	public TaxFreeItem(String name, byte[] image, int price) {
		this.product_name = name;
		this.imageData = image;
		this.price = price;
		this.count = 100;
	}
}
