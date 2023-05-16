package com.traveller.service;

import com.traveller.domain.UserEntity;
import com.traveller.repos.UserRepo;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepo userRepo;
    
    public UserService(UserRepo userRepo) {
        this.userRepo = userRepo;
    }


    public Optional<UserEntity> findByUserName(String username) {
        return userRepo.findByName(username);
    }

    public Boolean existByName(String username) {
        return userRepo.existsByName(username);
    }

    public List<UserEntity> findAll() {
        return userRepo.findAll();
    }

    public void save(UserEntity userEntity) {
        userRepo.save(userEntity);
    }

    public Optional<UserEntity> findById(Integer id) {
        return userRepo.findById(id);
    }

    public void deleteById(Integer id) {
        userRepo.deleteById(id);
    }


    
}
