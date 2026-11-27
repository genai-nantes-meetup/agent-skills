#!/usr/bin/env bash
# Validate every skill: SKILL.md exists, frontmatter has name + description,
# and name matches the directory (kebab-case). Exit non-zero on any problem.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# Anthropic skill spec caps description at 1024 characters.
MAX_DESCRIPTION_LEN=1024
NAME_PATTERN='^[a-z0-9]+(-[a-z0-9]+)*$'

errors=0
checked=0

fail() {
  echo "❌ $1" >&2
  errors=$((errors + 1))
}

# Print the value of a top-level frontmatter key (single-line values only).
frontmatter_value() {
  local file="$1" key="$2"
  awk -v key="$key" '
    NR == 1 && $0 != "---" { exit }
    NR > 1 && $0 == "---" { exit }
    index($0, key ":") == 1 { sub("^" key ":[ ]*", ""); print; exit }
  ' "$file"
}

for dir in "$ROOT"/skills/*/ "$ROOT"/template/*/; do
  [ -d "$dir" ] || continue
  dir="${dir%/}"
  dir_name="$(basename "$dir")"
  skill_file="$dir/SKILL.md"
  checked=$((checked + 1))

  if [ ! -f "$skill_file" ]; then
    fail "$dir_name: missing SKILL.md"
    continue
  fi

  if [ "$(head -n 1 "$skill_file")" != "---" ]; then
    fail "$dir_name: SKILL.md must start with '---' frontmatter"
    continue
  fi

  name="$(frontmatter_value "$skill_file" name)"
  description="$(frontmatter_value "$skill_file" description)"

  [ -n "$name" ] || fail "$dir_name: frontmatter 'name' missing"
  [ -n "$description" ] || fail "$dir_name: frontmatter 'description' missing"

  if [ -n "$name" ]; then
    [ "$name" = "$dir_name" ] || fail "$dir_name: name '$name' does not match directory"
    [[ "$name" =~ $NAME_PATTERN ]] || fail "$dir_name: name '$name' is not kebab-case"
  fi

  if [ "${#description}" -gt "$MAX_DESCRIPTION_LEN" ]; then
    fail "$dir_name: description longer than $MAX_DESCRIPTION_LEN characters"
  fi
done

if [ "$errors" -gt 0 ]; then
  echo "❌ $errors problem(s) in $checked skill folder(s)" >&2
  exit 1
fi

echo "✅ $checked skill folder(s) valid"
