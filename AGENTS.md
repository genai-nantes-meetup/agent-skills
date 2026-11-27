# AGENTS.md

Repo of open-source agent skills for event organizers. Read by Codex, Claude Code and other agents.

## Layout

- `skills/<name>/SKILL.md`: one folder per skill. Frontmatter `name` equals folder name.
- `template/skill-template/`: copy-me starter. Never place it under `skills/`: the plugin would ship it.
- `.claude-plugin/`: Claude plugin marketplace and plugin manifest. Skills load from `skills/`.
- `scripts/validate-skills.sh`: gate for skill structure.
- `scripts/package-chatgpt.sh`: build `dist/<name>.zip` for ChatGPT upload. `dist/` is gitignored.

## Gates

Run before every commit:

1. `scripts/validate-skills.sh`
2. `scripts/package-chatgpt.sh`

CI runs the same two commands. Never weaken a gate to make a skill pass.

## Rules

- Write everything in English.
- Follow `CONTRIBUTING.md` for skill content rules.
- Never add personal data, secrets or private event details.
- Use Conventional Commits: `<type>[(scope)]: <description>`, imperative, lowercase, no trailing period.
- Bump the plugin version on every change to a skill or agent (add, edit, rename, remove). Claude Code caches installed plugins by version: without a bump, users never receive the update.
  - Edit `version` in `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`. Keep both equal.
  - Use SemVer: patch for fixes and wording, minor for a new skill or agent, major for a rename, removal or breaking behavior change.
  - Bump once per pull request, in the same commit as the skill change.

## Glossary

- Skill: folder with `SKILL.md` an agent loads on demand.
- Marketplace: `.claude-plugin/marketplace.json`, the catalog Claude Code reads.
- Plugin: installable bundle of skills, described by `.claude-plugin/plugin.json`.
