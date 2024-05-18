package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.example.demo.model.Invoice1;
import com.example.demo.model.Product1;
@Service
public interface expencesesservices {
public boolean insertExpences(Product1 product);
List<Product1> showExpences();
boolean updateexpences(Product1 product,int eid);
public void deleteExpences(int eid);
public List<Product1> exportExpencesByDateRange(String start,String end);
public Double findTotalAmountInDateRange(String start,String end);
//List<Product> fetchProduct();
}
