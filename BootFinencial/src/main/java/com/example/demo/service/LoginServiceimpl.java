package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Admin;
import com.example.demo.repo.Adminrepo;

@Service
public class LoginServiceimpl implements LoginService {
@Autowired
private Adminrepo adrepo;
public boolean loginVerify(String email,String pass) {
	boolean flag=true;
	Admin l1=adrepo.loginVerify(email,pass);
	if(l1!=null) {
	//System.out.println("verify    "+l1.getEmail());
	if(l1.getEmail()!=null && l1.getPass()!=null) {
		flag=true;
	}}
	return false;
}
}
