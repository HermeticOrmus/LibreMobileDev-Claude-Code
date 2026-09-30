# Contributing

PRs welcome for plugin depth, framework variations, store-specific patterns, real shipped-app case studies.

## Welcome
- Framework deepening per platform
- App Store / Play Store specific guidance
- Privacy compliance (ATT, Data Safety, COPPA)
- Real case studies (anonymized)

## Not accepted
- Closed-source patterns without open alternatives
- Patterns that violate store policies

## Before opening a PR
Run `claude plugin validate .` and `claude plugin validate plugins/<plugin>` for each plugin you touched. CI runs the same checks and a clean install of every plugin. Agents live in `plugins/<plugin>/agents/<name>.md`, commands in `plugins/<plugin>/commands/<name>.md`, and skills in `plugins/<plugin>/skills/<name>/SKILL.md`, each with a frontmatter `description` that says when to use it.

`feat/`, `fix/`, `deepen/<plugin>`. MIT, no CLA.
