# Superpowers for Gemini CLI

Complete guide for using Superpowers with Gemini CLI.

## Quick Install

Tell Gemini CLI:

```
Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.gemini/INSTALL.md
```

## Manual Installation

### Prerequisites

- Gemini CLI installed
- Git installed
- Node.js for `superpowers-gemini`

### Installation Steps

#### 1. Clone Superpowers

```bash
mkdir -p ~/.gemini/superpowers
git clone https://github.com/obra/superpowers.git ~/.gemini/superpowers
```

#### 2. Create personal skills directory

```bash
mkdir -p ~/.gemini/skills
```

> **Note:** `superpowers-gemini` resolves the Gemini config directory by preferring `~/.gemini` and falling back to `~/.config/gemini` if `~/.gemini` does not exist. If you already use `~/.config/gemini`, you can keep it there or migrate by creating `~/.gemini`.

#### 3. Update Gemini CLI context (`GEMINI.md`)

Add this section to `~/.gemini/GEMINI.md`:

```markdown
## Superpowers System

<EXTREMELY_IMPORTANT>
You have superpowers. Superpowers teach you new skills and capabilities. RIGHT NOW run: `~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap` and follow the instructions it returns.
</EXTREMELY_IMPORTANT>
```

#### 4. Verify installation

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini find-skills
```

You should see a list of available skills.

## Usage

### Finding skills

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini find-skills
```

### Loading a skill

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini use-skill superpowers:brainstorming
```

### Skill loading workflow

1. Run the bootstrap to disclose all skills and rules:
   ```bash
   ~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap
   ```
2. When a skill applies, load it explicitly:
   ```bash
   ~/.gemini/superpowers/.gemini/superpowers-gemini use-skill superpowers:using-superpowers
   ```
3. Announce that you loaded the skill and follow its checklist.

### Bootstrap all skills

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap
```

## Tool mapping

Skills are authored for Claude Code. In Gemini CLI, map tools as follows:

| Superpowers tool | Gemini CLI equivalent |
| --- | --- |
| `TodoWrite` | Gemini CLI task/planning tool (use your native planning/todo feature). |
| `Task` (subagents) | Subagents are unavailable; explain that and do the work directly. |
| `Skill` | `~/.gemini/superpowers/.gemini/superpowers-gemini use-skill <skill-name>` |
| `Read` / `Write` / `Edit` / `Bash` | Gemini CLI native file + shell tools. |

If Gemini CLI exposes different names, keep the intent the same and note the substitution.

## Updating

```bash
cd ~/.gemini/superpowers
git pull
```

Restart Gemini CLI after updating, and re-check `~/.gemini/GEMINI.md` if needed.

## Troubleshooting

### Skills not found

1. Check the skills directory: `ls ~/.gemini/superpowers/skills`
2. Verify the CLI works: `~/.gemini/superpowers/.gemini/superpowers-gemini find-skills`
3. Ensure each skill has a `SKILL.md` file

### CLI script not executable

```bash
chmod +x ~/.gemini/superpowers/.gemini/superpowers-gemini
```

### Node.js errors

The `superpowers-gemini` script requires Node.js:

```bash
node --version
```

You should see v14 or higher (v18+ recommended).

## Getting Help

- Report issues: https://github.com/obra/superpowers/issues
- Main documentation: https://github.com/obra/superpowers
