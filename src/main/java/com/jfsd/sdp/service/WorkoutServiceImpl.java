package com.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.sdp.model.Workout;
import com.jfsd.sdp.repository.WorkoutRepository;


@Service

public class WorkoutServiceImpl implements WorkoutService 
{
    @Autowired
    private WorkoutRepository workoutRepository;
  @Override
  public String addWorkout(Workout workout) 
  {
    workoutRepository.save(workout);
    return "Workout Added Successfully";
  }
@Override
public List<Workout> ViewAllworkouts() {
  return (List<Workout>) workoutRepository.findAll();

}
@Override
public Workout ViewworkoutsByID(int workoutid) {
  return workoutRepository.findById(workoutid).get();

}

}

