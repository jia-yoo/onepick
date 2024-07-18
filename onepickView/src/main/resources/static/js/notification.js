


 // Import the functions you need from the SDKs you need
    import { initializeApp } from 'https://www.gstatic.com/firebasejs/9.0.0/firebase-app.js';
    import { getMessaging, getToken, onMessage } from 'https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging.js';

    // Your web app's Firebase configuration
    const firebaseConfig = {
          apiKey: "AIzaSyDke7gQNq9KzXpYrrl7zwMzJI1iYjgylAo",
		  authDomain: "onepick-2a02e.firebaseapp.com",
		  databaseURL: "https://onepick-2a02e-default-rtdb.asia-southeast1.firebasedatabase.app",
		  projectId: "onepick-2a02e",
		  storageBucket: "onepick-2a02e.appspot.com",
		  messagingSenderId: "1000997640667",
		  appId: "1:1000997640667:web:71eb0c5f76d972d5652ffe",
		  measurementId: "G-F1F2D8M1Y4"
    };

     // Initialize Firebase
    const app = initializeApp(firebaseConfig);

    // Initialize Firebase Cloud Messaging and get a reference to the service
    const messaging = getMessaging(app);

    
    
    
  // Define the setNotification function
window.setNotification = async function() {

  try {
    // Request notification permission from the user
    const permission = await Notification.requestPermission();
    const modalBody = document.querySelector("#exampleModal1 .modal-body");
    const notificationBtn = document.querySelector("#exampleModal1 .modal-footer");

      console.log('Notification permission granted.');
    if (permission === 'granted') {


      // Register the Service Worker and get the FCM token
      if ('serviceWorker' in navigator) {
        const registration = await navigator.serviceWorker.register('/js/firebase-messaging-sw.js');
        console.log('Service Worker registered with scope:', registration.scope);
        const currentToken = await getToken(messaging, {
          vapidKey: 'BLcSeRWoHAyawxByQ1N__CdtF49_9xrIDS4sW0Zu5VuS3zXZvM9xyym054TN276SxN_za2eeV7mBak77Zetgf2Q',
          serviceWorkerRegistration: registration
        });
 			console.log('FCM Token:', currentToken);
        if (currentToken) {
          console.log('FCM Token:', currentToken);

          // Send the token to the server
          await fetch('http://localhost:9001/api/v1/notification/register', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              "jwtToken": localStorage.getItem("jwtToken"),
              "username": localStorage.getItem("username"),
              "role": localStorage.getItem("role")
            },
            body: JSON.stringify({ token: currentToken })
          });

          // Update modal message
          modalBody.innerHTML = "푸쉬 알림 설정이 '허용'되었습니다. <br> 알림을 중단하려면, 브라우저 설정에서 푸쉬 알림 설정을 '차단'으로 변경하세요.";
          notificationBtn.style.display = 'none';
        } else {
          console.log('No registration token available. Request permission to generate one.');
        }
      }
    } else if (permission === 'denied') {
      // Update modal message if permission is denied
      modalBody.innerHTML = "푸쉬 알림 설정이 '차단'되었습니다. <br> 알림을 받으려면, 브라우저 설정에서 푸쉬 알림 설정을 '허용'으로 변경하세요.";
      notificationBtn.style.display = 'none';
    }
  } catch (err) {
    console.log('Unable to get permission to notify.', err);
  }
};
// Handle incoming messages
onMessage(messaging, (payload) => {
  console.log('Message received. ', payload);
  // Customize notification here
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: '/img/logo.png'
  };
new Notification(notificationTitle, notificationOptions);
});

