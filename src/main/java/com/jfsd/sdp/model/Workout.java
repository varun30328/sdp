package com.jfsd.sdp.model;

import java.sql.Blob;
import java.sql.Date;
import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "workout_table")
public class Workout 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Temporal(TemporalType.DATE)
    private Date registrationDate;
    private String name;
    private String type;
    private String excercisename;
    private String equipment;
    private String difficulty;
    private String setsandrepetitions;
    private String duration;
    private String Instructions;
    private Blob Image;
    private String url;
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
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }
  public String getExcercisename() {
    return excercisename;
  }
  public void setExcercisename(String excercisename) {
    this.excercisename = excercisename;
  }
  public String getEquipment() {
    return equipment;
  }
  public void setEquipment(String equipment) {
    this.equipment = equipment;
  }
  public String getDifficulty() {
    return difficulty;
  }
  public void setDifficulty(String difficulty) {
    this.difficulty = difficulty;
  }
  public String getInstructions() {
    return Instructions;
  }
  public void setInstructions(String instructions) {
    Instructions = instructions;
  }
  public Blob getImage() {
    return Image;
  }
  public void setImage(Blob image) {
    Image = image;
  }
  public String getUrl() {
    return url;
  }
  public void setUrl(String url) {
    this.url = url;
  }
public String getSetsandrepetitions() {
  return setsandrepetitions;
}
public void setSetsandrepetitions(String setsandrepetitions) {
  this.setsandrepetitions = setsandrepetitions;
}
public String getDuration() {
  return duration;
}
public void setDuration(String duration) {
  this.duration = duration;
}
public Date getRegistrationDate() {
    return registrationDate;
}

public void setRegistrationDate(Date registrationDate) {
    this.registrationDate = registrationDate;
}

    
    
}