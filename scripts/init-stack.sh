#!/usr/bin/env bash
set -euo pipefail

STACK="${1:-}"

if [[ -z "$STACK" ]]; then
  echo "Usage: $0 <stack>"
  echo "Available stacks (built-in): python"
  exit 1
fi

case "$STACK" in
  python)
    echo "[info] python スタックは既にルートに展開済みです。"
    echo "       必要なら requirements を調整し、make setup / make test を実行してください。"
    ;;
  *)
    TEMPLATE_DIR="templates/$STACK"
    if [[ -d "$TEMPLATE_DIR" ]]; then
      rsync -av "$TEMPLATE_DIR"/ ./
      echo "[done] $STACK テンプレートを適用しました。"
    else
      echo "[error] テンプレートが見つかりません: $TEMPLATE_DIR"
      echo "        templates/<stack>/ を作成してから再実行してください。"
      exit 1
    fi
    ;;
esac
