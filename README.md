# 📚 Bookly App

Bookly is a modern Flutter application for discovering, searching, and reviewing books. It features a clean architecture, robust state management, and a seamless user experience.

## 🎥 App Demo

Watch the app in action:  
[▶️ app_video/app_video.mp4](https://github.com/Ahmed-Elmekawy/Bookly_App/raw/refs/heads/master/app_video/app_video.mp4)

---

## ✨ Core Features

- 🏠 **Home**: Browse bestsellers and newest books.
- 🔍 **Search**: Find books by title, author, or keyword.
- 📖 **Book Details**: View detailed info and reviews for each book.
- 🛒 **Cart & Payment**: Add books to cart and pay securely (Stripe, PayPal).

---

## 🚀 Technical Stack

| Component         | Technology                   |
|-------------------|------------------------------|
| Framework         | Flutter                      |
| Architecture      | MVVM                         |
| State Management  | flutter_bloc, Cubit          |
| Networking        | Dio                          |
| Payment           | Stripe, PayPal               |
| Dependency Inject | get_it                       |
| Functional Prog.  | dartz                        |
| Routing           | go_router                    |
| UI                | Material Design, flutter_svg |

---

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── config/         # Theme, colors, app config
│   ├── di/             # Dependency injection
│   ├── errors/         # Error handling
│   ├── models/         # Data models
│   ├── utils/          # Utilities (API, Stripe, etc.)
│   └── widgets/        # Reusable widgets
├── features/
│   ├── home/           # Home screen (browsing)
│   ├── search/         # Search functionality
│   ├── book_details/   # Book details & reviews
│   ├── payment/        # Cart & payment
│   └── splash/         # Splash screen
├── main.dart           # App entry point
└── pubspec.yaml        # Dependencies
```

---

## 📦 Key Dependencies

- flutter_bloc, equatable, dartz, get_it
- dio, go_router, flutter_stripe, flutter_paypal_payment

---

## 🚀 Getting Started

**Prerequisites:**
- Flutter SDK 3.0.6+
- Dart 3.0.6+
- Stripe/PayPal setup for payments

**Installation:**
```sh
git clone <your-repo-url>
cd bookly
flutter pub get
```

**Run the app:**
```sh
flutter run
```

**Build for release:**
```sh
flutter build apk --release
# or
flutter build ios --release
```

---
