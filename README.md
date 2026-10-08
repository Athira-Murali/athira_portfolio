# Athira SM — Portfolio

A responsive Flutter Web portfolio showcasing my work, experience, and skills.

## Run locally

```sh
flutter pub get
flutter run -d chrome
```

## Publish the portfolio

This repository includes a GitHub Pages workflow. To get a public link:

1. Create a GitHub repository and push this project to its `main` branch.
2. On GitHub, open **Settings → Pages**.
3. Under **Build and deployment**, set **Source** to **GitHub Actions**.
4. Open the **Actions** tab and wait for **Deploy portfolio to GitHub Pages** to finish.

The public URL will be:

```text
https://YOUR-GITHUB-USERNAME.github.io/YOUR-REPOSITORY-NAME/
```

Every later push to `main` automatically republishes the website. Add the public
URL to the contact/header section of the résumé, preferably as a clickable
**Portfolio** link.

## Build manually

```sh
flutter build web --release
```

The generated static website is placed in `build/web/` and can also be uploaded
to Netlify, Cloudflare Pages, Firebase Hosting, or another static host.
