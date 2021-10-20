# ProjectX Customer Mobile App

A marketplace app that connects vendors to their customers. This project is built with Flutter.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

The project uses flutter's [null-safety feature](https://dart.dev/null-safety); this means you must ensure any package you're adding supports it.

If you're given a feature to work on, kindly create a new branch using the format `feat/[insert-feature-name]`

## Getting Started

This project is a starting point for a Flutter application.

- Clone the repo
- Run `flutter pub get` to install dependencies
- Start building your app

# Running & Building
To run, use the following command:
- Development: flutter run
- Production: flutter run --release

To build a release build, use the following command:
- Android: flutter build apk
- iOS: flutter build ios

To build a debug build, add the parameter --debug to a command above.

# Deployment
- Push to your branch
- Open a PR to the `staging/main` branch and wait (or merge yourself)
- Once it's merged, visit [codemagic](https://codemagic.io) to download android and ios apk

# Test
- run `flutter test`
