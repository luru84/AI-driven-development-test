#!/usr/bin/env bash
set -euo pipefail

STACK="${1:-}"
AVAILABLE=$(ls -1 templates 2>/dev/null || true)

if [[ -z "$STACK" ]]; then
  echo "Usage: $0 <stack>"
  echo "Available stacks: ${AVAILABLE:-<none>}"
  exit 1
fi

TEMPLATE_DIR="templates/$STACK"
if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "[error] テンプレートが見つかりません: $TEMPLATE_DIR"
  echo "        利用可能: ${AVAILABLE:-<none>}"
  exit 1
fi

rsync -av "$TEMPLATE_DIR"/ ./
echo "[done] $STACK テンプレートを適用しました。"
