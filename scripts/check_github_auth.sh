#!/usr/bin/env bash
# check_github_auth.sh — Verify GitHub CLI authentication is working
# Run this at the start of any session that uses `gh` commands.
#
# Required: GH_TOKEN environment variable (a GitHub Personal Access Token)
# Required scopes: repo, read:org (for PR/issue operations)
#
# Usage:
#   bash scripts/check_github_auth.sh
#   source scripts/check_github_auth.sh   # to export token into current shell

set -euo pipefail

echo "=== GitHub Auth Check ==="

# ── 1. Verify gh CLI is installed ──────────────────────────────────────────
if ! command -v gh &>/dev/null; then
  echo "ERROR: 'gh' CLI is not installed."
  echo ""
  echo "Install it with one of:"
  echo "  # Debian/Ubuntu"
  echo "  sudo apt install gh"
  echo ""
  echo "  # macOS"
  echo "  brew install gh"
  echo ""
  echo "  # Or download from: https://cli.github.com/"
  exit 1
fi

echo "gh version: $(gh --version | head -1)"

# ── 2. Check for GH_TOKEN ──────────────────────────────────────────────────
if [ -z "${GH_TOKEN:-}" ]; then
  # Fall back to GITHUB_TOKEN (used by GitHub Actions)
  if [ -n "${GITHUB_TOKEN:-}" ]; then
    export GH_TOKEN="$GITHUB_TOKEN"
    echo "NOTE: Using GITHUB_TOKEN as GH_TOKEN (consider renaming to GH_TOKEN)"
  else
    echo ""
    echo "ERROR: Neither GH_TOKEN nor GITHUB_TOKEN is set."
    echo ""
    echo "To fix: create a Personal Access Token at"
    echo "  https://github.com/settings/tokens"
    echo "with scopes: repo, read:org"
    echo ""
    echo "Then add to your shell profile (~/.bashrc or ~/.zshrc):"
    echo "  export GH_TOKEN=ghp_your_token_here"
    echo ""
    echo "Or for a single session:"
    echo "  GH_TOKEN=ghp_your_token_here bash scripts/check_github_auth.sh"
    exit 1
  fi
else
  echo "GH_TOKEN: set (${#GH_TOKEN} chars)"
fi

# ── 3. Verify the token works ──────────────────────────────────────────────
echo ""
echo "Checking authentication with GitHub..."
if gh auth status 2>&1; then
  echo ""
  echo "Authentication OK."
else
  echo ""
  echo "ERROR: Authentication failed. Your GH_TOKEN may be expired or"
  echo "missing required scopes (repo, read:org)."
  echo ""
  echo "Generate a new token at: https://github.com/settings/tokens"
  exit 1
fi

# ── 4. Verify repo access ──────────────────────────────────────────────────
REPO="ef2020/LREC2026"
echo ""
echo "Checking access to $REPO..."
if gh repo view "$REPO" --json name -q '.name' &>/dev/null; then
  echo "Repo access: OK"
else
  echo "WARNING: Could not access $REPO — check repo name and token permissions."
fi

echo ""
echo "=== Auth check complete ==="
