# AI-driven Development Starter

AI 駆動（アーティファクト駆動）でプロジェクトを進めるためのテンプレート。役割定義と作業ログの器を提供し、コードスタックは後から選べる想定です（デフォルトは Python を同梱）。

---

## このリポから新規プロジェクトを切る手順
1. **テンプレートからリポを作成**  
   GitHub の「Use this template」または `gh repo create --template ...`
2. **クローン**  
   `git clone <your-repo>`
3. **スタックを選択**  
   - 現在の同梱スタック: `python`（すでにルートに展開済み）  
   - 将来のスタックは `templates/<stack>/` に追加して `./scripts/init-stack.sh <stack>` を実行  
   - 例: `./scripts/init-stack.sh python`
4. **AI の作業スペースを使う**  
   - 役割定義は `agent/`、作業ログ・生成物は `work/` に記録
5. **セットアップ & チェック（python スタックの場合）**  
   ```bash
   make setup   # venv 作成 + 依存インストール
   make test    # pytest 実行
   ```

## プロジェクト構成
```text
.
├─ src/yourpkg/           # （例）Python サンプル
│  ├─ __init__.py
│  └─ __main__.py         # エントリポイント
├─ tests/                 # （例）pytest サンプル
│  └─ test_main_exists.py # __main__.py の main 関数が存在するか確認
├─ docs/                  # 仕様・評価・用語など
│  └─ ARCHITECTURE.md     # 1行アーキ図など
├─ agent/                 # AI エージェント用の状態（planner/implementer/reviewer など）
│  ├─ planner.md          # ゴールとステップ計画
│  ├─ implementer.md      # 実行中ステップと生成物ログ
│  ├─ reviewer.md         # 指摘・質問・判定
│  ├─ decisions.md        # 判断ログ
│  ├─ prompts/            # system/user プロンプト
│  └─ context/            # 調査メモなど
├─ work/                  # 生成物・一時成果物 (テンプレあり、gitignore 済)
│  ├─ goal.md             # 目的とスコープ
│  ├─ plan.md             # ステップ計画
│  ├─ task.md             # 実行中タスクの詳細
│  ├─ log.md              # 実行ログ
│  └─ review.md           # レビュー結果
├─ scripts/init-stack.sh  # スタックをテンプレートから適用するスクリプト
├─ templates/             # 言語/スタック別テンプレの置き場（今は説明のみ）
├─ .github/workflows/ci.yml  # GitHub Actions ワークフロー
├─ Makefile               # 開発コマンドをまとめた入口
├─ requirements.txt       # 本番依存
├─ requirements-dev.txt   # 開発用依存
└─ README.md
```

## Make コマンド（python スタックの例）
| コマンド | 説明 |
| --- | --- |
| `make setup` | venv 作成 + 依存インストール |
| `make run` | `yourpkg` を起動（`__main__.py`） |
| `make test` | `pytest -q` を実行 |
| `make fmt` | `black` + `isort` で整形 |
| `make lint` | `flake8` で静的解析 |
| `make typecheck` | `mypy` で型チェック |
| `make clean` | キャッシュ掃除 |

## AI 駆動での進め方（/agent と /work）
アーティファクト駆動で回すための最低限の作法を同梱しています。

1. 役割別に記録: 計画は `agent/planner.md`、実装ログは `agent/implementer.md`、レビューは `agent/reviewer.md`
2. 仕様解釈・スコープ変更は `agent/decisions.md` に追記
3. LLM に渡すプロンプトは `agent/prompts/` に保存
4. 作業ノートは `work/goal.md`, `plan.md`, `task.md`, `log.md`, `review.md` をベースに回す
5. 生成物・ログは `work/<session>/` 配下に置く（`work/` は gitignore 済）

セッション例:
```bash
SESSION=work/$(date +%Y%m%d-%H%M)
mkdir -p "$SESSION"/{artifacts,logs}
echo "# Session $SESSION" > "$SESSION/README.md"
```

状態（plan/decisions/prompts）は常に `/agent` に集約し、`/work` は自由に掃除できる一時領域として使うと回しやすいです。

## ローカル実行（python スタック）
```bash
make run
# => hello from yourpkg
```

## テスト（python スタック）
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

## 開発フロー（例）

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
make typecheck
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
