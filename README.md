# Unganisha WiFi — v0 Prototype (Frontend Only)

A Flutter frontend prototype for the Unganisha WiFi captive portal.
This version has **no backend** — all logic is simulated locally with
dummy services so the full UI flow can be reviewed and tested.

## Flow

Phone Number Screen → OTP Verification Screen → Plan List Screen → Subscription Status Screen

- Any phone number with 9+ digits is accepted.
- The only valid OTP is **1234**.
- Selecting a plan is stored in memory only (no payment, no persistence).

## Folder Structure

```
lib/
  main.dart                  # App entry point
  router.dart                 # GoRouter navigation graph
  models/
    plan.dart                 # Plan model + hard-coded plan catalogue
    app_state.dart             # Shared app state (Provider/ChangeNotifier)
  services/
    dummy_auth_service.dart    # Fake OTP send/verify (no real API calls)
  screens/
    phone_screen.dart
    otp_screen.dart
    plan_list_screen.dart
    subscription_status_screen.dart
  theme/
    app_theme.dart             # Unganisha brand colors + ThemeData
  widgets/
    responsive_screen_container.dart  # Shared responsive layout wrapper
web/
  index.html                  # Web entry point (for captive portal use)
```

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.22+ recommended)
- For Android: Android Studio + an emulator or physical device with USB debugging enabled
- Run `flutter doctor` to confirm your environment is set up correctly

## Setup

```bash
flutter pub get
```

## Running on Flutter Web

```bash
flutter run -d chrome
```

To build a production web bundle (e.g. for hosting behind a captive portal redirect):

```bash
flutter build web
```

Output will be in `build/web/` — this can be served by any static web server.

## Running on Android

1. Start an emulator or connect a physical device (`flutter devices` to confirm it's detected).
2. Run:

```bash
flutter run -d <device_id>
```

Or simply `flutter run` if only one device/emulator is active.

To build an APK:

```bash
flutter build apk --release
```

Output APK will be in `build/app/outputs/flutter-apk/app-release.apk`.

## Testing the Flow

1. Launch the app — you'll land on the **Phone Number Screen**.
2. Enter any phone number with at least 9 digits, tap **Get OTP**.
3. On the **OTP Screen**, enter `1234` and tap **Verify**.
4. On the **Plan List Screen**, tap **Select** on any plan.
5. You'll land on the **Subscription Status Screen** showing the selected plan and activation time.
6. Use **Change Plan** to go back to the plan list, or **Logout** to clear session data and return to the Phone Screen.

## Notes

- This is a **frontend-only** prototype. `DummyAuthService` and in-memory plan
  selection stand in for the real backend, which will be integrated in a later version.
- State (phone number, selected plan, activation time) is held in memory via
  `Provider`/`ChangeNotifier` (`AppState`) and is cleared on logout or app restart.
