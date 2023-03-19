package com.traveller.service;

import com.traveller.domain.Role;
import com.traveller.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.stream.Collectors;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserService userService;

    @Autowired
    public UserDetailsServiceImpl(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userService.findByUserName(username).orElseThrow(() -> new UsernameNotFoundException("Username can not be found"));
        return new org.springframework.security.core.userdetails.User(user.getName(), user.getPassword(),
                mapRolesToGrantedAuthorities(user.getRoles()));
    }

    private Collection<GrantedAuthority> mapRolesToGrantedAuthorities(Collection<Role> roles) {
        return roles.stream()
                .map(role ->  new SimpleGrantedAuthority(role.getName()))
                .collect(Collectors.toList());
    }


}
