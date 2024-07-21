package com.example.onepickApi.entity;

import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Company extends BaseEntity implements Member{

		@Id
		private String username;
		@Column(nullable = false)
		private String password;
		@Column(nullable = false)
		private String role;
	    @Column(name = "logo")
	    private String logo;
	    private String name;
	    @Column(nullable = false)
	    private String ceo;
	    @Column(nullable = false)
	    private String num;
	    @Column(nullable = false)
	    private String addr;
	    @Column(nullable = false)
	    private String sector;
	    private String url;
	    @Column(nullable = false)
	    private int employeesNum;
	    private String fileName;
		private String filePath;
		private Long fileSize;
	    @Column(nullable = false)
	    private String size;
	    @Column(nullable = false)
	    private String yrSales;
	    @Column(unique = true)
	    private String token;
	    private LocalDateTime lastTokenUsedTime;
	    private boolean active; // 활동 상태 추가
	    
}
