package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.Invoice1;

@Service
public interface InvoiceService {
public boolean insertInvoice(Invoice1 invoice);
List<Invoice1> showInvoice();
boolean updateinvoice(Invoice1 invoice,int eid);
public void deleteInvoice(int eid);
//List<Product> fetchProduct();
public List<Invoice1> exportInvoicesByDateRange(String start,String end);
public Double findTotalAmountInDateRange(String start,String end);
}
