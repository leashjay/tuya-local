#!/usr/bin/env bash
# Provision the development environment described in AGENTS.md.
set -euo pipefail

if ! command -v uv >/dev/null 2>&1; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi
export PATH="$HOME/.local/bin:$PATH"

# Creates .venv with the interpreter required by pyproject.toml, plus dev tools.
uv sync --group dev

uv tool install pre-commit
pre-commit install
