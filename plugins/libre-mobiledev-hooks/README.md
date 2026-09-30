# libre-mobiledev-hooks

> Optional safety and context hooks for mobile projects. Not installed by default.

## What it does

| Event | Script | Behavior |
|---|---|---|
| SessionStart | `hooks/session-start.sh` | When the project contains `pubspec.yaml`, an `ios/` or `android/` folder, a `Podfile`, an `.xcodeproj`, an Android Gradle build, or a React Native or Expo `package.json`, prints one line naming the detected platforms. Prints nothing in other projects. |
| PreToolUse | `hooks/pre-tool-use.sh` | Asks you to confirm before a tool reads or writes a sensitive file: `.env` files (not `.env.example`), `.pem`, `.key`, `.p8`, `.p12`, `.jks`, `.keystore`, `key.properties`, provisioning profiles, `credentials` and `secrets` files, `google-services.json`, `GoogleService-Info.plist`. Also asks before `rm -rf`, `git push --force`, `git reset --hard`, and `fastlane match nuke`. Silent otherwise. |
| PostToolUse | `hooks/post-tool-use.sh` | Tells Claude when a file is empty after a write, and once per session, after the first change to `.dart`, `.swift`, `.kt`, `.java`, `.m`, `.ts`, or `.js` source, reminds it to run the matching tests. |

The hooks read the JSON that Claude Code sends on stdin, so they need `jq` on your `PATH`. Without `jq` they exit quietly and do nothing. They never write inside the plugin directory; the once-per-session marker goes to the system temp directory.

## Install

```
/plugin install libre-mobiledev-hooks@libre-mobiledev
```

Or from a terminal: `claude plugin install libre-mobiledev-hooks@libre-mobiledev`, or `./setup.sh --only libre-mobiledev-hooks` from the repo root. Restart Claude Code to load the hooks, and run `/hooks` to see them registered.

## Test a hook by hand

```bash
echo '{"tool_name":"Read","tool_input":{"file_path":"android/key.properties"}}' | hooks/pre-tool-use.sh
```

It prints a `permissionDecision: "ask"` JSON object for a sensitive path and nothing for an ordinary one.
