DOCKER_IMAGE=dockette/vibestack
DOCKER_PLATFORMS?=linux/amd64,linux/arm64

build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:latest .

test:
	docker run --rm ${DOCKER_IMAGE}:latest node --version
	docker run --rm ${DOCKER_IMAGE}:latest gh --version
