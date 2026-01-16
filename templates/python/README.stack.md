# Python スタック

- 依存: Python 3.11 付近（actions/setup-python でも 3.11 を指定）
- サンプル: `src/yourpkg/__main__.py`（hello from yourpkg）
- Make ターゲット: setup/run/test/fmt/lint/typecheck/clean
- CI: `.github/workflows/ci.yml` に lint/typecheck/test を設定済み

使い方:
```bash
./scripts/init-stack.sh python  # ルートに展開
make setup
make test
make run
```
