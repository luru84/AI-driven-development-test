# AI-driven Development Starter

最小構成の AI 駆動開発テンプレート。Python、Makefile、pytest、GitHub Actions（CI）を含む“動く雛形”です。

---

## 前提
- macOS / Linux（Windows は WSL 推奨）
- Python 3.11 付近（CI も 3.11 で動作）
- Git / GitHub アカウント
- 任意：GitHub CLI（`gh`）

---

## クイックスタート
```bash
make setup   # venv 作成 + 依存インストール
make run     # yourpkg を起動
make test    # pytest 実行
```

---

## プロジェクト構成
```text
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
```

## Make コマンド
| コマンド | 説明 |
| --- | --- |
| `make setup` | venv 作成 + 依存インストール |
| `make run` | `yourpkg` を起動（`__main__.py`） |
| `make test` | `pytest -q` を実行 |
| `make fmt` | `black` + `isort` で整形 |
| `make lint` | `flake8` で静的解析 |
| `make clean` | キャッシュ掃除 |

## ローカル実行
```bash
make run
# => hello from yourpkg
```

## テスト
```bash
make test
```

## サンプルテスト
```python
import importlib


def test_main_callable():
    mod = importlib.import_module("yourpkg.__main__")
    assert hasattr(mod, "main")
```

## 開発フロー（ブランチ作成 → PR → マージ → 後始末）

### 0) 事前準備（任意）
```bash
brew install gh
gh auth login
```

### 1) ブランチ作成
```bash
git checkout -b feat/change-sample
```

### 2) 変更・実行
```bash
make run
make test
make lint
```

### 3) コミット
```bash
git add -A
git commit -m "feat: short description of the change"
```

### 4) push
```bash
git push -u origin feat/change-sample
```

### 5) PR 作成
ブラウザから「Compare & pull request」
または CLI:
```bash
gh pr create --title "feat: short description" \
             --body "変更概要/受け入れ基準/テスト観点/影響範囲"
```

### 6) レビュー & CI 確認
- CI が green かを確認
- コメントがあれば解消（Resolve）

### 7) マージ
- Squash and merge 推奨

### 8) 後始末（ブランチ削除）
```bash
git checkout main
git pull
git branch -d feat/change-sample
```
