# Superpowers for Gemini CLI

Complete guide for using Superpowers with Google Gemini CLI.

## Quick Install

Tell Gemini CLI (or follow these steps):

```
Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.gemini/INSTALL.md
```

## Manual Installation

### Prerequisites

- Gemini CLI installed (Node.js 20+)
- Shell access to install files

### Installation Steps

#### 1. Clone Superpowers

```bash
mkdir -p ~/.gemini/superpowers
git clone https://github.com/obra/superpowers.git ~/.gemini/superpowers
```

#### 2. Install Bootstrap

The bootstrap file is included at `.gemini/superpowers-bootstrap.md` in this repo. The Gemini helper script reads it directly from `~/.gemini/superpowers`.

#### 3. Add Context File

Create a `GEMINI.md` in any project where you want Superpowers enabled:

```markdown
## Superpowers System

<EXTREMELY_IMPORTANT>
You have superpowers. Superpowers teach you new skills and capabilities. RIGHT NOW run: `~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap` and follow the instructions it returns.
</EXTREMELY_IMPORTANT>
```

Gemini CLI automatically loads `GEMINI.md` in the current directory and parent directories.

#### 4. Verify Installation

Tell Gemini CLI:

```
Run ~/.gemini/superpowers/.gemini/superpowers-gemini find-skills to show available skills
```

You should see a list of available skills with descriptions.

## Usage

### Finding Skills

```
Run ~/.gemini/superpowers/.gemini/superpowers-gemini find-skills
```

### Loading a Skill

```
Run ~/.gemini/superpowers/.gemini/superpowers-gemini use-skill superpowers:brainstorming
```

### Bootstrap All Skills

```
Run ~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap
```

This loads the complete bootstrap with all skill information.

### Personal Skills

Create your own skills in `~/.gemini/skills/`:

```bash
mkdir -p ~/.gemini/skills/my-skill
```

Create `~/.gemini/skills/my-skill/SKILL.md`:

```markdown
---
name: my-skill
description: Use when [condition] - [what it does]
---

# My Skill

[Your skill content here]
```

Personal skills override superpowers skills with the same name.

## Architecture

### Gemini Helper Script

**Location:** `~/.gemini/superpowers/.gemini/superpowers-gemini`

A Node.js CLI script that provides three commands:
- `bootstrap` - Load complete bootstrap with all skills
- `use-skill <name>` - Load a specific skill
- `find-skills` - List all available skills

### Shared Core Module

**Location:** `~/.gemini/superpowers/lib/skills-core.js`

The Gemini CLI implementation uses the shared `skills-core` module (ES module format) for skill discovery and parsing. This is the same module used by the Codex and OpenCode integrations, ensuring consistent behavior across platforms.

### Tool Mapping

Skills written for Claude Code are adapted for Gemini CLI with these mappings:

- `TodoWrite` → Use a Markdown todo list in your response
- `Task` with subagents → Tell the user subagents aren't available in Gemini CLI yet and do the work directly
- `Skill` tool → `~/.gemini/superpowers/.gemini/superpowers-gemini use-skill`
- File operations / shell commands → Use Gemini CLI built-in tools
- Web fetching/search → Use Gemini CLI web tools

## Updating

```bash
cd ~/.gemini/superpowers
git pull
```

## Troubleshooting

### Skills not found

1. Verify installation: `ls ~/.gemini/superpowers/skills`
2. Check CLI works: `~/.gemini/superpowers/.gemini/superpowers-gemini find-skills`
3. Verify skills have SKILL.md files

### CLI script not executable

```bash
chmod +x ~/.gemini/superpowers/.gemini/superpowers-gemini
```

### Node.js errors

The CLI script requires Node.js. Verify:

```bash
node --version
```

Should show v20 or higher.

## Getting Help

- Report issues: https://github.com/obra/superpowers/issues
- Main documentation: https://github.com/obra/superpowers
- Gemini CLI docs: https://geminicli.com/docs/

## Note

Gemini CLI support is experimental and may require refinement based on user feedback. If you encounter issues, please report them on GitHub.
