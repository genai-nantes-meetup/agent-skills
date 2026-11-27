# Contributing

Thanks for adding a skill. Keep each skill small, specific and reusable by any event organizer.

## Add a skill

1. Fork the repo and create a branch: `feat/<skill-name>`.
2. Copy `template/skill-template/` to `skills/<skill-name>/`.
3. Edit `SKILL.md`.
4. Run `scripts/validate-skills.sh`. It must print `✅`.
5. Add a row to the table in `README.md`.
6. Open a pull request. Use a Conventional Commits title: `feat(skills): add venue-scouting`.

## SKILL.md rules

- Frontmatter has `name` and `description`.
- `name` is kebab-case and equals the folder name.
- `metadata.version` holds the skill's SemVer, starting at `"1.0.0"`. Bump it on every change to the skill.
- Bump `version` in `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` too, so users receive the update.
- `description` says what the skill does and when to trigger it. Max 1024 characters.
- Write imperative sentences, verb first. One idea per bullet.
- Keep `SKILL.md` under 500 lines. Move long material to sibling files and link them.
- Write in English.

## Content rules

- No personal data: names, emails, phone numbers, attendee lists.
- No secrets, API keys or internal URLs.
- No private budgets or contract terms. Use ranges or placeholders.
- Name sources when a skill states facts (laws, platform limits, prices) and date them.
- Scripts must be short, readable and avoid network calls unless the skill needs them.

## Review checklist

- [ ] `scripts/validate-skills.sh` passes
- [ ] Description triggers on the right requests and not on others
- [ ] No private or sensitive content
- [ ] README table updated

## Code of conduct

Be kind, assume good faith, review the work and not the person.
