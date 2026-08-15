DOCKER_IMAGE=dockette/vibestack
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64

TEST_RUN=docker run --rm --platform ${DOCKER_PLATFORMS} ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: build
build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: push
push:
	docker push ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: run
run:
	docker run --rm -it --platform ${DOCKER_PLATFORMS} -v ${PWD}:/workspace -w /workspace ${DOCKER_IMAGE}:${DOCKER_TAG} /bin/bash

.PHONY: test
test: _testcase-node _testcase-agents _testcase-common

.PHONY: _testcase-node
_testcase-node:
	$(TEST_RUN) node --version
	$(TEST_RUN) npm --version

.PHONY: _testcase-agents
_testcase-agents:
	$(TEST_RUN) claude --version
	$(TEST_RUN) cursor-agent --version
	$(TEST_RUN) codex --version
	$(TEST_RUN) gemini --version
	$(TEST_RUN) opencode --version
	$(TEST_RUN) copilot --version

.PHONY: _testcase-common
_testcase-common:
	$(TEST_RUN) gh --version
	$(TEST_RUN) glab --version
	$(TEST_RUN) git --version
	$(TEST_RUN) ssh -V
	$(TEST_RUN) jq --version
	$(TEST_RUN) rg --version
	$(TEST_RUN) fd --version
	$(TEST_RUN) tree --version
	$(TEST_RUN) less --version
	$(TEST_RUN) ps --version
	$(TEST_RUN) unzip -v
	$(TEST_RUN) zip -v
	$(TEST_RUN) nano --version
