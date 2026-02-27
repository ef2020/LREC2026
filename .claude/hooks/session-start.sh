#!/bin/bash
# session-start.sh — LREC2026 Claude Code session startup hook
#
# Runs at the start of every remote Claude Code session.
# Ensures the GitHub CLI (gh) is installed and authenticated via GH_TOKEN.
#
# Required: GH_TOKEN environment variable (Personal Access Token)
#   Scopes needed: repo, read:org
#   Set it at: https://github.com/settings/tokens
#
# This hook only runs in remote (web) Claude Code sessions.

set -euo pipefail

# Only run in remote Claude Code environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

echo "=== LREC2026 session-start hook ==="

# ── 1. Install gh CLI if missing ───────────────────────────────────────────
if ! command -v gh &>/dev/null; then
  echo "Installing GitHub CLI (gh)..."
  apt-get install -y gh 2>&1 | tail -3
  echo "gh installed: $(gh --version | head -1)"
else
  echo "gh already installed: $(gh --version | head -1)"
fi

# ── 2. Configure GH_TOKEN ──────────────────────────────────────────────────
# Accept GH_TOKEN (preferred) or GITHUB_TOKEN (fallback)
if [ -n "${GH_TOKEN:-}" ]; then
  echo "GH_TOKEN: set (${#GH_TOKEN} chars)"
elif [ -n "${GITHUB_TOKEN:-}" ]; then
  echo "NOTE: Exporting GITHUB_TOKEN as GH_TOKEN"
  export GH_TOKEN="$GITHUB_TOKEN"
  # Persist into the session environment
  if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
    echo 'export GH_TOKEN="'"$GH_TOKEN"'"' >> "$CLAUDE_ENV_FILE"
  fi
else
  echo ""
  echo "WARNING: GH_TOKEN is not set."
  echo "  'gh' commands will fail without authentication."
  echo ""
  echo "  To fix: add GH_TOKEN to your project's environment variables"
  echo "  in the Claude Code web settings (Settings → Environment Variables)."
  echo "  Generate a token at: https://github.com/settings/tokens"
  echo "  Required scopes: repo, read:org"
  echo ""
  # Do not exit — let session start anyway so user can be informed
fi

# ── 3. Verify auth (if token is available) ────────────────────────────────
if [ -n "${GH_TOKEN:-}" ]; then
  echo ""
  echo "Verifying GitHub auth..."
  if gh auth status 2>&1; then
    echo "GitHub auth: OK"
  else
    echo "WARNING: gh auth check failed — token may be expired or missing scopes."
    echo "  Visit https://github.com/settings/tokens to rotate your GH_TOKEN."
  fi
fi

echo ""
echo "=== session-start hook complete ==="
