FROM debian:bookworm-slim

ARG TARGETARCH

ENV PATH=~/bin:~/.local/bin:$PATH
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

# NVM ##########################################################################
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install 22 && \
    nvm use 22 && \
    nvm alias default 22 && \
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc

ENV NVM_DIR=/root/.nvm
RUN export NVM_DIR=/root/.nvm && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    NODE_PATH=$(find $NVM_DIR/versions/node -maxdepth 1 -type d -name "v22*" | head -1) && \
    ln -sf $NODE_PATH/bin/node /usr/local/bin/node && \
    ln -sf $NODE_PATH/bin/npm /usr/local/bin/npm && \
    ln -sf $NODE_PATH/bin/npx /usr/local/bin/npx

# CLAUDE #######################################################################
RUN curl -fsSL https://claude.ai/install.sh | bash

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
