# Installing Superpowers for Gemini CLI

Quick setup to enable superpowers skills in Gemini CLI.

## Installation

1. **Clone superpowers repository**:
   ```bash
   mkdir -p ~/.gemini/superpowers
   git clone https://github.com/obra/superpowers.git ~/.gemini/superpowers
   ```

2. **Create personal skills directory**:
   ```bash
   mkdir -p ~/.gemini/skills
   ```

> **Note:** `superpowers-gemini` は Gemini 設定ディレクトリを `~/.gemini` 優先で解決し、存在しない場合は `~/.config/gemini` にフォールバックします。本ドキュメントのパスは `~/.gemini` を基準に記載しているため、`~/.config/gemini` を使う場合は読み替えてください。

3. **Gemini CLI の標準コンテキストファイル (`GEMINI.md`) を更新**

   `GEMINI.md` は Gemini CLI の標準コンテキストファイルです。`~/.gemini/GEMINI.md` に以下を追記してください:

   ```markdown
   ## Superpowers System

   <EXTREMELY_IMPORTANT>
   You have superpowers. Superpowers teach you new skills and capabilities. RIGHT NOW run: `~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap` and follow the instructions it returns.
   </EXTREMELY_IMPORTANT>
   ```

   ブートストラップの内容を `GEMINI.md` に記載する例:

   ```markdown
   ## Superpowers Bootstrap

   <EXTREMELY_IMPORTANT>
   (ここに `~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap` の出力を貼り付けます)
   </EXTREMELY_IMPORTANT>
   ```

## Verification

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini find-skills
```

You should see a list of available skills.

## Usage

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini use-skill superpowers:brainstorming
```

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

You should see v20+.
