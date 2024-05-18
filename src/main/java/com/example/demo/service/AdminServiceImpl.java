package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Admin;
import com.example.demo.model.Login;
import com.example.demo.repo.Adminrepo;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private Adminrepo adrepo;

	public boolean existsByUsername(String email) {
		List<Admin> l1 = adrepo.exitsByEmail(email);
		System.out.println("nnnnnnnnn"+l1);
		if (l1.isEmpty()) {
			return false;
		}
		return true;
	}
@Transactional
	public boolean insertAdmin(Admin admin) {
		try {
			System.out.println(adrepo.save(admin));
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	/*
	 * public boolean loginVerify(Login log) { System.out.println("admin   ");
	 * List<Admin> admins = adrepo.loginVerify(log.getEmail(), log.getPass());
	 * System.out.println("admin3   " + admins); return !admins.isEmpty(); }
	 */
}
