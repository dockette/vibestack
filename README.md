<h1 align=center>Dockette / Vibestack</h1>

<p align=center>
   🎁 Dockerized stack for vibint. Claude, Node.js, GitHub CLI, and development tools.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

<p align=center>
  <a href="https://hub.docker.com/r/dockette/vibestack/"><img src="https://badgen.net/docker/pulls/dockette/vibestack"></a>
  <a href="https://bit.ly/ctteg"><img src="https://badgen.net/badge/support/gitter/cyan"></a>
  <a href="https://github.com/sponsors/f3l1x"><img src="https://badgen.net/badge/sponsor/donations/F96854"></a>
</p>

------

## Prologue

Docker image with multiple AI coding CLI tools, Node.js 24, GitHub CLI, and essential development tools.

**Features**

- Debian Bookworm (slim)
- Node.js 24 (official installation)
- Claude Code CLI (`claude`) - AI coding agent from Anthropic
- Cursor CLI (`cursor-agent`) - AI coding agent from Cursor
- Codex CLI (`codex`) - AI coding agent from OpenAI
- Gemini CLI (`gemini`) - AI coding agent from Google
- OpenCode CLI (`opencode`) - Open source AI coding agent
- Copilot CLI (`copilot`) - AI coding agent from GitHub
- GitHub CLI (`gh`)
- Essential development tools (git, curl, wget, nano)

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

## User

Default user is `vibestack` with UID `1000` and GID `1000` and `sudo` no password.

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
