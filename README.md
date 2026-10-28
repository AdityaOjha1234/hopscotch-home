# Hopscotch Home (Flutter Web)

Live demo: https://adityaojha1234.github.io/hopscotch-home/



A Flutter implementation of a Hopscotch-style kids fashion **homepage only** (header with search and cart,
category nav, auto-sliding banner, shop-by-category, trending and new-arrival product rows, footer).
It uses dummy data and placeholder icons instead of real product images.

## Prerequisites

- Flutter SDK 3.10 or newer (Dart 3), see https://docs.flutter.dev/get-started/install
- Google Chrome (to run and test the web build)

Check your setup:

```bash
flutter doctor
```

## Setup (first time)

1. Open a terminal in the project folder (the one containing `pubspec.yaml`).
2. Generate the web platform files (this repo only contains the Dart code):

   ```bash
   flutter create . --platforms=web --project-name hopscotch_home
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

## Run locally

```bash
flutter run -d chrome
```

## Build for production

```bash
flutter build web --release
```

The output is in `build/web/`.

## Deploy

Pick any one option.

### Option A: Netlify (easiest, no CLI)

1. Run `flutter build web --release`.
2. Open https://app.netlify.com/drop and drag the `build/web` folder in.
3. Netlify gives you a live URL.

### Option B: Firebase Hosting

```bash
npm install -g firebase-tools
firebase login
firebase init hosting     # public directory: build/web, single-page app: Yes
flutter build web --release
firebase deploy
```

### Option C: GitHub Pages

```bash
flutter build web --release --base-href "/<your-repo-name>/"
```

Push the contents of `build/web` to a `gh-pages` branch, then enable Pages for that branch
in the repository Settings.

## Project structure

```
lib/
  main.dart         app entry, theme, scroll behaviour
  theme.dart        brand colours
  dummy_data.dart   models plus dummy banners, categories and products
  home_page.dart    header, nav bar, banner carousel, category grid, product rows, footer
```

## Notes

- Layout is responsive: content is capped at 1200 px wide, banner height and the Help link adapt to screen width.
- Product images are placeholders (coloured boxes with icons). To use real images, add `Image.network(...)`
  inside `ProductCard`.
- Only the homepage is implemented, as required.
