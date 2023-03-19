package com.traveller.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Data
@Table(name = "cities")
public class City {
   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
   Integer id;

   String nameOfTheCity;

}
