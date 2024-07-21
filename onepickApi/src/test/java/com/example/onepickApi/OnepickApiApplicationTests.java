package com.example.onepickApi;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.onepickApi.entity.User;
import com.example.onepickApi.repository.UserRepository;
import com.example.onepickApi.service.NotificationService;

@SpringBootTest
public class OnepickApiApplicationTests {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private NotificationService notificationService;
    
    private String fcmToken = "dHJJLCfrzEtLZQe0tOyobo:APA91bFuP6D1e9X-JrDvhUVPxOJUERS1H1eFD1j8mSbNhEoFQ4bDyM5rxsvUEffKidHDOaNQ5HudU82gBKfiI1LBXDA-YeZk6gg_08cldGLK9U6HdtvU20BCVBds3VQF5xMFM4iPFSuR"; 

    @Test
    public void testApplicationFlow() {
        // 토큰 및 유저 저장하기
        User userToken = new User();
        userToken.setUsername("testuser");
        userToken.setPassword("password123");
        userToken.setRole("ROLE_USER");
        userToken.setName("홍길동");
        userToken.setBirthDate(LocalDate.of(1990, 1, 1));
        userToken.setGender("Male");
        userToken.setEmail("testuser@example.com");
        userToken.setTel("010-1111-1111");
        userToken.setAddr("서울특별시 강남구 강남대로");
        userToken.setActive(true);
        userToken.setToken(fcmToken);
        userRepo.save(userToken);
           
        // 테스트 푸시알람 보내기
        notificationService.sendNotification(fcmToken, "테스트 메시지 입니다....", "이건 테스트 메시지 입니다");

        //임의로 마지막 토큰 사용 시간 30일 이전으로 셋해주기
        userToken.setLastTokenUsedTime(LocalDateTime.now().minusDays(32));
        userRepo.save(userToken);

        // 지우는 메서드 실행
        userRepo.clearTokensByLastTokenUsedTimeBefore(LocalDateTime.now().minusDays(30));
       
        // 데이터베이스에서 엔티티를 다시 로드하여 변경 사항 반영 확인
        User updatedUser = userRepo.findById(userToken.getUsername()).orElse(null);

        System.out.println(updatedUser.getLastTokenUsedTime());

        // 토큰이 없어지는지 확인
        assertThat(updatedUser.getToken()).isNull();
    }
}
