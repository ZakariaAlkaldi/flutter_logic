# Flutter Logic

Flutter Logic is a small Flutter demo app that showcases multiple UI patterns and media picker interactions in one project. The app uses a simple `PageView` navigation flow and lets the user move between different example screens with the Next and Back controls.

## Project purpose

This project is mainly a learning and UI demonstration app. It covers:

- single-item selection
- multi-item selection
- toggle/follow actions
- image picker and preview
- multi-image picker
- video picker and playback
- file picker with open / change / delete actions

## Main screens

### 1. Single Selection

A grid of animal cards where the user can choose only one item at a time. The selected item is highlighted and shows a `Send` button style card.

### 2. Multi Image Select

A preview screen with a large selected image and a horizontal list of thumbnails. Tapping any thumbnail updates the main preview.

### 3. Toggle Selection

A profile-style screen with an avatar and a floating action button. Pressing the button toggles the follow state between add and checked icons.

### 4. Multi Selection

A category selection screen using clickable chips. The user can select multiple categories, and each selected category receives a check mark indicator.

### 5. Upload Image

A gallery image picker demo. The user can select an image, see it in a preview box, replace it, or remove it.

### 6. Upload Multi Images

A multi-image upload example. The screen shows three preview slots and allows the user to pick up to three images at once.

### 7. Upload Video

A video picker demo using `video_player`. The user can select a video from the gallery and watch it inside the app.

### 8. Upload File

A file upload screen using `file_picker`. It supports `pdf`, `docx`, and `doc` files. The user can upload, view, replace, and delete the selected file.

## App structure

- `lib/main.dart` — app entry point
- `lib/root.dart` — page navigation and the bottom navigation flow between screens
- `lib/screens/` — all screen implementations

## Technologies used

- Flutter
- Material Design widgets
- `image_picker`
- `video_player`
- `file_picker`
- `open_file`
- `flutter_svg`

## Run the project

1. Install dependencies:
   ```bash
   flutter pub get
   ```
2. Start the app:
   ```bash
   flutter run
   ```

## Notes

This app is a UI practice project and demonstrates how to implement common selection and media upload patterns in Flutter.
