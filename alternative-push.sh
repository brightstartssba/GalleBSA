#!/bin/bash

echo "⚠️  Alternative: Force push (sử dụng cẩn thận!)"
echo "================================================"

echo "🔄 This will OVERRIDE remote changes"
read -p "Bạn có chắc chắn muốn force push không? (y/N): " confirm

if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo "💪 Force pushing..."
    git push --force origin main
    echo "✅ Force push completed!"
    echo "🚀 Bây giờ có thể chạy Codemagic build!"
else
    echo "❌ Cancelled. Sử dụng script fix-git-push.sh thay thế."
fi