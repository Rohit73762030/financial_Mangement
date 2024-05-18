package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Admin {

	@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String email;
   @Column(name= "pass")
	private String pass;
	@Column(name= "name")
	private String name;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


}
