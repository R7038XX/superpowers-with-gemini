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
mkdir -p ~/.config/gemini/superpowers
git clone https://github.com/obra/superpowers.git ~/.config/gemini/superpowers
```

#### 2. Create personal skills directory

```bash
mkdir -p ~/.config/gemini/skills
```

#### 3. Update initial prompt/agent config

If Gemini CLI loads an initial prompt/agent config file, add this section.
Example: `~/.config/gemini/AGENTS.md`

```markdown
## Superpowers System

<EXTREMELY_IMPORTANT>
You have superpowers. Superpowers teach you new skills and capabilities. RIGHT NOW run: `~/.config/gemini/superpowers/.gemini/superpowers-gemini bootstrap` and follow the instructions it returns.
</EXTREMELY_IMPORTANT>
```

#### 4. Verify installation

```bash
~/.config/gemini/superpowers/.gemini/superpowers-gemini find-skills
```

You should see a list of available skills.

## Usage

### Finding skills

```bash
~/.config/gemini/superpowers/.gemini/superpowers-gemini find-skills
```

### Loading a skill

```bash
~/.config/gemini/superpowers/.gemini/superpowers-gemini use-skill superpowers:brainstorming
```

### Bootstrap all skills

```bash
~/.config/gemini/superpowers/.gemini/superpowers-gemini bootstrap
```

## Updating

```bash
cd ~/.config/gemini/superpowers
git pull
```

Restart Gemini CLI after updating, and re-check `~/.config/gemini/AGENTS.md` if needed.

## Troubleshooting

### Skills not found

1. Check the skills directory: `ls ~/.config/gemini/superpowers/skills`
2. Verify the CLI works: `~/.config/gemini/superpowers/.gemini/superpowers-gemini find-skills`
3. Ensure each skill has a `SKILL.md` file

### CLI script not executable

```bash
chmod +x ~/.config/gemini/superpowers/.gemini/superpowers-gemini
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
