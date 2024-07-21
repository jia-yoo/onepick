
package com.example.onepickApi.repository;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.example.onepickApi.config.TokenCleanupScheduler;
import com.example.onepickApi.entity.User;

public class UserTokenRepositoryTest {

    @Mock
    private UserRepository userRepo;


    @InjectMocks
    private TokenCleanupScheduler tokenCleanupScheduler;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    private final String fcmToken = "dHJJLCfrzEtLZQe0tOyobo:APA91bFuP6D1e9X-JrDvhUVPxOJUERS1H1eFD1j8mSbNhEoFQ4bDyM5rxsvUEffKidHDOaNQ5HudU82gBKfiI1LBXDA-YeZk6gg_08cldGLK9U6HdtvU20BCVBds3VQF5xMFM4iPFSuR";

    //토큰이 저장되는지, findByToken 테스트
    @Test
    public void testSaveAndFindUserToken() {
        User userToken = new User();
        userToken.setUsername("testuser");
        userToken.setPassword("testpassword");
        userToken.setRole("ROLE_USER");
        userToken.setName("John Doe");
        userToken.setBirthDate(LocalDate.of(1990, 1, 1));
        userToken.setGender("Male");
        userToken.setEmail("testuser@example.com");
        userToken.setTel("123-456-7890");
        userToken.setAddr("123 Main St, Anytown, USA");
        userToken.setActive(true);
        userToken.setToken(fcmToken);
        userToken.setLastTokenUsedTime(LocalDateTime.now());

        when(userRepo.save(userToken)).thenReturn(userToken);
        when(userRepo.findByToken(fcmToken)).thenReturn(userToken);

        User savedToken = userRepo.save(userToken);
        User foundToken = userRepo.findByToken(fcmToken);

        assertThat(savedToken).isNotNull();
        assertThat(foundToken).isNotNull();
        assertThat(foundToken.getToken()).isEqualTo(fcmToken);

        verify(userRepo, times(1)).save(userToken);
        verify(userRepo, times(1)).findByToken(fcmToken);
    }

    //clearTokensByLastTokenUsedTimeBefore 테스트
    @Test
    public void testDeleteOldTokens() {
    	 User userToken = new User();
         userToken.setUsername("testuser");
         userToken.setPassword("testpassword");
         userToken.setRole("ROLE_USER");
         userToken.setName("John Doe");
         userToken.setBirthDate(LocalDate.of(1990, 1, 1));
         userToken.setGender("Male");
         userToken.setEmail("testuser@example.com");
         userToken.setTel("123-456-7890");
         userToken.setAddr("123 Main St, Anytown, USA");
         userToken.setActive(true);
         userToken.setToken(fcmToken);
         userToken.setLastTokenUsedTime(LocalDateTime.now().minusDays(31));

        userRepo.save(userToken);
        
        System.out.println(userToken.getLastTokenUsedTime());
        
        userRepo.clearTokensByLastTokenUsedTimeBefore(LocalDateTime.now().minusDays(30));

        
        
        User foundToken = userRepo.findByToken(fcmToken);
        assertThat(foundToken).isNull();
    }
}
