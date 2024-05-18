package com.example.demo.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Admin;

public interface Adminrepo extends JpaRepository<Admin,Integer> {
@Query("SELECT a FROM Admin a WHERE a.email = :email")
List<Admin> exitsByEmail(@Param("email") String email);

@Query("SELECT a FROM Admin a WHERE a.email = :email AND a.pass = :pass")
Admin loginVerify(@Param("email") String email, @Param("pass") String password);

}
