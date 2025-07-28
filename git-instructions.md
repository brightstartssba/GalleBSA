# Hướng dẫn giải quyết Git conflict

## Vấn đề hiện tại:
- Local branch ahead 18 commits
- Remote có changes mới
- Non-fast-forward conflict

## Giải pháp:

### Bước 1: Pull và merge
```bash
git pull origin main --no-rebase
```

### Bước 2: Nếu có conflict, resolve manually
```bash
git status
# Xem files bị conflict
# Edit files để resolve conflict
git add .
git commit -m "Resolve merge conflicts"
```

### Bước 3: Push
```bash
git push origin main
```

### Phương án thay thế: Force push (NGUY HIỂM)
Chỉ dùng nếu bạn chắc chắn muốn override remote:
```bash
git push --force origin main
```

## Files đã được sửa để fix Codemagic build:
- android/app/build.gradle
- android/settings.gradle  
- android/gradle.properties
- codemagic.yaml (mới)

Những thay đổi này sẽ fix lỗi "app_plugin_loader Gradle plugin imperatively".