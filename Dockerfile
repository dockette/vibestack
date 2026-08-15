FROM debian:bookworm-slim

ARG TARGETARCH

ENV PATH=/root/bin:/root/.local/bin:$PATH

# VERSIONS #####################################################################
ENV NODE_VERSION=24.19.0
ENV BUN_VERSION=1.3.14
ENV DENO_VERSION=2.9.5
ENV CLAUDE_CODE_VERSION=2.1.227
ENV CODEX_VERSION=0.147.0
ENV GEMINI_VERSION=0.54.4
ENV OPENCODE_VERSION=1.18.16
ENV COPILOT_VERSION=1.0.79
ENV GH_VERSION=2.97.0
ENV GLAB_VERSION=1.112.0

# INSTALLATION #################################################################
RUN apt update && \
    apt dist-upgrade -y

# DEPENDENCIES #################################################################
RUN apt install -y \
        wget \
        curl \
        git \
        ca-certificates \
        gnupg \
        lsb-release \
        openssh-client \
        jq \
        ripgrep \
        fd-find \
        tree \
        less \
        procps \
        unzip \
        zip \
        nano && \
    # Debian ships fd as fdfind to avoid a name clash
    ln -s "$(command -v fdfind)" /usr/local/bin/fd && \
    # CLEAN UP #################################################################
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

# NODE.JS ######################################################################
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION%%.*}.x | bash - && \
    apt-get install -y nodejs=${NODE_VERSION}-1nodesource1

ENV PATH=/root/bin:/root/.local/bin:$PATH

# BUN ##########################################################################
RUN ARCH=$(case ${TARGETARCH} in \
        amd64) echo "linux-x64" ;; \
        arm64) echo "linux-aarch64" ;; \
        *) echo "linux-x64" ;; \
    esac) && \
    curl -OL https://github.com/oven-sh/bun/releases/download/bun-v${BUN_VERSION}/bun-${ARCH}.zip && \
    unzip -q bun-${ARCH}.zip && \
    rm bun-${ARCH}.zip && \
    mv bun-${ARCH}/bun /usr/local/bin && \
    rmdir bun-${ARCH} && \
    ln -s /usr/local/bin/bun /usr/local/bin/bunx

# DENO #########################################################################
RUN ARCH=$(case ${TARGETARCH} in \
        amd64) echo "x86_64-unknown-linux-gnu" ;; \
        arm64) echo "aarch64-unknown-linux-gnu" ;; \
        *) echo "x86_64-unknown-linux-gnu" ;; \
    esac) && \
    curl -OL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-${ARCH}.zip && \
    unzip -q deno-${ARCH}.zip && \
    rm deno-${ARCH}.zip && \
    mv deno /usr/local/bin

# CLAUDE CODE ##################################################################
RUN npm install -g @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION}

# CURSOR CLI ###################################################################
RUN curl https://cursor.com/install -fsS | bash

# CODEX CLI ####################################################################
RUN npm install -g @openai/codex@${CODEX_VERSION}

# GEMINI CLI ###################################################################
RUN npm install -g @google/gemini-cli@${GEMINI_VERSION}

# OPENCODE CLI #################################################################
RUN npm install -g opencode-ai@${OPENCODE_VERSION}

# COPILOT CLI ##################################################################
RUN npm install -g @github/copilot@${COPILOT_VERSION}

# GITHUB CLI ###################################################################
RUN ARCH=$(case ${TARGETARCH} in \
        amd64) echo "linux_amd64" ;; \
        arm64) echo "linux_arm64" ;; \
        arm) echo "linux_armv6" ;; \
        *) echo "linux_amd64" ;; \
    esac) && \
    curl -OL https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_${ARCH}.tar.gz && \
    tar -xvf gh_${GH_VERSION}_${ARCH}.tar.gz && \
    rm gh_${GH_VERSION}_${ARCH}.tar.gz && \
    mv gh_${GH_VERSION}_${ARCH}/bin/gh /usr/local/bin

# GITLAB CLI ###################################################################
RUN ARCH=$(case ${TARGETARCH} in \
        amd64) echo "linux_amd64" ;; \
        arm64) echo "linux_arm64" ;; \
        arm) echo "linux_armv6" ;; \
        *) echo "linux_amd64" ;; \
    esac) && \
    curl -OL https://gitlab.com/gitlab-org/cli/-/releases/v${GLAB_VERSION}/downloads/glab_${GLAB_VERSION}_${ARCH}.tar.gz && \
    tar -xvf glab_${GLAB_VERSION}_${ARCH}.tar.gz && \
    rm glab_${GLAB_VERSION}_${ARCH}.tar.gz && \
    mv bin/glab /usr/local/bin

# AGENT DOCS ###################################################################
COPY AGENT.md /root/AGENT.md

# WORKDIR ######################################################################
WORKDIR /workspace

CMD ["/bin/bash"]
