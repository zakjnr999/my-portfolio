#!/bin/bash

# Flutter Portfolio Deployment Script
# This script builds your Flutter web app for production

echo "🚀 Starting Flutter Web Build..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build for web (production)
echo "🔨 Building for web (release mode)..."
flutter build web --release --web-renderer canvaskit

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Build completed successfully!"
    echo "📁 Build output is in: build/web/"
    echo ""
    echo "📋 Next steps:"
    echo "1. Commit the build/web folder to your repo"
    echo "2. Push to GitHub"
    echo "3. Deploy to Render as a static site pointing to build/web"
    echo ""
    echo "Or run: git add build/web && git commit -m 'Deploy build' && git push"
else
    echo "❌ Build failed! Please check the errors above."
    exit 1
fi
