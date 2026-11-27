@AGENTS.md

## Version bump (mandatory)

After any change to a skill or agent under this repo, before committing:

1. Bump `metadata.version` in the changed skill's `SKILL.md` frontmatter (SemVer, per skill).
2. Bump `version` in `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` (both equal, SemVer).

See AGENTS.md for the bump rules.
