# Flutter Logic

Flutter Logic is a Flutter demo application that combines several interactive UI examples in one app. It uses a simple page-based navigation flow to move through multiple screens that demonstrate selection patterns and media upload actions.

## What this project includes

The app currently contains eight demo screens:

- Single selection: choose one item from a grid of animal cards
- Multi image selection: preview a selected image and switch between thumbnails
- Toggle/follow interaction: toggle a follow state with a button
- Multi selection: choose several options using selectable chips
- Upload image: pick an image from the gallery and preview it
- Upload multiple images: select up to three images and preview them
- Upload video: pick a video and play it inside the app
- Upload file: choose supported files such as PDF, DOCX, and DOC, then view or replace them

## App structure

- lib/main.dart — app entry point
- lib/root.dart — main page navigation flow with previous/next screen controls
- lib/screens/ — all demo screen implementations

## Main technologies

This project uses:

- Flutter
- Material Design widgets
- image_picker for image selection
- video_player for video playback
- file_picker for file selection
- open_file for opening selected files
- flutter_svg for SVG assets
- syncfusion_flutter_pdfviewer for PDF preview

## Requirements

- Flutter SDK: ^3.11.4
- Dependencies are managed through pubspec.yaml

## Run the project

1. Install dependencies:
   ```bash
   flutter pub get
   ```
2. Run the app:
   ```bash
   flutter run
   ```

## Notes

This project is mainly a UI learning and practice app focused on common Flutter interactions, media handling, and reusable screen patterns.
