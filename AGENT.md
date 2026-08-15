# Vibestack

Container image for AI coding agents, based on Debian Bookworm (slim).
Default working directory is `/workspace`; the repository you work on is
usually mounted there.

## AI coding agents

| Command        | Tool                            |
| -------------- | ------------------------------- |
| `claude`       | Claude Code CLI (Anthropic)     |
| `cursor-agent` | Cursor CLI                      |
| `codex`        | Codex CLI (OpenAI)              |
| `gemini`       | Gemini CLI (Google)             |
| `opencode`     | OpenCode CLI                    |
| `copilot`      | Copilot CLI (GitHub)            |

## Runtimes

| Command        | Tool                    | Notes                                       |
| -------------- | ----------------------- | ------------------------------------------- |
| `node`, `npm`  | Node.js 24 (NodeSource) | Default runtime for the installed CLI tools |
| `bun`, `bunx`  | Bun 1.x                 | JS/TS runtime, bundler and package manager  |
| `deno`         | Deno 2.x                | JS/TS runtime with built-in TypeScript      |

## Version control & forges

| Command | Tool       |
| ------- | ---------- |
| `git`   | Git        |
| `gh`    | GitHub CLI |
| `glab`  | GitLab CLI |
| `ssh`   | OpenSSH client (git over SSH) |

## Search, data & shell tools

| Command  | Tool     | Notes                                              |
| -------- | -------- | -------------------------------------------------- |
| `rg`     | ripgrep  | Fast recursive search; respects `.gitignore`       |
| `fd`     | fd-find  | Fast file finding; Debian's `fdfind` is symlinked to `fd` |
| `jq`     | jq       | JSON querying and transformation                   |
| `tree`   | tree     | Directory listing as a tree                        |
| `less`   | less     | Pager used by `git` and `gh`                       |
| `ps`     | procps   | Process listing                                    |
| `unzip`, `zip` | Info-ZIP | Archive extraction and creation               |
| `curl`, `wget` | -   | HTTP clients                                       |
| `nano`   | nano     | Terminal editor                                    |

## Tips for agents

- Prefer `rg` over `grep -r` and `fd` over `find` — both are much faster
  and skip ignored files by default.
- Pipe API and CLI output through `jq` instead of parsing JSON by hand;
  `gh` and `glab` both support `--json` output.
- Node.js, Bun and Deno are all available — use whichever a project expects
  (`package.json` scripts, `bun.lock`, `deno.json`) instead of assuming `npm`.
- `PATH` includes `/root/bin` and `/root/.local/bin`, so tools you install
  yourself into those directories are picked up without extra setup.
- Run `<command> --version` to check the exact version of any tool; the
  image pins them in the `Dockerfile`.
