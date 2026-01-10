# 🚀 Quick Deploy Guide

## Step 1: Build Your Portfolio
```bash
./deploy.sh
```

## Step 2: Commit the Build
```bash
git add build/web
git commit -m "Production build for deployment"
git push origin main
```

## Step 3: Deploy to Render

1. Go to https://dashboard.render.com/
2. Click **New +** → **Static Site**
3. Connect your GitHub repo
4. Configure:
   - **Publish Directory**: `build/web`
   - **Build Command**: (leave empty)
5. Click **Create Static Site**

## ✅ Done!

Your portfolio will be live at: `https://your-site-name.onrender.com`

---

## 🔄 To Update Later:
```bash
./deploy.sh
git add build/web
git commit -m "Update"
git push
```

Render will auto-deploy! 🎉
