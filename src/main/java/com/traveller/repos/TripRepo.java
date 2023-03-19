package com.traveller.repos;

import com.traveller.domain.Trip;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TripRepo extends JpaRepository<Trip,Integer> {
    Integer countById(Integer id);

}
