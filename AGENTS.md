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
- Bump `version` in `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` together when a release ships.

## Glossary

- Skill: folder with `SKILL.md` an agent loads on demand.
- Marketplace: `.claude-plugin/marketplace.json`, the catalog Claude Code reads.
- Plugin: installable bundle of skills, described by `.claude-plugin/plugin.json`.
