# Templates

スタック別のテンプレートを置く場所です。例: `templates/node/`, `templates/rust/`。

- ここにスタックごとの `Makefile`、依存ファイル、サンプルコード、CI 設定を配置します。
- `scripts/init-stack.sh <stack>` が `templates/<stack>/` の中身をリポジトリ直下に展開します。
- 現在は Python スタックがルートに直接展開された状態です。他のスタックを追加する場合はここに置いてからスクリプトを実行してください。
