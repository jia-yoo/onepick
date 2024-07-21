package com.example.onepickApi.service;



import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.onepickApi.entity.User;
import com.example.onepickApi.repository.UserRepository;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;

@Service
public class NotificationService {

	
	@Autowired
    private UserRepository userRepo;
	
	
    public void sendNotification(String token, String title, String body) {
        Message message = Message.builder()
                .setNotification(Notification.builder()
                        .setTitle(title)
                        .setBody(body)
                        .build())
                .setToken(token)
                .build();

        try {
            String response = FirebaseMessaging.getInstance().send(message);
            System.out.println("Successfully sent message: " + response);
            
            // 토큰의 마지막 사용 시점 업데이트
            User userWithToken = userRepo.findByToken(token);
            if (userWithToken.getToken() != null) {
            	userWithToken.setLastTokenUsedTime(LocalDateTime.now());
            	userRepo.save(userWithToken);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}