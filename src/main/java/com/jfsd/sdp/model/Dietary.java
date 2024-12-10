package com.jfsd.sdp.model;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="dietary_table")
public class Dietary 
{
  @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String dietType;
    private String DietaryCustom;
    private String breakfast;
    private String lunch;
    private String dinner;
    private String snack;
   
    
    
  public Long getId() {
    return id;
  }
  public void setId(Long id) {
    this.id = id;
  }
  public String getDietType() {
    return dietType;
  }
  public void setDietType(String dietType) {
    this.dietType = dietType;
  }
  public String getDietaryCustom() {
    return DietaryCustom;
  }
  public void setDietaryCustom(String dietaryCustom) {
    DietaryCustom = dietaryCustom;
  }
  public String getBreakfast() {
    return breakfast;
  }
  public void setBreakfast(String breakfast) {
    this.breakfast = breakfast;
  }
  public String getLunch() {
    return lunch;
  }
  public void setLunch(String lunch) {
    this.lunch = lunch;
  }
  public String getDinner() {
    return dinner;
  }
  public void setDinner(String dinner) {
    this.dinner = dinner;
  }
  public String getSnack() {
    return snack;
  }
  public void setSnack(String snack) {
    this.snack = snack;
  }
 

}