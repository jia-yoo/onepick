package com.example.onepickApi.config;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.within;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.example.onepickApi.repository.CompanyRepository;
import com.example.onepickApi.repository.UserRepository;

public class TokenCleanupSchedulerTest {

    @Mock
    private UserRepository userRepo;
    @Mock
    private CompanyRepository companyRepo;

    @InjectMocks
    private TokenCleanupScheduler tokenCleanupScheduler;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testCleanupOldTokens() {
    	// LocalDateTime 인자를 캡처하기 위한 ArgumentCaptor 생성
        ArgumentCaptor<LocalDateTime> captor = ArgumentCaptor.forClass(LocalDateTime.class);

        // 테스트 대상 메서드 호출
        tokenCleanupScheduler.cleanupOldTokens();

        // userRepo.clearTokensByLastTokenUsedTimeBefore 메서드가 한 번 호출되었는지 검증하고 인자 캡처
        verify(userRepo, times(1)).clearTokensByLastTokenUsedTimeBefore(captor.capture());
        // companyRepo.clearTokensByLastTokenUsedTimeBefore 메서드가 한 번 호출되었는지 검증하고 인자 캡처
        verify(companyRepo, times(1)).clearTokensByLastTokenUsedTimeBefore(captor.capture());

        // 캡처된 인자 값 가져오기
        LocalDateTime capturedDateTime = captor.getValue();

             
        // 현재 시간에서 30일 전의 예상 시간 계산
        LocalDateTime expectedDateTime = LocalDateTime.now().minusDays(30);
        // 캡처된 시간과 예상 시간이 1초 이내로 가까운지 검증
        assertThat(capturedDateTime).isCloseTo(expectedDateTime, within(1, ChronoUnit.SECONDS));
    }
}
