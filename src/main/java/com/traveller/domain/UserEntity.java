package com.traveller.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Table(name = "users")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotEmpty(message = "логин не может быть пустой строкой")
    @Size(min = 2, max = 27, message = "размер от 2 до 27")
    private String name;
    @NotEmpty(message = "пароль не может быть пустой строкой")
    @Size(min = 3, max = 90, message = "размер от 2 до 27")
    private String password;

    public UserEntity(String name, String password) {
        this.name = name;
        this.password = password;
    }

    @ManyToMany(cascade = CascadeType.ALL,fetch =  FetchType.EAGER)
    @JoinTable(
            name = "trip_user",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "trip_id")
    )
    private List<Trip> trips = new ArrayList<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private Set<Role> roles = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL,
            mappedBy = "creatorOfThisTrip")
    private Set<Trip> tripsCreatedByThisUser;


}
