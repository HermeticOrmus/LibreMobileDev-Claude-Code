# /android

A quick-access command for kotlin-android workflows in Claude Code.

## Trigger

`/android [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing kotlin-android implementation
- `generate` - Generate new kotlin-android artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for kotlin-android artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of kotlin-android artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against kotlin-android-patterns patterns
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
## Kotlin Android - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Kotlin Android - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/android analyze

# Generate new artifacts
/android generate --context ./src

# Validate against best practices
/android validate --verbose

# Generate documentation
/android document --format markdown
```
