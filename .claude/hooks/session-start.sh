#!/bin/bash
# .claude/hooks/session-start.sh — LREC2026 project session hook
#
# gh installation and GH_TOKEN auth are handled by the global hook at
# ~/.claude/hooks/session-start.sh, which runs first.
#
# This hook is kept as a project-specific placeholder for any future
# LREC2026-specific setup (e.g., installing Python deps, checking corpus
# integrity). Currently it is a no-op in remote sessions.

set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Nothing project-specific to do — gh auth is handled globally.
exit 0
