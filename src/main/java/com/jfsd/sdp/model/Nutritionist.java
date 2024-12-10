package com.jfsd.sdp.model;

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
@Table(name = "nutritionist_table")
public class Nutritionist 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String fullname;
	private String gender;
	private String email;
	private String password;
	private String contact;
	private String qualifications;
	private String specializations;
	private double experience;
	private long licenseno;
	private String availablehours;
	private String preferedConsultation;
	
	@Temporal(TemporalType.DATE)
    @Column(name = "registration_date", nullable = false)
    private Date registrationDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
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
	public String getQualifications() {
		return qualifications;
	}
	public void setQualifications(String qualifications) {
		this.qualifications = qualifications;
	}
	public String getSpecializations() {
		return specializations;
	}
	public void setSpecializations(String specializations) {
		this.specializations = specializations;
	}
	public double getExperience() {
		return experience;
	}
	public void setExperience(double experience) {
		this.experience = experience;
	}
	public long getLicenseno() {
		return licenseno;
	}
	public void setLicenseno(long licenseno) {
		this.licenseno = licenseno;
	}
	public String getAvailablehours() {
		return availablehours;
	}
	public void setAvailablehours(String availablehours) {
		this.availablehours = availablehours;
	}
	public String getPreferedConsultation() {
		return preferedConsultation;
	}
	public void setPreferedConsultation(String preferedConsultation) {
		this.preferedConsultation = preferedConsultation;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
}