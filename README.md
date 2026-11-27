# Event Organizer Agent Skills

Open-source agent skills for people who organize meetups, conferences, hackathons and community events.

Built and maintained by Naomakers. Works with **Claude** (Claude Code, Claude.ai), **OpenAI Codex** and **ChatGPT**.

## What is a skill?

A skill is a folder with a `SKILL.md` file: a short description plus instructions an AI agent loads when the task matches. Claude, Codex and ChatGPT all read the same open format, so each skill is written once.

```
skills/
└── <skill-name>/
    ├── SKILL.md        required: frontmatter (name, description) + instructions
    └── ...             optional: reference docs, templates, scripts
```

## Install

### Claude Code (plugin marketplace)

```
/plugin marketplace add genai-nantes-meetup/agent-skills
/plugin install event-organizer-skills@naomakers-event-skills
```

### Claude Code or Claude.ai (manual)

- Claude Code: copy a skill folder into `~/.claude/skills/` (all projects) or `.claude/skills/` (one project).
- Claude.ai: run `scripts/package-chatgpt.sh <skill-name>`, then upload `dist/<skill-name>.zip` in Settings, Capabilities, Skills.

### OpenAI Codex

Copy a skill folder into `~/.agents/skills/` (all projects) or `.agents/skills/` (one project). Codex reads `AGENTS.md` at the repo root for project rules.

### ChatGPT (web)

1. Run `scripts/package-chatgpt.sh <skill-name>` (needs `zip`).
2. Open ChatGPT, go to the skills upload screen, and upload `dist/<skill-name>.zip`.

Upload menus change often. Check OpenAI's current skills documentation if a label differs.

## Available skills

| Skill | Purpose |
| ----- | ------- |
| [midjourney-prompt-creator](skills/midjourney-prompt-creator/SKILL.md) | Build Midjourney prompts for event visuals (poster, kakemono, banners, lanyard) in each event's fixed art direction |

## Contribute

Read [CONTRIBUTING.md](CONTRIBUTING.md). Short version:

1. Copy `template/skill-template/` to `skills/<your-skill-name>/`.
2. Rewrite `SKILL.md`.
3. Run `scripts/validate-skills.sh`.
4. Open a pull request.

## Safety

Skills are instructions an agent follows. Read a skill before installing it. Never put personal data, secrets, budgets or attendee lists in a skill.

## License

[MIT](LICENSE) © 2026 Naomakers
