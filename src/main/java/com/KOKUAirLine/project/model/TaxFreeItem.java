package com.KOKUAirLine.project.model;

import java.util.Base64;

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
@NoArgsConstructor
public class TaxFreeItem {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "product_seq")
    @SequenceGenerator(name = "product_seq", sequenceName = "PRODUCT_SEQ", allocationSize = 1)
	private int id;
	
	private String name;
	
	@Lob
	private byte[] image;
	
	private int price;
	private int count;
	private String description;
	
	public TaxFreeItem(String name, byte[] image, String desc, int price) {
		this.name = name;
		this.image = image;
		this.price = price;
		this.description = desc;
		this.count = 100;
	}
	
	public String getName() {
		return name;
	}
	
	public String getImageBase64() {
		return Base64.getEncoder().encodeToString(this.image);
	}
	
	public int getPrice() {
		return price;
	}
	
	public int getCount() {
		return count;
	}
	
	public String getDescription() {
		return description;
	}
}
