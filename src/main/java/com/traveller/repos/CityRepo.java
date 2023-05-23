package com.traveller.repos;

import com.traveller.domain.City;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CityRepo extends JpaRepository<City,Integer> {



    List<City> findFirst9ByNameOfTheCityStartingWithIgnoreCase(String input);




}
