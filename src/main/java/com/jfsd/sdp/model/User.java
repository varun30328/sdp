package com.jfsd.sdp.model;

import java.sql.Blob;
import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "user_table")
public class User
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "u_name",length =30,nullable=false )
	private String name;
	@Column(name = "u_gender",length = 15,nullable =false)
	private String gender;
	@Column(name = "u_age",nullable =false)
	private double age;
	@Column(name = "u_email",length =30 ,nullable =false,unique = true)
	private String email;
	@Column(name = "u_password",length =30 ,nullable =false)
	private String password;
	@Column(name = "u_contact", length = 40, nullable =false, unique = true)
	private String contact;
	@Column(name = "u_location",length = 50,nullable =false)
	private String location;
	
	 @Temporal(TemporalType.DATE)
	    @Column(name = "registration_date", nullable = false)
	    private Date registrationDate;
	 
	 private Blob image;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public double getAge() {
		return age;
	}
	public void setAge(double age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", gender=" + gender + ", age=" + age + ", email=" + email
				+ ", password=" + password + ", contact=" + contact + ", location=" + location + "]";
	}
	
	public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	
}