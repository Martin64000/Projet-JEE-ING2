package com.example.apiprojet.repository;

import com.example.apiprojet.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findUserByRoleType(String type);
}
