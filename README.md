# Random Dog App

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Dio-00A98F?style=for-the-badge" alt="Dio" />
</p>

A small Flutter application that displays random dog images using the [Dog CEO API](https://dog.ceo/dog-api/). Users can load another image whenever they want.

## Features

- Request a random dog image from the Dog CEO API.
- Display the returned image in the app.
- Load another random dog with the refresh button.
- Show a loading indicator while a request is in progress.
- Handle request errors with an in-app message.
- Animate image changes with Flutter's AnimatedSwitcher.

## Technology Stack

| Technology | Usage |
| --- | --- |
| Flutter & Dart | Mobile application UI and logic |
| Dio | HTTP request handling |
| Dog CEO API | Random dog image source |

## Getting Started

### Requirements

- Flutter SDK
- Dart SDK compatible with the project's `pubspec.yaml`
- Android Studio, VS Code, or another Flutter-supported IDE

### Run locally

```bash
git clone https://github.com/elghamry55/dog_api.git
cd dog_api
flutter pub get
flutter run
```

## API

The app uses the random image endpoint:

```
https://dog.ceo/api/breeds/image/random
```

## Developer

**Mahmoud Elghamry** · Flutter Developer
