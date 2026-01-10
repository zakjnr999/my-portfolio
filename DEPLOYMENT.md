# 🚀 Deployment Guide - Flutter Portfolio

This guide will help you deploy your Flutter portfolio to Render.

## 📋 Prerequisites

- Flutter SDK installed
- Git repository set up
- Render account created

## 🔨 Build Your Portfolio

### Option 1: Using the Deployment Script (Recommended)

```bash
# Make the script executable
chmod +x deploy.sh

# Run the deployment script
./deploy.sh
```

### Option 2: Manual Build

```bash
# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Build for web
flutter build web --release --web-renderer canvaskit
```

## 🌐 Deploy to Render

### Method 1: Static Site (Easiest)

1. **Build your app locally** (using one of the methods above)

2. **Commit the build folder:**
   ```bash
   git add build/web
   git commit -m "Add production build"
   git push origin main
   ```

3. **Create a new Static Site on Render:**
   - Go to [Render Dashboard](https://dashboard.render.com/)
   - Click "New +" → "Static Site"
   - Connect your GitHub repository
   - Configure:
     - **Name**: `my-portfolio` (or your preferred name)
     - **Branch**: `main`
     - **Build Command**: Leave empty (we're using pre-built files)
     - **Publish Directory**: `build/web`
   - Click "Create Static Site"

4. **Wait for deployment** - Render will deploy your site!

### Method 2: Using a Separate Deploy Branch

1. **Build locally:**
   ```bash
   flutter build web --release
   ```

2. **Create a deploy branch:**
   ```bash
   git checkout -b deploy
   git add -f build/web
   git commit -m "Production build"
   git push origin deploy
   ```

3. **On Render:**
   - Set **Branch** to `deploy`
   - Set **Publish Directory** to `build/web`

## 🔄 Updating Your Portfolio

Whenever you make changes:

```bash
# 1. Build the updated version
./deploy.sh

# 2. Commit and push
git add build/web
git commit -m "Update portfolio"
git push origin main

# Render will automatically redeploy!
```

## ⚙️ Configuration

### Base URL Configuration

If deploying to a subdirectory, update `web/index.html`:

```html
<base href="/your-subdirectory/">
```

For root domain deployment (recommended), keep:
```html
<base href="/">
```

## 🐛 Troubleshooting

### Build fails
- Run `flutter doctor` to check your Flutter installation
- Run `flutter clean` and try again
- Check that all dependencies are installed: `flutter pub get`

### Assets not loading
- Ensure `pubspec.yaml` has all assets listed
- Rebuild: `flutter build web --release`
- Check browser console for 404 errors

### Blank page on Render
- Check that **Publish Directory** is set to `build/web`
- Verify `index.html` exists in `build/web/`
- Check Render logs for errors

## 📱 Alternative Deployment Options

### GitHub Pages
```bash
# Build
flutter build web --release --base-href "/repository-name/"

# Deploy to gh-pages branch
git subtree push --prefix build/web origin gh-pages
```

### Netlify
- Drag and drop the `build/web` folder to Netlify
- Or connect your repo and set publish directory to `build/web`

### Vercel
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
cd build/web
vercel --prod
```

## 🎉 Your Portfolio is Live!

Once deployed, your portfolio will be accessible at:
- Render: `https://your-site-name.onrender.com`

## 📊 Performance Tips

- ✅ Use `--web-renderer canvaskit` for better performance
- ✅ Enable caching on Render
- ✅ Optimize images before adding to assets
- ✅ Use lazy loading for heavy components

---

**Need help?** Check the [Flutter Web Deployment Docs](https://docs.flutter.dev/deployment/web)
