package com.example.onepickApi.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.example.onepickApi.entity.User;
import com.example.onepickApi.repository.UserRepository;

public class NotificationServiceTest {

    @Mock
    private UserRepository userRepo;

    @InjectMocks
    private NotificationService notificationService;

    public NotificationServiceTest() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testSendNotification() {
        User userWithToken = new User();
        userWithToken.setToken("testToken");
        userWithToken.setLastTokenUsedTime(LocalDateTime.now().minusDays(31));

        when(userRepo.findByToken("testToken")).thenReturn(userWithToken);

        notificationService.sendNotification("testToken", "Test Message", "test Message Body...");

        verify(userRepo, times(1)).save(userWithToken);
        assertThat(userWithToken.getLastTokenUsedTime()).isAfter(LocalDateTime.now().minusMinutes(1));
    }
}
