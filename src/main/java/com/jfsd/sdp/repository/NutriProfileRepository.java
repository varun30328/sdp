package com.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jfsd.sdp.model.NutriProfile;

@Repository
public interface NutriProfileRepository extends JpaRepository<NutriProfile, Long> {
}
