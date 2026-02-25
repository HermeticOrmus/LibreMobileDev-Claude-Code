# /offline

A quick-access command for offline-first workflows in Claude Code.

## Trigger

`/offline [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing offline-first implementation
- `generate` - Generate new offline-first artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for offline-first artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of offline-first artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against offline-first-patterns patterns
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
## Offline First - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Offline First - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/offline analyze

# Generate new artifacts
/offline generate --context ./src

# Validate against best practices
/offline validate --verbose

# Generate documentation
/offline document --format markdown
```
