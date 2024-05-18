package com.example.demo.service;


import org.springframework.stereotype.Service;

import com.example.demo.model.Admin;

@Service
public interface AdminService {
	public boolean insertAdmin(Admin admin);
	public boolean existsByUsername(String email);
}
