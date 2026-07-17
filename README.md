# Note & Task Manager App 🚀

A professional Note and Task Management application built using **Flutter** and **Dart**, following the strict guidelines of **Clean Architecture** and clean code principles.

---

## 📱 Project Demo

### 🎬 Video Walkthrough
Here is a quick video demo showing the application flow, animations, and architecture implementation:



https://github.com/user-attachments/assets/66b240e1-ad41-4df6-b0bb-57dadfb8d301




> 💡 *If the video does not load, you can check the recorded demo directly in the assets/demo folder.*

---

## 🌿 Git Branching Strategy & Screen Mapping

To maintain clean version control, every feature and screen is developed in its own isolated branch before being merged into `main`.

| Screen / Feature | Git Branch Name | Main Entry File | Status |
| :--- | :--- | :--- | :--- |
| **Animated Splash Screen** | `feature/splash-screen` | `lib/feature/splash_screen/views/splash_screen.dart` | ✅ Completed |
| **Create Profile (Onboarding)** | `feature/create-profile` | `lib/feature/create_profile/presentation/pages/create_profile.dart` | ✅ Completed |
| **Home Screen (Task Dashboard)** | `feature/home-screen` | `lib/feature/home/pages/home_screen.dart` | ✅ Completed |
| **Add Task Screen** | `feature/add-task` | `lib/feature/home/pages/add_task.dart` | ✅ Completed |
| **Add Hive Local Storage** | `feature/add-task` | `lib/feature/home/pages/add_task.dart` | ✅ Completed |

---

---

## 🏗️ Architecture & Folder Structure

The project strictly follows **Clean Architecture**, separating the presentation layer, business rules, and data sources to ensure high scalability and easy testability.

```text
lib/
│
├── core/                           # Shared utilities, constants, global services & styles
│   ├── colors/                     # Global color palettes (app_colors.dart, add_task_colors.dart)
│   └── styles/                     # Typography & global text styles
│
└── feature/                        # Feature-driven modules
    ├── splash/                     # Splash feature with Lottie JSON animation
    │
    ├── create_profile/             # Profile setup onboarding feature
    │   └── presentation/           # Pages & custom domain-specific widgets
    │
    └── home/                       # Core feature (Task/Note Management)
        ├── data/                   # Data Layer
        │   ├── model/              # Decoupled Data Models (TaskModel)
        │   ├── repo/               # Contracts & Repository Implementations
        │   └── use_case/           # Domain/Business Logic Units (GetTodayTasksUseCase)
        │
        └── presentation/           # UI Layer
            ├── pages/              # Main Screens (home_screen.dart, add_task.dart)
            └── widgets/            # Dumb UI Components for modularity (task_card, status_dropdown)
