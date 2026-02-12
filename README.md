# Tic Tac Toe 🎮

A fun and simple **Tic Tac Toe** game built with **Flutter** — perfect for learning state management and UI with Flutter widgets!

---

## 🧠 About

This project is a classic Tic Tac Toe game where:

- Two players (O and X) take turns
- Board is 3×3 grid
- The game checks for winners or a draw
- Scores are tracked
- Stylish fonts using `google_fonts` package

---

## 📸 Screenshots
<p align="center">
  <img src="https://github.com/user-attachments/assets/c18c78b1-4f1e-46cb-bb34-ba7b2fa0e473" width="300"/>
  <img src="https://github.com/user-attachments/assets/9c559aa3-c6ea-438e-876d-c0d2be546ef9" width="300"/> 
</p>

---

## 🚀 Features

✔ Two-player gameplay  
✔ Winner detection (rows, columns, diagonals)  
✔ Score tracking  
✔ Draw state detection  
✔ Custom retro fonts  
✔ Displays an image/logo under title

---

## 📦 Tech Stack

- **Flutter**  
- **Dart**  
- **Google Fonts** (`pressStart2p`)  
- (Optional) Other plugins like `avatar_glow`

---

## 📁 Project Structure

```

tic_tac_toe/
├─ lib/
│   ├─ Pages/
│   │   └─ home_page.dart
│   └─ main.dart
├─ assets/
│   └─ tictactoelogo.png
├─ pubspec.yaml
└─ README.md

````

---

## 📌 Getting Started

### 🔹 Prerequisites

Make sure you have:

- Flutter SDK installed v3.x+
- An IDE (VS Code / Android Studio)
- Device or emulator to run the app

---

### 🔹 Installation

1. Clone the repo

```bash
git clone https://github.com/HAMYL-Aththnayaka/tic_tac_toe.git
cd tic_tac_toe
````

2. Get dependencies

```bash
flutter pub get
```

3. Run the app

```bash
flutter run
```

---

## 🎯 How to Play

* Tap a grid space to place **O** or **X**
* Players alternate turns
* First to connect 3 wins
* If all boxes fill without win → Draw
* Tap *Reset* to restart

---

## 🛠 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  avatar_glow: any
```

---

## 📌 Notes

If your asset image fails to load, ensure your `pubspec.yaml` has the correct indentation:

```yaml
flutter:
  uses-material-design: true

  assets:
    - assets/tictactoelogo.png
```

Then run:

```bash
flutter clean
flutter pub get
```

---

## 🙌 Contributing

Feel free to:

* Improve UI
* Add sound effects
* Add AI player
* Add animations

---

## 📜 License

This project is **open source**, feel free to use and modify it!

---

## ❤️ Thanks for checking it out!

Happy coding! 🚀😍


