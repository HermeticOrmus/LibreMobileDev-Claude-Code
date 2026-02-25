# /mobile-analytics

A quick-access command for mobile-analytics workflows in Claude Code.

## Trigger

`/mobile-analytics [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing mobile-analytics implementation
- `generate` - Generate new mobile-analytics artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for mobile-analytics artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of mobile-analytics artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against analytics-patterns patterns
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
## Mobile Analytics - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Mobile Analytics - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/mobile-analytics analyze

# Generate new artifacts
/mobile-analytics generate --context ./src

# Validate against best practices
/mobile-analytics validate --verbose

# Generate documentation
/mobile-analytics document --format markdown
```
