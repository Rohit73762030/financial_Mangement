package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Invoice1;
import com.example.demo.model.Product1;

import com.example.demo.repo.repoexp;

@Service
public class ProductServiceImpl implements expencesesservices {
	@Autowired
	private repoexp frep1;

	@Override
	@Transactional
	public boolean insertExpences(Product1 product) {
		try {
			System.out.println(frep1.save(product));
	         System.out.println(product.getName1());
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Product1> showExpences() {
		return (List<Product1>) frep1.findAll();
	}

	@Override
	@Transactional
	public boolean updateexpences(Product1 product, int eid) {
		try {
			Product1 p = frep1.findById(eid).orElse(null);
			frep1.save(product);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public void deleteExpences(int eid) {
		frep1.deleteById(eid);
	}

	public List<Product1> exportExpencesByDateRange(String start, String end) {
		return frep1.findByStartDateBetween(start, end);
	}

	public Double findTotalAmountInDateRange(String start, String end) {

		return frep1.findTotalAmountInDateRange(start, end);
	}
}
