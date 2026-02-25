# /mobile-cicd

A quick-access command for mobile-ci-cd workflows in Claude Code.

## Trigger

`/mobile-cicd [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing mobile-ci-cd implementation
- `generate` - Generate new mobile-ci-cd artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for mobile-ci-cd artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of mobile-ci-cd artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against mobile-cicd-patterns patterns
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
## Mobile Ci Cd - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Mobile Ci Cd - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/mobile-cicd analyze

# Generate new artifacts
/mobile-cicd generate --context ./src

# Validate against best practices
/mobile-cicd validate --verbose

# Generate documentation
/mobile-cicd document --format markdown
```
