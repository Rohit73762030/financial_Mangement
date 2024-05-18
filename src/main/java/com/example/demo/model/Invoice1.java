package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
//@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString
public class Invoice1 {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int inid;
	@Column(length = 255)
	private String name1;
	public int getInid() {
		return inid;
	}
	public void setInid(int inid) {
		this.inid = inid;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getDesc1() {
		return desc1;
	}
	public void setDesc1(String desc1) {
		this.desc1 = desc1;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getQunatity() {
		return qunatity;
	}
	public void setQunatity(double qunatity) {
		this.qunatity = qunatity;
	}
	public double getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}
	@Column(length = 255)
	private String desc1;
	private String date;
	private double price;
	private double qunatity;
	private double totalamount;
}
