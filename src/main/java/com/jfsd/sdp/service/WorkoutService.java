package com.jfsd.sdp.service;

import java.util.List;

import com.jfsd.sdp.model.Workout;

public interface WorkoutService 
{
   public String addWorkout(Workout workout);
   public List<Workout> ViewAllworkouts();
   public Workout ViewworkoutsByID(int workoutid);
}