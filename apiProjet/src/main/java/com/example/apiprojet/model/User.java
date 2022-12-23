package com.example.apiprojet.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Map;

@Data
@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @OneToOne
    @JoinColumn(name = "role")
    private Role role;

    @OneToMany
    @JoinColumn(name = "cart")
    private Map<String, Manga> cart;
}