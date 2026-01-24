#!/usr/bin/env bash
# Test runner wrapper for Gemini CLI
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

if ! command -v gemini &> /dev/null; then
    echo "SKIP: Gemini CLI not found"
    echo "Install Gemini CLI: https://github.com/google-gemini/gemini-cli"
    echo ""
    echo "STATUS: SKIPPED"
    exit 0
fi

export SUPERPOWERS_CLI_CMD="${SUPERPOWERS_CLI_CMD:-gemini}"
export SUPERPOWERS_CLI_PROMPT_FLAG="${SUPERPOWERS_CLI_PROMPT_FLAG:--p}"
export SUPERPOWERS_CLI_ALLOWED_TOOLS_FLAG="${SUPERPOWERS_CLI_ALLOWED_TOOLS_FLAG:-}"

./run-skill-tests.sh "$@"
