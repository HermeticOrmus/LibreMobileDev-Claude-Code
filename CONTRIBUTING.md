# Contributing to LibreMobileDev-Claude-Code

Thank you for your interest in contributing. This guide covers how to add new plugins, improve existing ones, and maintain quality across the collection.

## Plugin Structure

Every plugin follows this layout:

```
plugins/{plugin-name}/
├── README.md                           # Plugin overview (50-80 lines)
├── agents/{agent-name}/AGENT.md        # Agent definition (80-150 lines)
├── commands/{command-name}/COMMAND.md   # Command definition (60-100 lines)
└── skills/{skill-name}/SKILL.md        # Skill definition (60-100 lines)
```

## Adding a New Plugin

1. **Fork and clone** the repository
2. **Create a branch**: `feature/{plugin-name}`
3. **Create the directory structure** under `plugins/`
4. **Write all four files** following the templates below
5. **Update the root README.md** plugin table
6. **Submit a pull request** with a clear description

## File Guidelines

### README.md (Plugin Root)
- Brief description of what the plugin covers
- List of included agents, commands, and skills
- Usage examples showing practical application
- Target length: 50-80 lines

### AGENT.md
- **Identity**: Who the agent is (role, specialty)
- **Expertise**: What domains and technologies it covers
- **Behavior**: How it approaches problems, communicates, and prioritizes
- **Tools & Methods**: Specific techniques and frameworks it applies
- **Output Format**: How it structures its responses
- Target length: 80-150 lines

### COMMAND.md
- **Trigger**: The slash command that activates it
- **Input**: What parameters or context it expects
- **Process**: Step-by-step workflow
- **Output**: What it produces
- **Examples**: 2-3 concrete usage examples
- Target length: 60-100 lines

### SKILL.md
- **Knowledge Base**: Core concepts and terminology
- **Patterns**: Proven approaches and best practices
- **Anti-Patterns**: Common mistakes to avoid
- **References**: Links to official docs and resources
- Target length: 60-100 lines

## Quality Standards

- **Accuracy**: All technical content must be correct and current
- **Platform coverage**: Address both iOS and Android where applicable
- **Framework awareness**: Reference Flutter, React Native, and native SDKs appropriately
- **Practical examples**: Include real code snippets, not just theory
- **No vendor lock-in**: Prefer open standards and multi-platform solutions

## Code of Conduct

This project follows the [Contributor Covenant v2.1](CODE_OF_CONDUCT.md). Be respectful, constructive, and inclusive.

## Commit Messages

Use conventional commits:

```
feat(plugin-name): add new plugin for X
fix(plugin-name): correct Y in AGENT.md
docs: update root README plugin table
chore: update .gitignore patterns
```

## Review Process

1. All PRs require at least one review
2. Plugin content is checked for technical accuracy
3. File structure must match the standard layout
4. README plugin table must be updated

## Questions

Open an issue for discussion before starting large changes. For small fixes, go ahead and submit a PR directly.
