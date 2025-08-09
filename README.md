# 📚 Flutter AdMob Integration App

A simple and clean Flutter application showcasing the integration of **Google AdMob ads** (Banner, Interstitial, and App Open Ads) across multiple screens. The app contains **5 screens** — including a Login screen and 4 simple navigation screens — where ads are strategically displayed to demonstrate real-world ad placement in Flutter apps.

---

## 🚀 Features

- 👤 **Login Screen** to access the app
- 📜 **4 Simple Navigation Screens** to demonstrate ad placement
- 📢 **Google AdMob Integration**  
  - 📌 **Banner Ads** on selected screens  
  - 🎯 **Interstitial Ads** triggered on navigation  
  - 🚪 **App Open Ads** shown when the app launches or resumes  
- 🔄 Smooth screen navigation using `Navigator`
- 📱 Fully responsive design for all devices

---

## 🛠️ Tech Stack

| Component         | Technology          |
|------------------|---------------------|
| Frontend         | Flutter (Dart)      |
| Ads Integration  | Google AdMob        |
| State Management | setState / basic navigation |
| Styling          | Flutter widgets     |

---

## 📢 Ad Implementation Flow

1. **Banner Ads**:
   - Displayed persistently at the bottom of selected screens.
   - Uses `BannerAd` from `google_mobile_ads` package.
   
2. **Interstitial Ads**:
   - Loaded in advance to show during navigation events.
   - Triggered when moving from one screen to another.

3. **App Open Ads**:
   - Displayed when the app starts or resumes from the background.
   - Ensures better user engagement right at app entry.

4. **AdMob App ID & Ad Unit IDs**:
   - Configured for Android/iOS in `AndroidManifest.xml` & `Info.plist`.
   - Uses test ads during development.

---

## 📷 UI Overview

| Screen          | Description                                      |
|----------------|--------------------------------------------------|
| LoginView(Screen1)      | Simple login screen to enter the app              |
| HomeScreen(Screen2)     | Displays a banner ad and navigates to other pages |
| Screen3        | Simple content + banner ad                        |
| Screen4        | Shows interstitial ad when accessed               |
| Screen5        | Final screen with static content & ad integration |

---

## 📽️ Demo Videos

**🔹 Demo: App Overview**  
[Watch Demo](https://drive.google.com/file/d/1Q0_TTSJFaML1NM8ydN0-oaLKlmTEcpbG/view?usp=drivesdk)
