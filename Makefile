PY := python3
VENV := .venv
ACT := . $(VENV)/bin/activate

.PHONY: setup test run fmt lint typecheck clean

setup:
	$(PY) -m venv $(VENV)
	$(ACT) && pip install -U pip
	@if [ -f requirements.txt ]; then $(ACT) && pip install -r requirements.txt; fi
	@if [ -f requirements-dev.txt ]; then $(ACT) && pip install -r requirements-dev.txt; fi
	@echo "✅ setup done"

test:
	$(ACT) && PYTHONPATH=src pytest -q

run:
	$(ACT) && PYTHONPATH=src $(PY) -m yourpkg

fmt:
	$(ACT) && black . && isort .

lint:
	$(ACT) && PYTHONPATH=src flake8 .

typecheck:
	$(ACT) && PYTHONPATH=src mypy src

clean:
	rm -rf __pycache__ .pytest_cache $(VENV)
