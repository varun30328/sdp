package com.jfsd.sdp.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class DailyTrackerEntry {

  @Id
    private LocalDate date;
    private int meals;
    private int calories;
    private int protein;
    private double water;
    private int steps;
    private double sleep;
    private int workout;

    // Default constructor
    public DailyTrackerEntry() {
    }

    // Parameterized constructor
    public DailyTrackerEntry(LocalDate date, int meals, int calories, int protein, double water, int steps, double sleep, int workout) {
        this.date = date;
        this.meals = meals;
        this.calories = calories;
        this.protein = protein;
        this.water = water;
        this.steps = steps;
        this.sleep = sleep;
        this.workout = workout;
    }

    // Getters and Setters
    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getMeals() {
        return meals;
    }

    public void setMeals(int meals) {
        this.meals = meals;
    }

    public int getCalories() {
        return calories;
    }

    public void setCalories(int calories) {
        this.calories = calories;
    }

    public int getProtein() {
        return protein;
    }

    public void setProtein(int protein) {
        this.protein = protein;
    }

    public double getWater() {
        return water;
    }

    public void setWater(double water) {
        this.water = water;
    }

    public int getSteps() {
        return steps;
    }

    public void setSteps(int steps) {
        this.steps = steps;
    }

    public double getSleep() {
        return sleep;
    }

    public void setSleep(double sleep) {
        this.sleep = sleep;
    }

    public int getWorkout() {
        return workout;
    }

    public void setWorkout(int workout) {
        this.workout = workout;
    }

    @Override
    public String toString() {
        return "DailyTrackerEntry{" +
                "date=" + date +
                ", meals=" + meals +
                ", calories=" + calories +
                ", protein=" + protein +
                ", water=" + water +
                ", steps=" + steps +
                ", sleep=" + sleep +
                ", workout=" + workout +
                '}';
    }
}