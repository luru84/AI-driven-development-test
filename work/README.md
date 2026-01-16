# Work area

生成物や一時ファイルを置く作業用ディレクトリです。セッションごとにサブディレクトリを切って使うことを想定しています。

例:
```
work/2025-01-01-1300/
  artifacts/step1.md
  checks.log
```

リポジトリには `work/.gitkeep` のみコミットされ、それ以外は `.gitignore` で除外されます。
