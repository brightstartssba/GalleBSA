#!/bin/bash

echo "🔧 Script để fix Git push conflict"
echo "=================================="

# Kiểm tra trạng thái
echo "📊 Kiểm tra Git status..."
git status

echo ""
echo "📥 Fetching latest changes từ remote..."
git fetch origin

echo ""
echo "🔀 Attempting merge với remote changes..."
git pull origin main --no-rebase --allow-unrelated-histories

echo ""
echo "📤 Pushing changes lên GitHub..."
git push origin main

echo ""
echo "✅ Hoàn thành! Kiểm tra GitHub để confirm."
echo "🚀 Bây giờ có thể chạy Codemagic build!"