package com.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

import com.jfsd.sdp.model.Workout;



@Repository
public interface WorkoutRepository extends CrudRepository<Workout, Integer> {
    
    @Query("SELECT FUNCTION('MONTHNAME', w.registrationDate) AS month, " +
           "SUM(w.duration) AS totalDuration, " +
           "COUNT(w) AS workoutCount " +
           "FROM Workout w " +
           "GROUP BY FUNCTION('MONTHNAME', w.registrationDate), FUNCTION('MONTH', w.registrationDate) " +
           "ORDER BY FUNCTION('MONTH', w.registrationDate)")
    List<Object[]> getWorkoutStatsByMonth();
}
