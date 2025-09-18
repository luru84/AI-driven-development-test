# AI-driven Development Starter

最小構成の AI 駆動開発テンプレート。  
Python + Makefile + pytest + GitHub Actions（CI）を含む“動く雛形”です。

- src 配下にパッケージ（`yourpkg`）
- tests 配下に最小テスト
- docs 配下にドキュメントの置き場
- CI は black / isort /（flake8 は任意）/ pytest を実行  
  ※ いまは `flake8` をスキップして運用可能（後述）

---

## 目次
- [前提](#前提)
- [クイックスタート](#クイックスタート)
- [プロジェクト構成](#プロジェクト構成)
- [Make コマンド](#make-コマンド)
- [ローカル実行](#ローカル実行)
- [テスト](#テスト)
- [CI について](#ci-について)
- [この雛形を別リポに展開する方法](#この雛形を別リポに展開する方法)
  - [A) Template Repository として使う（推奨）](#a-template-repository-として使う推奨)
  - [B) GitHub CLI でテンプレ展開](#b-github-cli-でテンプレ展開)
  - [C) 手動コピー](#c-手動コピー)
- [開発フロー：ブランチ作成 → PR → マージ → 後始末](#開発フローブランチ作成--pr--マージ--後始末)
- [運用ノート](#運用ノート)
- [ライセンス](#ライセンス)

---

## 前提
- macOS / Linux（Windows の場合は WSL 推奨）
- Python 3.11 付近（CI は 3.11 で動作）
- Git / GitHub アカウント
- 任意：GitHub CLI（`gh`）

---

## クイックスタート
```bash
make setup   # venv 作成 + 依存インストール
make run     # yourpkg を起動
make test    # pytest 実行

## プロジェクト構成
.
├─ src/yourpkg/           # パッケージ本体
│  ├─ __init__.py
│  └─ __main__.py         # エントリポイント
├─ tests/                 # pytest
│  └─ test_main_exists.py
├─ docs/                  # 仕様・評価・用語など
│  └─ ARCHITECTURE.md
├─ .github/workflows/ci.yml
├─ Makefile
├─ requirements.txt
├─ requirements-dev.txt
└─ README.md

## Makeコマンド
make setup   # venv作成 + 依存インストール
make run     # yourpkg を起動（__main__.py）
make test    # pytest -q
make fmt     # black + isort で整形
make lint    # flake8（必要に応じて運用）
make clean   # キャッシュ掃除

make run     # => hello from yourpkg などの出力
make test
