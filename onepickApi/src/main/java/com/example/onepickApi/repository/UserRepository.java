package com.example.onepickApi.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.onepickApi.entity.Member;
import com.example.onepickApi.entity.User;

import jakarta.transaction.Transactional;

public interface UserRepository extends JpaRepository<User, String>{

	public Member findByUsername(String username);
	
	
	@Modifying
	@Transactional
	@Query("UPDATE User u SET u.fileName = :fileName, u.filePath = :filePath, u.fileSize = :fileSize WHERE u.username = :username")
    void updateFileInfo(@Param("username") String username, @Param("fileName") String fileName, @Param("filePath") String filePath, @Param("fileSize") Long fileSize);

	public List<User> findByUsernameContainingOrNameContaining(String username, String name);
	
	User findByToken(String token);
    
    @Query(value="UPDATE User SET token = null WHERE last_token_used_time < :cutoffDate", nativeQuery=true)
    void clearTokensByLastTokenUsedTimeBefore( @Param("cutoffDate") LocalDateTime cutoffDate);

	
}
