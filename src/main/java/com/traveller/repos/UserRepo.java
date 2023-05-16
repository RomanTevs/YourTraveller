package com.traveller.repos;

import com.traveller.domain.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepo extends JpaRepository<UserEntity,Integer> {
    Optional<UserEntity> findByName(String nameOfTheUser);
    Boolean existsByName(String nameOfTheUser);
}
