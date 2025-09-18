# AI-driven Development Starter

最小構成の AI 駆動開発テンプレート。  
Python + Makefile + pytest + GitHub Actions（CI）を含む“動く雛形”です。

---

## 前提
- macOS / Linux（Windows は WSL 推奨）
- Python 3.11 付近（CI も 3.11 で動作）
- Git / GitHub アカウント
- 任意：GitHub CLI（`gh`）

---

## クイックスタート
make setup   # venv 作成 + 依存インストール
make run     # yourpkg を起動
make test    # pytest 実行

---

## プロジェクト構成
.
├─ src/yourpkg/           # パッケージ本体
│  ├─ __init__.py
│  └─ __main__.py         # エントリポイント
├─ tests/                 # pytest
│  └─ test_main_exists.py # __main__.py の main 関数が存在するか確認
├─ docs/                  # 仕様・評価・用語など
│  └─ ARCHITECTURE.md     # 1行アーキ図など
├─ .github/workflows/ci.yml  # GitHub Actions ワークフロー
├─ Makefile               # 開発コマンドをまとめた入口
├─ requirements.txt       # 本番依存
├─ requirements-dev.txt   # 開発用依存
└─ README.md

## Make コマンド
make setup   # venv作成 + 依存インストール
make run     # yourpkg を起動（__main__.py）
make test    # pytest -q
make fmt     # black + isort で整形
make lint    # flake8（必要に応じて運用）
make clean   # キャッシュ掃除

## ローカル実行
make run
# => hello from yourpkg

## テスト
make test

## サンプルテスト
import importlib

def test_main_callable():
    mod = importlib.import_module("yourpkg.__main__")
    assert hasattr(mod, "main")

## 開発フロー（ブランチ作成 → PR → マージ → 後始末）
### 0) 事前（任意）
brew install gh
gh auth login

### 1) ブランチ作成
git checkout -b feat/change-sample

### 2) 変更・実行
make run
make test

### 3) コミット
git add -A
git commit -m "feat: short description of the change"

### 4) push
git push -u origin feat/change-sample

### 5) PR 作成
ブラウザから「Compare & pull request」
または CLI:
gh pr create --title "feat: short description" \
             --body "変更概要/受け入れ基準/テスト観点/影響範囲"

### 6) レビュー & CI 確認
CI が green かを確認
コメントがあれば解消（Resolve）
### 7) マージ
Squash and merge 推奨

### 8) 後始末（ブランチ削除）
git checkout main
git pull
git branch -d feat/change-sample