package com.jfsd.sdp.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jfsd.sdp.model.DailyTrackerEntry;



@Repository
public interface DailyTrackerRepository extends JpaRepository<DailyTrackerEntry, LocalDate> {
    Optional<DailyTrackerEntry> findByDate(LocalDate date);
    List<DailyTrackerEntry> findAll();
    
}