package com.example.demo.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Invoice1;

@Repository
//@Component("repo2")
public interface frepo extends JpaRepository<Invoice1,Integer> {
	 @Query("SELECT e FROM Invoice1 e WHERE e.date BETWEEN :startDate AND :endDate")
	   List<Invoice1> findByStartDateBetween(@Param("startDate") String startDate,@Param("endDate")String endDate);
	   @Query("SELECT SUM(e.totalamount) FROM Invoice1 e WHERE e.date BETWEEN :startDate AND :endDate")
	   Double findTotalAmountInDateRange(@Param("startDate") String startDate,@Param("endDate") String endDate);
}
