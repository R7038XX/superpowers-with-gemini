# Installing Superpowers for Gemini CLI

Quick setup to enable superpowers skills in Gemini CLI.

## Installation

1. **Clone superpowers repository**:
   ```bash
   mkdir -p ~/.config/gemini/superpowers
   git clone https://github.com/obra/superpowers.git ~/.config/gemini/superpowers
   ```

2. **Create personal skills directory**:
   ```bash
   mkdir -p ~/.config/gemini/skills
   ```

3. **Update your initial prompt/agent config**

   If Gemini CLI loads an initial prompt/agent config file, add this section.
   Example: `~/.config/gemini/AGENTS.md`

   ```markdown
   ## Superpowers System

   <EXTREMELY_IMPORTANT>
   You have superpowers. Superpowers teach you new skills and capabilities. RIGHT NOW run: `~/.config/gemini/superpowers/.codex/superpowers-codex bootstrap` and follow the instructions it returns.
   </EXTREMELY_IMPORTANT>
   ```

## Verification

```bash
~/.config/gemini/superpowers/.codex/superpowers-codex find-skills
```

You should see a list of available skills.

## Usage

```bash
~/.config/gemini/superpowers/.codex/superpowers-codex use-skill superpowers:brainstorming
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
2. Verify the CLI works: `~/.config/gemini/superpowers/.codex/superpowers-codex find-skills`
3. Ensure each skill has a `SKILL.md` file

### CLI script not executable

```bash
chmod +x ~/.config/gemini/superpowers/.codex/superpowers-codex
```

### Node.js errors

The `superpowers-codex` script requires Node.js:

```bash
node --version
```

You should see v14 or higher (v18+ recommended).
