# Contributing

PRs welcome for plugin depth, framework variations, store-specific patterns, real shipped-app case studies.

## Ways to contribute

### Take a Menu item

[`pantry/MENU.md`](pantry/MENU.md) lists the next pieces of work for this pack, each with a Done-when anyone can check, and names one as up next. Open items also show up as [`[menu]` issues](https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code/issues?q=is%3Aopen+label%3Amenu), and smaller starter tasks as [good first issues](https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code/contribute). Claim one by commenting on its issue, then open a pull request that says `Closes #N`. The research behind the Menu is in [`pantry/`](pantry/README.md).

### Report or fix a routing miss

When Claude picks the wrong agent or skill for a mobile question, or none at all, open a [routing miss](https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code/issues/new?template=routing-miss.yml). The fix is almost always a sharper `description` in the frontmatter of the agent, command or skill that should have answered, which makes it a good first pull request.

### Propose or build a plugin

Open a [plugin proposal](https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code/issues/new?template=plugin-proposal.yml) first, so the scope is agreed before you write it. A plugin in this pack has this layout:

```text
plugins/<name>/
├── .claude-plugin/plugin.json   # name, version, description, author, homepage, repository, license, keywords
├── README.md                    # what the plugin covers
├── agents/<agent-name>.md       # frontmatter: name, description, model: inherit
├── commands/<command-name>.md   # frontmatter: description, argument-hint
└── skills/<skill-name>/SKILL.md # frontmatter: name, description
```

Every `description` is a routing description: it tells Claude when to use that agent, command or skill (agents start with "Use this agent when ..."). Then add the plugin to `.claude-plugin/marketplace.json` with the same `name`, `"source": "./plugins/<name>"`, the same one-sentence `description` as its `plugin.json`, and a `version`, and add a row to the matching table in the README. To deepen an existing plugin instead, edit its agent, command or skill in place and keep the frontmatter.

### Translate

The pack is English only. If you want to translate the README, QUICK_START or a learning path, open a [feedback issue](https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code/issues/new?template=feedback.yml) first so the translation has a home and can be kept in step with the English files.

### Share what you built

Built an app, a flow or a plugin with this pack? Share it in [Discussions](https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code/discussions/categories/show-and-tell) under Show and tell.com/HermeticOrmus/LibreMobileDev-Claude-Code/issues/new?template=feedback.yml). Real shipped-app stories are how the Menu learns what to build next.

### Test your change locally

Load one plugin straight from your working folder, for a single session:

```bash
claude --plugin-dir ./plugins/<plugin>
```

Validate the marketplace and every plugin you touched:

```bash
claude plugin validate .
claude plugin validate plugins/<plugin>
```

Install from your clone into a throwaway config, the way CI does, and check what loaded:

```bash
export CLAUDE_CONFIG_DIR=$(mktemp -d)
claude plugin marketplace add ./
claude plugin install <plugin>@libre-mobiledev
claude plugin details <plugin>@libre-mobiledev
claude plugin list
unset CLAUDE_CONFIG_DIR
```

`claude plugin details` lists the plugin's skills (its commands appear there too) and agents, so you can confirm a new one is picked up. CI (`.github/workflows/check.yml`, running `bash scripts/check.sh`) runs the same validate and clean-install checks on every pull request. The same script also checks that `.grok-plugin/marketplace.json` matches the Claude manifest, validates every plugin with `grok plugin validate`, and installs them into a clean Grok Build home; after you change `.claude-plugin/marketplace.json`, run `python3 scripts/sync-grok-manifest.py` and commit the file it writes. If this is your first contribution to the repo, GitHub holds that CI run until a maintainer approves it.

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
