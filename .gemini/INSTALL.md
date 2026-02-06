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

   `GEMINI.md` は Gemini CLI が起動時に必ず読み込む標準コンテキストファイルです。`superpowers-gemini init` を使うと `~/.gemini/GEMINI.md` と `~/.config/gemini/GEMINI.md` の両方を探索して、存在する場合は追記、なければ新規作成します。

   さらに `settings.json` の `context.fileName` を設定すると、指定したファイル名のコンテキストを自動読み込みできます。`superpowers-gemini init --update-settings` は `~/.gemini/settings.json` に `context.fileName` を追記し、`["GEMINI.md","AGENTS.md"]` を重複なしでマージします（`--context-file-names` も同じ動作です）。

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

   ブートストラップは `@` インポート方式で読み込むのが推奨です（追記ブロックの直後に配置します）:

   ```markdown
   ## Superpowers Bootstrap

   @~/.gemini/superpowers/.gemini/superpowers-bootstrap.md
   ```

   `@` インポート方式の利点:
   - ブートストラップ内容を貼り付けずに済み、重複や差分管理を避けられます
   - `git pull` 後に最新のブートストラップが自動で反映されます
   - 複数の端末やプロファイルで同じ参照を使えます

   更新後は Gemini CLI で `/memory refresh` を実行して反映するのがおすすめです。

   #### `context.fileName` 設定例

   Gemini CLI の公式仕様では `settings.json` に `context.fileName`（配列）を設定して、追加のコンテキストファイル名を自動読み込みできます。例:

   ```json
   {
     "context": {
       "fileName": ["GEMINI.md", "AGENTS.md"]
     }
   }
   ```

   `AGENTS.md` を使う場合は `GEMINI.md` と合わせて `AGENTS.md` を追加する設定が推奨です。

4. **補足の指示が必要な場合は `AGENTS.md` を利用（任意）**

   `AGENTS.md` は補足の指示や運用ルールを追加したい場合に使います。`GEMINI.md` に書いた内容が最優先で読み込まれるため、`AGENTS.md` は補足扱いとして最小限の追記に留めてください。

## Verification

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini find-skills
```

You should see a list of available skills.

## Usage

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini use-skill superpowers:brainstorming
```

### Doctor

セットアップ状況を診断して対処手順を確認するには次を実行します。

```bash
~/.gemini/superpowers/.gemini/superpowers-gemini doctor
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

You should see v20+ (Node.js **20+** required).
