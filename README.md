# 🗳 Secure Voting App TrustEvo

A secure, Aadhaar-based digital voting application built with Flutter and Firebase. This mini project demonstrates a complete end-to-end voting system with authentication, vote locking, and real-time data management.

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Firestore-FFCA28?logo=firebase)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📱 Project Overview

This mini project is a prototype for a secure digital voting system that ensures:
- *One voter, one vote* - Prevents double voting
- *Aadhaar-based authentication* - Verifies voter identity
- *OTP verification* - Adds an extra security layer
- *Local vote locking* - Uses SharedPreferences to lock the app after voting
- *Real-time updates* - Firebase Firestore for instant vote recording

## ✨ Features

- ✅ *Splash Screen* with automatic vote status detection
- ✅ *Aadhaar Verification* from Firebase Firestore
- ✅ *OTP Authentication* (currently test mode)
- ✅ *Election Status Check* before allowing voting
- ✅ *Candidate Selection* with intuitive UI
- ✅ *Vote Confirmation* screen with warning
- ✅ *Atomic Vote Recording* to prevent race conditions
- ✅ *Success Screen* with confetti animation
- ✅ *App Lock* after voting - prevents re-voting
- ✅ *Already Voted Screen* for users who have already cast their vote

## 🎥 Demo

### App Flow

Splash Screen → Login (Aadhaar) → OTP Verification → 
Voting Screen → Confirmation → Success → App Lock

## 🏗 Architecture

### Tech Stack
- *Frontend:* Flutter (Dart)
- *Backend:* Firebase Firestore
- *Local Storage:* SharedPreferences
- *Authentication:* Custom OTP system (test mode)

### Project Structure

lib/
├── main.dart                    # App entry point
├── screens/
│   ├── splash_screen.dart       # Initial loading screen
│   ├── already_voted_screen.dart # Locked state after voting
│   ├── login_screen.dart        # Aadhaar verification
│   ├── otp_verification_screen.dart # OTP input
│   ├── voting_screen.dart       # Candidate selection
│   ├── confirmation_screen.dart # Vote confirmation
│   └── success_screen.dart      # Success with confetti
└── services/
    └── auth_service.dart        # OTP generation & verification


### Firebase Firestore Structure

├── voters/
│   └── {aadhaarNumber}/
│       ├── name: string
│       ├── phoneNumber: string
│       ├── hasVoted: boolean
│       └── votedAt: timestamp
│
├── candidates/
│   └── {candidateId}/
│       ├── name: string
│       ├── party: string
│       ├── symbol: string
│       └── votes: number
│
└── settings/
    └── election/
        └── isActive: boolean


## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Firebase account
- Android Studio / VS Code
- Git

### Installation

1. *Clone the repository*
   bash
   git clone https://github.com/mzaidiii/Trust-Evo
   cd secure-voting-app
   

2. *Install dependencies*
   bash
   flutter pub get
   

3. *Configure Firebase*
   - Create a new Firebase project
   - Add Android/iOS app in Firebase Console
   - Download google-services.json (Android) and GoogleService-Info.plist (iOS)
   - Place them in respective directories

4. *Setup Firestore*
   - Enable Firestore Database in Firebase Console
   - Update security rules (see below)
   - Add sample data (see [Setup Guide](#firestore-setup))

5. *Run the app*
   bash
   flutter run
   

## 🔥 Firestore Setup

### Security Rules (For Testing)
javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /voters/{voterId} {
      allow read, update: if true;
    }
    match /candidates/{candidateId} {
      allow read, update: if true;
    }
    match /settings/{settingId} {
      allow read: if true;
    }
  }
}


### Sample Data

*Add a test voter:*

Collection: voters
Document ID: 123456789012
Fields:
  - name: "Test User"
  - phoneNumber: "+919876543210"
  - hasVoted: false
  - votedAt: null


*Add test candidates:*

Collection: candidates
Document 1:
  - name: "Alice Johnson"
  - party: "Progressive Party"
  - symbol: "🌟"
  - votes: 0

Document 2:
  - name: "Bob Smith"
  - party: "United Front"
  - symbol: "🔥"
  - votes: 0


*Enable election:*

Collection: settings
Document ID: election
Fields:
  - isActive: true


## 🧪 Testing

### Test Flow
1. Launch the app
2. Enter test Aadhaar: 123456789012
3. Check console/snackbar for OTP
4. Enter the OTP
5. Select a candidate and vote
6. Observe success screen
7. Restart app - should show "Already Voted"

### Reset for Re-testing
- Click *"Reset (Dev Only)"* button on Already Voted screen
- Or clear app data from device settings
- Reset hasVoted: false in Firestore

## 📦 Dependencies

yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.24.2
  cloud_firestore: ^4.14.0
  shared_preferences: ^2.2.2
  confetti: ^0.7.0


## 🔐 Security Considerations

### Current Implementation (Development)
⚠ This is a *mini project/prototype* for demonstration purposes:
- OTP is printed to console (not sent via SMS)
- Firestore rules are open for testing
- No encryption on vote data

### For Production Use
Before deploying to production, implement:
- ✅ Real SMS gateway integration (Twilio, AWS SNS)
- ✅ Firebase Phone Authentication
- ✅ Stricter Firestore security rules
- ✅ End-to-end encryption for sensitive data
- ✅ Admin authentication for data management
- ✅ Vote receipt generation with cryptographic hash
- ✅ Audit logging for all operations
- ✅ Rate limiting to prevent abuse

## 🎯 Future Enhancements

- [ ] Real SMS OTP integration
- [ ] Biometric authentication (fingerprint/face)
- [ ] Admin dashboard for election management
- [ ] Results screen with live vote counts
- [ ] Vote verification receipt
- [ ] Multi-language support
- [ ] Offline voting with sync
- [ ] Push notifications
- [ ] Advanced analytics
- [ ] Blockchain integration for transparency

## 📝 Project Goals

This mini project demonstrates:
- Clean Flutter architecture
- Firebase Firestore integration
- State management with setState
- Form validation and user input handling
- Navigation and routing
- Local data persistence
- Atomic database transactions
- User authentication flow
- Responsive UI design
- Error handling

## 🤝 Contributing

This is a mini project for educational purposes. Feel free to fork and experiment!

1. Fork the repository
2. Create a feature branch (git checkout -b feature/AmazingFeature)
3. Commit your changes (git commit -m 'Add some AmazingFeature')
4. Push to the branch (git push origin feature/AmazingFeature)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

*Your Name*
- GitHub: [mzaidiii](https://github.com/mzaidiii/mzaidiii.git)
- LinkedIn: [Mohd murtaza Zaidi](www.linkedin.com/in/mohd-murtaza-zaidi-b18a5b294)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Confetti package for animations
- All open-source contributors

## 📧 Contact

For questions or feedback, please open an issue or reach out at: mohdmurtaza153@gmail.com

---

⭐ *Star this repository* if you found it helpful!

---

*Note:* This is a mini project created for educational and demonstration purposes. It is not recommended for production use without proper security enhancements and SMS integration.

