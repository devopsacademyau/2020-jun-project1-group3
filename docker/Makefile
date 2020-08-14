TAG ?= $(shell git rev-parse --short HEAD)
REPO_URL ?= $(shell cd ../terraform/&&terraform output -json ecr_module | jq .ecr | jq -r .repository_url)
CONTAINER_NAME ?= webapp

.PHONY: login
login:
	@echo "Retrieving an authentication token and authenticate your Docker client to your registry"
	aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin ${REPO_URL}

.PHONY: build
build:
	@echo "🏷️📦🏗️Building and tagging container..."
	docker build --tag ${REPO_URL}:${TAG} .

.PHONY: publish
publish:
	@echo "🚀📦⛅Pushing container..."
	docker push ${REPO_URL}:${TAG}
