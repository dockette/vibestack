FROM debian:bookworm-slim

ARG TARGETARCH

ENV PATH=/root/bin:/root/.local/bin:$PATH
ENV GH_VERSION=2.83.1

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
        nano && \
    # CLEAN UP #################################################################
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

# NODE.JS 24 ###################################################################
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs

ENV PATH=/root/bin:/root/.local/bin:$PATH

# CLAUDE CODE ##################################################################
RUN npm install -g @anthropic-ai/claude-code

# CURSOR CLI ###################################################################
RUN curl https://cursor.com/install -fsS | bash

# CODEX CLI ####################################################################
RUN npm install -g @openai/codex

# GEMINI CLI ###################################################################
RUN npm install -g @google/gemini-cli

# OPENCODE CLI #################################################################
RUN curl -fsSL https://opencode.ai/install | bash

ENV PATH=/root/.opencode/bin:$PATH

# COPILOT CLI ##################################################################
RUN npm install -g @github/copilot

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

# WORKDIR ######################################################################
WORKDIR /workspace

CMD ["/bin/bash"]
