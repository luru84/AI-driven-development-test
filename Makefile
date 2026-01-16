.PHONY: setup test run fmt lint typecheck clean help

help:
	@echo "Stack is not selected yet."
	@echo "Use ./scripts/init-stack.sh <stack> to apply a template (available: python)."

setup test run fmt lint typecheck clean:
	@echo "No stack selected. Run: ./scripts/init-stack.sh python"
	@true
