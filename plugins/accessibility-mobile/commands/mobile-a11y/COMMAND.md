# /mobile-a11y

A quick-access command for accessibility-mobile workflows in Claude Code.

## Trigger

`/mobile-a11y [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing accessibility-mobile implementation
- `generate` - Generate new accessibility-mobile artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for accessibility-mobile artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of accessibility-mobile artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against mobile-a11y-patterns patterns
- Identify gaps, issues, and opportunities
- Prioritize findings by impact and effort

### Step 3: Execution
- Apply the requested action
- Generate or modify artifacts as needed
- Validate changes against requirements

### Step 4: Output
- Present results in the requested format
- Include actionable next steps
- Flag any items requiring human decision

## Output

### Success
```
## Accessibility Mobile - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Accessibility Mobile - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/mobile-a11y analyze

# Generate new artifacts
/mobile-a11y generate --context ./src

# Validate against best practices
/mobile-a11y validate --verbose

# Generate documentation
/mobile-a11y document --format markdown
```
