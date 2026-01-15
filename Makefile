DOCKER_IMAGE=dockette/vibestack
DOCKER_PLATFORMS?=linux/arm64

build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:latest .

test:
	docker run --rm ${DOCKER_IMAGE}:latest node --version
	docker run --rm ${DOCKER_IMAGE}:latest gh --version
	docker run --rm ${DOCKER_IMAGE}:latest claude --version
	docker run --rm ${DOCKER_IMAGE}:latest cursor-agent --version
	docker run --rm ${DOCKER_IMAGE}:latest codex --version
	docker run --rm ${DOCKER_IMAGE}:latest gemini --version
	docker run --rm ${DOCKER_IMAGE}:latest opencode --version
	docker run --rm ${DOCKER_IMAGE}:latest copilot --version
