package com.example.anhtt.model.dao;


import com.example.anhtt.model.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface UserDao extends JpaRepository<User, Long> {
    User getByEmail(String email);
    @Query("SELECT u FROM User u WHERE "
            + "(:id IS NULL OR u.id = :id) AND "
            + "(:email IS NULL OR u.email = :email) AND "
            + "(:firstName IS NULL OR u.firstName LIKE %:firstName%) AND"
            + "(:lastName IS NULL OR u.lastName LIKE %:lastName%)"
    )
    Page<User> findByIdOrEmailOrName(Long id, String email, String firstName, String lastName, Pageable pageable);
}
