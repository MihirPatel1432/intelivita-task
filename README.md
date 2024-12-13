# Flutter Chat App

This Flutter app demonstrates a basic chat application using Firebase as the backend. It includes essential features like user authentication, real-time messaging, and synchronization. Below are the key components and libraries used in this app.

## Core Features:
- **User Authentication:**
  - **Google Sign-In**: Integrated using the `google_sign_in` package for seamless Google authentication.
  - **Firebase Authentication**: Handles user authentication and backend user management for security.

- **Real-time Chat:**
  - **Firebase Firestore**: Used as the real-time database for storing and syncing chat messages, enabling efficient communication between users.

## Libraries Used:
- `firebase_core`: Core Firebase library required to initialize Firebase services in the app.
- `cloud_firestore`: Provides real-time database functionality for storing and synchronizing chat data.
- `firebase_auth`: Firebase Authentication service for user login, sign-up, and management.
- `google_sign_in`: Plugin for easy integration of Google Sign-In, allowing users to authenticate with their Google accounts.
