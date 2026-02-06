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
- Node.js **20+** for `superpowers-gemini`

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

> **Note:** `superpowers-gemini` は Gemini 設定ディレクトリを `~/.gemini` 優先で解決し、存在しない場合は `~/.config/gemini` にフォールバックします。本ドキュメントのパスは `~/.gemini` を基準に記載しているため、`~/.config/gemini` を使う場合は読み替えてください。

#### 3. Gemini CLI の標準コンテキスト (`GEMINI.md`) を更新

`GEMINI.md` は Gemini CLI が起動時に必ず読み込む標準コンテキストファイルです。`superpowers-gemini init` を使うと `~/.gemini/GEMINI.md` と `~/.config/gemini/GEMINI.md` の両方を探索して、存在する場合は追記、なければ新規作成します。

あわせて、Gemini CLI の `settings.json` で `context.fileName` を設定すると、追加のコンテキストファイル名を自動読み込みできます。`superpowers-gemini init --update-settings` は `~/.gemini/settings.json` に `context.fileName` を追記し、`["GEMINI.md","AGENTS.md"]` を重複なしでマージします（`--context-file-names` も同じ動作です）。

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini init
```

実行結果の例:

```text
Updated ~/.gemini/GEMINI.md
Updated ~/.config/gemini/GEMINI.md
```

`context.fileName` も更新する場合:

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini init --update-settings
```

手動で追記する場合は、`~/.gemini/GEMINI.md` に以下を追加してください:

```markdown
## Superpowers System

<EXTREMELY_IMPORTANT>
You have superpowers. Superpowers teach you new skills and capabilities. RIGHT NOW run: `~/.gemini/superpowers/.gemini/superpowers-gemini bootstrap` and follow the instructions it returns.
</EXTREMELY_IMPORTANT>
```

ブートストラップは `@` インポート方式で読み込むのが推奨です（手順 3 の追記ブロックの直後に配置します）:

```markdown
## Superpowers Bootstrap

@~/.gemini/superpowers/.gemini/superpowers-bootstrap.md
```

`@` インポート方式の利点:
- ブートストラップ内容を貼り付けずに済み、重複や差分管理を避けられます
- `git pull` 後に最新のブートストラップが自動で反映されます
- 複数の端末やプロファイルで同じ参照を使えます

更新後は Gemini CLI で `/memory refresh` を実行して反映するのがおすすめです。

#### 3-1. `context.fileName` 設定の補足

Gemini CLI の公式仕様では `settings.json` に `context.fileName`（配列）を設定することで、指定したファイル名のコンテキストを自動読み込みできます。例:

```json
{
  "context": {
    "fileName": ["GEMINI.md", "AGENTS.md"]
  }
}
```

`AGENTS.md` を併用する場合は `GEMINI.md` と合わせて `AGENTS.md` を追加する設定が推奨です。

#### 3-2. `GEMINI.md` の階層読み込みと `.geminiignore`

Gemini CLI は `GEMINI.md` を階層的に読み込みます。読み込み順は **global → project root → subdir** で、現在の作業ディレクトリに近いファイルほど後から適用されます。たとえば `~/.gemini/GEMINI.md`（または `~/.config/gemini/GEMINI.md`）が global、リポジトリ直下の `GEMINI.md` が project root、さらにサブディレクトリ配下の `GEMINI.md` が subdir として読み込まれます。

また、`.geminiignore` は Gemini CLI が `GEMINI.md` を探索する際の対象外パスを指定するファイルです。巨大なディレクトリや無関係なパスを除外したい場合に追加すると、不要な読み込みやノイズを抑えられます。

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

### Doctor (診断)

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini doctor
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

### `/memory` コマンドの使いどころ

Gemini CLI のメモリ関連コマンドは、`GEMINI.md` や `@` インポート、`context.fileName` の更新を反映したいときに有効です。

- `/memory show`: 現在読み込まれているメモリ（コンテキスト）内容を確認したいときに使います。更新が反映されているかのチェックに便利です。
- `/memory refresh`: 既存のメモリを再読み込みします。`GEMINI.md` や `@` インポート内容を更新したあと、反映させたいときに使います。
- `/memory add`: その場で追加したい短い補足指示や一時的なメモを入れるときに使います。恒久的に残したい内容は `GEMINI.md` に書くのが推奨です。

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

You should see v20+ (Node.js **20+** required).

## Getting Help

- Report issues: https://github.com/obra/superpowers/issues
- Main documentation: https://github.com/obra/superpowers
