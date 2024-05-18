package com.example.demo.service;

import org.springframework.stereotype.Service;

@Service
public interface LoginService {
public boolean loginVerify(String email,String pass);
}
