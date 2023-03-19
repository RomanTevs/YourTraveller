package com.traveller.service;


import com.traveller.domain.Role;
import com.traveller.repos.RoleRepo;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class RoleService {

    private final RoleRepo roleRepo;

    public RoleService(RoleRepo roleRepo) {
        this.roleRepo = roleRepo;
    }

    public Optional<Role> findByName(String name) {
        return roleRepo.findByName(name);
    }


}
