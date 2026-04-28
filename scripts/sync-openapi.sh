#!/usr/bin/env bash
# Refresh openapi/backend.json from the local jolly monorepo.
# Run this after backend changes, before opening a PR on jollypoints/docs.
set -euo pipefail

JOLLY_ROOT="${JOLLY_ROOT:-$HOME/Documents/GitHub/jolly}"
DOCS_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "→ Regenerating spec in $JOLLY_ROOT/apps/backend"
(cd "$JOLLY_ROOT/apps/backend" && pnpm gen-openapi)

echo "→ Copying openapi.json into $DOCS_ROOT/openapi/backend.json"
cp "$JOLLY_ROOT/apps/backend/openapi.json" "$DOCS_ROOT/openapi/backend.json"

echo "✓ Done. Review with: git diff openapi/backend.json"
