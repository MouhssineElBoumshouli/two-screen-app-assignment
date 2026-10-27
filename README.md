# Two-screen Flutter assignment

A small Flutter app for practicing Dart basics and mobile UI layout.

## What it does

- Shows a welcome screen with a username or email field.
- Rejects an empty submission with inline validation.
- Passes the trimmed username to an About screen.
- Uses Material 3, one seed color, `Column`, `Padding`, and a built-in icon.

## Run it

```powershell
flutter pub get
flutter run -d Pixel_7
```

Use `flutter devices` to list available device IDs.

## Verify it

Run the automated checks with:

```powershell
.\tool\verify.ps1
```

For the layout check, run the app on two available Android emulator profiles:

```powershell
flutter run -d Pixel_7
flutter run -d Recall_Test
```

On each emulator, submit an empty field, submit a username with surrounding spaces, open About, and press Back. Check that the content stays readable and that the submit button remains visible above the keyboard.

