package com.jfsd.sdp.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Recipe_table")
public class Recipe 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  
  private int id;
  private String category;
  private String name;
  private String level;
  @Column(length = 5000)
  private String description;
  private String prep;
  private String nutritionfacts;
  private double calorie;
  private Blob image; // blob - binary large object
  
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getLevel() {
	return level;
}
public void setLevel(String level) {
	this.level = level;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getPrep() {
	return prep;
}
public void setPrep(String prep) {
	this.prep = prep;
}
public String getNutritionfacts() {
	return nutritionfacts;
}
public void setNutritionfacts(String nutritionfacts) {
	this.nutritionfacts = nutritionfacts;
}
public double getCalorie() {
	return calorie;
}
public void setCalorie(double calorie) {
	this.calorie = calorie;
}
public Blob getImage() {
	return image;
}
public void setImage(Blob image) {
	this.image = image;
}
  

}
