#!/usr/bin/env bash
# Package skills as zip files for upload into ChatGPT (one zip per skill).
# Usage: scripts/package-chatgpt.sh [skill-name ...]   (default: every skill)
# Output: dist/<skill-name>.zip, with the skill folder at the zip root.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT/skills"
DIST_DIR="$ROOT/dist"

command -v zip >/dev/null 2>&1 || { echo "❌ zip not installed" >&2; exit 1; }

"$ROOT/scripts/validate-skills.sh"

mkdir -p "$DIST_DIR"

if [ "$#" -gt 0 ]; then
  names=("$@")
else
  names=()
  for dir in "$SKILLS_DIR"/*/; do
    [ -f "$dir/SKILL.md" ] && names+=("$(basename "$dir")")
  done
fi

if [ "${#names[@]}" -eq 0 ]; then
  echo "ℹ️ no skills to package yet"
  exit 0
fi

for name in "${names[@]}"; do
  [ -f "$SKILLS_DIR/$name/SKILL.md" ] || { echo "❌ unknown skill: $name" >&2; exit 1; }
  out="$DIST_DIR/$name.zip"
  rm -f "$out"
  (cd "$SKILLS_DIR" && zip -qr "$out" "$name" -x '*.DS_Store')
  echo "✅ $out"
done
