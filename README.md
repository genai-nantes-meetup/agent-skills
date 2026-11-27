# Event Organizer Agent Skills

Open-source agent skills for people who organize meetups, conferences, hackathons and community events.

Built and maintained by Naomakers. Works with **Claude** (Claude Code, Claude.ai), **OpenAI Codex** and **ChatGPT**.

## Install

### Claude Code (plugin marketplace)

```
/plugin marketplace add genai-nantes-meetup/agent-skills
/plugin install naomakers-skills@naomakers-skills
```

### Claude.ai and Cowork (plugin marketplace)

1. Open Customize, then Plugins, then Add marketplace.
2. Enter `genai-nantes-meetup/agent-skills`.
3. Select the `naomakers-skills` plugin and click Install.

The plugin is saved to your account: its skills work in chat and in Claude Code. Team and Enterprise owners can sync the repo for the whole organization in Organization settings, Plugins & skills. See the [Claude plugin docs](https://claude.com/docs/cowork/guide/plugins).

### Manual install (single skill)

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

1. Create `skills/<your-skill-name>/SKILL.md`.
2. Run `scripts/validate-skills.sh`.
3. Open a pull request.

## Safety

Skills are instructions an agent follows. Read a skill before installing it. Never put personal data, secrets, budgets or attendee lists in a skill.

## License

[MIT](LICENSE) © 2026 Naomakers
