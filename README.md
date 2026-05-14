# Task Manager App

A clean, modern, and fully functional Task Management (ToDo) application built with Flutter. This application allows users to efficiently manage their daily tasks with a beautiful dark-themed user interface and robust state management.

## 📱 Screenshots

<p align="center">
  <img src="assets/Todo App.jpg" alt="App Screenshots" width="80%"/>
</p>

## ✨ Features

- **Task Management**: Create, read, update, and delete (CRUD) tasks effortlessly.
- **Status Tracking**: Mark tasks as "Pending" or "Completed".
- **State Management**: Built using **BLoC (Business Logic Component)** for scalable and predictable state management.
- **Modern UI**: A sleek dark mode interface with elegant green accents and smooth interactions.
- **Responsive Layout**: Designed to work seamlessly across different mobile screen sizes.

## 🛠️ Technology Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)
- **Value Equality**: [`equatable`](https://pub.dev/packages/equatable)
- **Unique Identifiers**: [`uuid`](https://pub.dev/packages/uuid)

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

- Flutter SDK installed on your machine: [Install Flutter](https://docs.flutter.dev/get-started/install)
- An IDE such as VS Code or Android Studio.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd your-repo-name
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## 📂 Project Structure

The project follows the **MVC (Model-View-Controller)** design pattern for a clean separation of concerns.

```text
lib/
├── models/           # Data models (e.g., Task model)
├── views/            # UI screens and widgets (Home, Add Task, etc.)
├── controller/       # BLoC controllers managing business logic & state
└── main.dart         # Application entry point
```

## 👨‍💻 Author

**Hadi Heikal**

- GitHub: [@HadiHeikal](https://github.com/HadiHeikal)
