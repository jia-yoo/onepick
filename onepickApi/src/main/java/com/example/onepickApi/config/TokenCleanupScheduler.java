package com.example.onepickApi.config;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.onepickApi.repository.CompanyRepository;
import com.example.onepickApi.repository.UserRepository;

@Component
public class TokenCleanupScheduler {

    @Autowired
    private UserRepository userRepo;
    @Autowired
    private CompanyRepository companyRepo;
    
    @Scheduled(cron = "0 0 0 * * ?") // 매일 자정에 실행
    public void cleanupOldTokens() {
        LocalDateTime cutoffDate = LocalDateTime.now().minus(30, ChronoUnit.DAYS);
        userRepo.clearTokensByLastTokenUsedTimeBefore(cutoffDate);
        companyRepo.clearTokensByLastTokenUsedTimeBefore(cutoffDate);
    }
}
