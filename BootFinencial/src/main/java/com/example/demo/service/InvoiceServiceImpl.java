package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Invoice1;
import com.example.demo.repo.frepo;

@Service
public class InvoiceServiceImpl implements InvoiceService {
@Autowired
//@Qualifier("repo2")
private  frepo frep1;

@Override
@Transactional
public boolean insertInvoice(Invoice1 invoice) {
	try{frep1.save(invoice);
	System.out.println("mmmmmmmmmm"+invoice.getName1());
	return true;}
	catch(Exception e) {
		return false;
	}
}
@Override
public List<Invoice1>showInvoice(){
	return (List<Invoice1>) frep1.findAll();
}
@Override
@Transactional
public boolean updateinvoice(Invoice1 product,int inid) {
	
	try{Invoice1 p=frep1.findById(inid).get();
	frep1.save(product);
	return true;}
	catch(Exception e) {
		return false;
	}
}
@Override
public void deleteInvoice(int inid) {
	frep1.deleteById(inid);
}
public List<Invoice1> exportInvoicesByDateRange(String start,String end){
	return frep1.findByStartDateBetween(start, end);
}
public Double findTotalAmountInDateRange(String start,String end){
	
	return frep1.findTotalAmountInDateRange(start,end);
}
}
