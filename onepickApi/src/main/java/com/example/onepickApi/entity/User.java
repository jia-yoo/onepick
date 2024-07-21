package com.example.onepickApi.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

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
public class User extends BaseEntity implements Member{

	@Id
	private String username;
	@Column(nullable = false)
	private String password;
	@Column(nullable = false)
	private String role;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false)
	private LocalDate birthDate;
	@Column(nullable = false)
	private String gender;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String tel;
    @Column(nullable = false)
    private String addr;
    private String fileName;
    private String filePath;
    private Long fileSize;
    private String militaryService;
    @Column(unique = true)
    private String token;
    private LocalDateTime lastTokenUsedTime;
    private boolean active; // 활동 상태 추가
}
