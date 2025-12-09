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

Docker image with Claude CLI, Node.js 22, GitHub CLI, and essential development tools.

**Features**

- Debian Bookworm (slim)
- Node.js 22 (via NVM)
- Claude CLI (claude)
- GitHub CLI (gh)
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
