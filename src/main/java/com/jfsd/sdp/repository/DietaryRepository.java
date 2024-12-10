package com.jfsd.sdp.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jfsd.sdp.model.Dietary;



@Repository
public interface DietaryRepository extends CrudRepository<Dietary,Integer>
{

}