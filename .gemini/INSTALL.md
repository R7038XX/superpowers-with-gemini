# Installing Superpowers for Gemini CLI

Quick setup to enable superpowers skills in Gemini CLI.

## Prerequisites

- Gemini CLI installed (Node.js 20+)

Example installs:

```bash
# Quick run
npx @google/gemini-cli

# Or install globally
npm install -g @google/gemini-cli
```

## Installation

1. **Clone superpowers repository**:
   ```bash
   mkdir -p ~/.gemini/superpowers
   cd ~/.gemini/superpowers
   git clone https://github.com/obra/superpowers.git .
   ```

2. **Create personal skills directory**:
   ```bash
   mkdir -p ~/.gemini/skills
   ```

3. **Add a GEMINI.md context file** to any project where you want superpowers enabled:

   ```markdown
   # Superpowers System

   <EXTREMELY_IMPORTANT>
   You have superpowers. RIGHT NOW run: `~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap` and follow the instructions it returns.
   </EXTREMELY_IMPORTANT>
   ```

   Gemini CLI automatically loads `GEMINI.md` in the current directory and parent directories.

4. **Authenticate Gemini CLI** (choose one):

   - **Google login (recommended):** run `gemini` and choose “Login with Google”.
   - **Gemini API key:** set `GEMINI_API_KEY` in your shell environment.
   - **Vertex AI:** set `GOOGLE_API_KEY` and `GOOGLE_GENAI_USE_VERTEXAI=true`.

   For details, see https://geminicli.com/docs/ or the Gemini CLI authentication guide.

## Verification

Test the installation:

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap
```

You should see skill listings and bootstrap instructions. The system is now ready for use.

## Optional Configuration

- **MCP servers / custom tools:** configure `~/.gemini/settings.json` as documented by Gemini CLI.
- **Trusted folders / sandboxing:** adjust per-project policies in Gemini CLI if needed.
