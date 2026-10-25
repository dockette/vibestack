<h1 align=center>Dockette / Vibestack</h1>

<p align=center>
   🎁 Dockerized stack for vibint. Claude, Node.js, Bun, Deno, GitHub CLI, and development tools.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

<p align=center>
  <a href="https://github.com/dockette/vibestack/actions"><img src="https://github.com/dockette/vibestack/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
  <a href="https://hub.docker.com/r/dockette/vibestack"><img src="https://img.shields.io/docker/pulls/dockette/vibestack.svg" alt="Docker Hub pulls"></a>
  <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
  <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

-----

Docker image with AI coding CLI tools, Node.js 24, Bun, Deno, GitHub CLI and essential development tools, for agents
that work in a container.

## Features

- Debian Trixie (slim)
- Node.js 24 (official installation)
- Bun 1.x (`bun`, `bunx`): fast JS/TS runtime and package manager
- Deno 2.x (`deno`): JS/TS runtime with built-in TypeScript
- Claude Code CLI (`claude`): AI coding agent from Anthropic
- Cursor CLI (`cursor-agent`): AI coding agent from Cursor
- Codex CLI (`codex`): AI coding agent from OpenAI
- Gemini CLI (`gemini`): AI coding agent from Google
- OpenCode CLI (`opencode`): open source AI coding agent
- Copilot CLI (`copilot`): AI coding agent from GitHub
- GitHub CLI (`gh`)
- Essential development tools (git, ssh, curl, wget, nano)
- Search and data tools (`rg` ripgrep, `fd` fd-find, `jq`, `tree`, `less`, `ps`, `unzip`, `zip`)
- `/root/AGENT.md` documents the installed tools and is meant to be read by the AI agents inside the container

## Usage

```sh
docker run --rm -it dockette/vibestack:latest
```

## Configuration

- Working directory is `/workspace`.
- User is `vibestack` with UID `1000` and GID `1000`, and `sudo` without a password.
- `PATH` includes `~/bin` and `~/.local/bin` for user-installed tools.

## Versions

| Version | Release |
|---------|---------|
| `dockette/vibestack:YYYY.MM.DD` | release `YYYY.MM.DD` |
| `dockette/vibestack:latest` | latest build of `master` |

All versions build on `debian:trixie-slim`. Tool versions are pinned in the `Dockerfile`. Releases are listed on
[GitHub](https://github.com/dockette/vibestack/releases).

## Development

```sh
make build          # build the image
make test           # check the version of every tool
make push           # push the image
make run            # open a shell in the image, with the current directory in /workspace
make version        # print VERSION
make release        # set today's date in VERSION
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to
[support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
