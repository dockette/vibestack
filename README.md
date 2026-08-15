<h1 align=center>Dockette / Vibestack</h1>

<p align=center>
   🎁 Dockerized stack for vibint. Claude, Node.js, Bun, Deno, GitHub CLI, and development tools.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

<p align=center>
  <a href="https://github.com/dockette/vibestack/actions"><img src="https://github.com/dockette/vibestack/actions/workflows/docker.yml/badge.svg"></a>
  <a href="https://hub.docker.com/r/dockette/vibestack/"><img src="https://badgen.net/docker/pulls/dockette/vibestack"></a>
  <a href="https://github.com/sponsors/f3l1x"><img src="https://badgen.net/badge/sponsor/donations/F96854"></a>
  <a href="https://github.com/orgs/dockette/discussions"><img src="https://badgen.net/badge/support/discussions/blue"></a>
</p>

------

## Prologue

Docker image with multiple AI coding CLI tools, Node.js 24, Bun, Deno, GitHub CLI, and essential development tools.

**Features**

- Debian Bookworm (slim)
- Node.js 24 (official installation)
- Bun 1.x (`bun`, `bunx`) - fast JS/TS runtime and package manager
- Deno 2.x (`deno`) - JS/TS runtime with built-in TypeScript
- Claude Code CLI (`claude`) - AI coding agent from Anthropic
- Cursor CLI (`cursor-agent`) - AI coding agent from Cursor
- Codex CLI (`codex`) - AI coding agent from OpenAI
- Gemini CLI (`gemini`) - AI coding agent from Google
- OpenCode CLI (`opencode`) - Open source AI coding agent
- Copilot CLI (`copilot`) - AI coding agent from GitHub
- GitHub CLI (`gh`)
- Essential development tools (git, ssh, curl, wget, nano)
- Search & data tools (`rg` ripgrep, `fd` fd-find, `jq`, `tree`, `less`, `ps`, `unzip`, `zip`)

## Usage

```sh
docker run \
    --rm \
    -it \
    dockette/vibestack:latest
```

## ENV(s)

- `PATH` - Includes `~/bin` and `~/.local/bin` for user-installed tools

## Workdir

Default working directory is `/workspace`.

## Agent docs

`/root/AGENT.md` documents the installed tools and is meant to be read by the
AI agents running inside the container.

## User

Default user is `vibestack` with UID `1000` and GID `1000` and `sudo` no password.

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
