---
name: midjourney-prompt-creator
description: Generate ready-to-paste Midjourney prompts that illustrate an event's website and print or social materials (lanyard, banner, kakemono, flag banner, social media banner, poster, square post, story), from a concept or a talk title. Use whenever the user asks for an illustration, a visual, a slide visual, an "affiche", "kakemono", "flamme", "tour de cou", "bannière", or a "Midjourney/MJ prompt", even if they only give a theme or a talk title instead of a visual description. Keeps each event's art-direction parameters untouched and changes only the subject and the --ar ratio per format.
metadata:
  version: "1.0.0"
---

# Midjourney prompt creator for event visuals

Turn a raw idea (concept, theme, talk title) into complete, paste-ready Midjourney prompts for each event support. Each event has a fixed style signature. Never alter it. Only the subject and `--ar` change.

## Art directions

Pick the event first. Each event owns one exact parameter string.

| Event | Prefix | Parameters (verbatim, in this order) |
| ----- | ------ | ------------------------------------ |
| GenAI Days 2026 | `digital illustration poster of ` | `--exp 30 --sref 547763090 3961368746 --sw 750 --stylize 500 --hd --profile 994t9l7` |
| Hackathon Shift 2027 | none | `--sref 918791528 2550922776 1884201935 --profile 994t9l7 --sw 250 --stylize 500 --hd --v 8.2` |
| Meetup GenAI Nantes | none | `--sref 4260696175 --profile 44o3rgn --stylize 500 --hd` |

- Infer the event from the request (names, dates, context). Ask when unclear.
- Reuse the event chosen earlier in the conversation unless the user changes it.

## Prompt template

```
{PREFIX}{SUBJECT} --ar {RATIO} {PARAMETERS}
```

Rules:

- Copy `{PARAMETERS}` verbatim. Never edit, reorder, drop or add a flag, and never suggest changing `--sref`, `--sw`, `--stylize`, `--exp` or `--profile`. They keep every visual of an event graphically consistent. To add an event, append a row to the table above.
- Vary only `{SUBJECT}` and `{RATIO}`.
- Keep the prefix as listed. Adapt it only when the user explicitly asks for another rendering (icon, pattern, flat illustration).
- Write the final prompt in English, even when the conversation is in French: Midjourney responds better to English.

## Step 1: identify the formats

Use the user's own dimensions (cm, mm, px) over the default when given.

| Support | Default `--ar` | Note |
| ------- | -------------- | ---- |
| 16:9 (web, screen, slides) | `16:9` | |
| 9:16 (story, full-screen mobile) | `9:16` | |
| Social post 4:5 | `4:5` | |
| Square post (Instagram, thumbnail) | `1:1` | |
| Generic banner / X (Twitter) header | `3:1` | |
| Poster (standard portrait print) | `287:400` | Ratio calibrated for the event's printed posters. Reuse for any poster. |
| Kakemono / roll-up (85×200 cm) | `17:40` | 100×200 cm gives `1:2`. Ask for the support size when known. |
| Flag banner / "flamme" (tall, narrow) | `1:5` | Varies by manufacturer (often 1:4 to 1:6). Confirm with the user if one is ordered. |
| Lanyard / "tour de cou" | `2:5` | See lanyard note. |
| LinkedIn banner | `4:1` | |
| Facebook banner | `21:8` | About 820×312 px. |
| X / Twitter banner | `3:1` | Same as generic banner. |
| Website hero / wide strip | `16:9` or `21:9` | Ask whether a very wide full-screen strip is wanted. |

**Lanyard note.** The real support is an extremely long, thin strip that Midjourney handles badly. Generate a compact motif or illustration meant to be repeated or cropped into a strip by the printer. Tell the user it is a motif, not a final photo-like render.

When no format is given or the user asks for "the full kit", propose 16:9, 9:16, 4:5, 1:1, banner 3:1 and poster 287:400, then ask whether to add the event formats (kakemono, flag banner, lanyard, social banners).

For a format with no reliable standard size (flag banner, lanyard), say so and offer to confirm the ratio. Never state an exact value as fact.

## Step 2: build the subject

Describe what is seen, not the idea itself. Use one sentence of 8 to 20 words with 1 to 3 strong visual elements (central object, setting, action or motion). Never describe style or palette: the fixed `--sref` does that.

- Bad: `artificial intelligence`
- Good: `a glowing neural network blooming like a digital flower inside an open human mind`

**Concept given** (for example "cybersecurity", "remote work"): translate it into a concrete scene or metaphor.

**Talk title given** (for example "Scaling a product without losing its soul"):

1. Extract the central theme and angle (a tension, a promise, a question).
2. Find an image or metaphor for it.
3. Never put literal text in the subject: Midjourney renders text poorly. Include text only on explicit request, and warn that rendering will be unreliable.

When the concept or title is ambiguous or too broad, offer 2 different visual directions and let the user choose.

## Step 3: assemble and deliver

- Output one full line per format, grouped under the format name (for example "Format Kakemono").
- Reuse the same subject across formats by default. Adapt framing only when asked, or when formats differ a lot (lanyard vs poster).

Example, GenAI Days 2026, concept "circular economy", kakemono and LinkedIn banner:

```
Format Kakemono
digital illustration poster of a tree growing from a spiral of recycled materials, roots turning into gears --ar 17:40 --exp 30 --sref 547763090 3961368746 --sw 750 --stylize 500 --hd --profile 994t9l7

Format LinkedIn banner
digital illustration poster of a tree growing from a spiral of recycled materials, roots turning into gears --ar 4:1 --exp 30 --sref 547763090 3961368746 --sw 750 --stylize 500 --hd --profile 994t9l7
```

Example, Meetup GenAI Nantes, square post:

```
a robot librarian sorting glowing pages into floating shelves --ar 1:1 --sref 4260696175 --profile 44o3rgn --stylize 500 --hd
```
