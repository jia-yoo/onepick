package com.example.onepickApi.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.onepickApi.entity.Company;
import com.example.onepickApi.entity.JobAd;
import com.example.onepickApi.entity.Member;

import jakarta.transaction.Transactional;

public interface CompanyRepository extends JpaRepository<Company, String> {

	public Member findByUsername(String username);
	
	@Modifying
	@Transactional
	@Query("UPDATE Company c SET c.fileName = :fileName, c.filePath = :filePath, c.fileSize = :fileSize WHERE c.username = :username")
    void updateFileInfo(@Param("username") String username, @Param("fileName") String fileName, @Param("filePath") String filePath, @Param("fileSize") Long fileSize);

	public List<Company> findByUsernameContainingOrNameContaining(String username, String name);
	

	List<Company> findByNameContainingOrSectorContainingOrSizeContaining(String name, String sector, String size);
	 
	@Query(value="UPDATE Company SET token = null WHERE last_token_used_time < :cutoffDate", nativeQuery=true)
	void clearTokensByLastTokenUsedTimeBefore( @Param("cutoffDate") LocalDateTime cutoffDate);

}
