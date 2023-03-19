package com.traveller.service;

import com.traveller.domain.Trip;
import com.traveller.repos.TripRepo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TripService {
    private final TripRepo tripRepo;

    public TripService(TripRepo tripRepo) {
        this.tripRepo = tripRepo;
    }


    public List<Trip> findAll() {
        return tripRepo.findAll();
    }

    public void save(Trip trip) {
        tripRepo.save(trip);
    }

    public Optional<Trip> findById(Integer id) {
        return tripRepo.findById(id);
    }
    public Integer countById(Integer id) {
        return tripRepo.countById(id);
    }
    public void deleteById(Integer id) {
        tripRepo.deleteById(id);
    }


















}
