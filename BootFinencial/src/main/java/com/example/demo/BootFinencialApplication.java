package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
//@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
@SpringBootApplication
@EnableJpaRepositories

//@ComponentScan(basePackages = "com.example.demo")
//@SpringBootApplication(scanBasePackageClasses = {"com.exampale.demo"})
//@EnableJpaRepositories
public class BootFinencialApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootFinencialApplication.class, args);
		System.out.println("hello ji");
		
	}

}
