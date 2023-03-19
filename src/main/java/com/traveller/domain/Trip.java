package com.traveller.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.List;


@Entity
@NoArgsConstructor
@Data
@Table(name = "trips")
public class Trip {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    /*private User owner;*/
    @NotEmpty(message = "Неправильно указан город,пожалуйста выберете город из выпадающего списка")
    @Size(min = 2, max = 30)
    private String fromTown;
    @NotEmpty(message = "Неправильно указан город,пожалуйста выберете город из выпадающего списка")
    @Size(min = 2, max = 30)
    private String toTown;

    private LocalDate departureDateAndTime;



    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "trip_user",
            joinColumns = @JoinColumn(name = "trip_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> passengers;


    public Trip(String fromTown, String toTown, LocalDate departureDateAndTime) {
        this.fromTown = fromTown;
        this.toTown = toTown;
        this.departureDateAndTime = departureDateAndTime;
    }
}
