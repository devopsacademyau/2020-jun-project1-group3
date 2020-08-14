TAG ?= $(shell git rev-parse --short HEAD)
REPO_URL ?= $(shell cd terraform/&&terraform output -json ecr_module | jq .ecr | jq -r .repository_url)
CONTAINER_NAME ?= webapp

.PHONY: deploy
deploy:
	@echo 🔨🧟🛠️Deploying all in one...
	cd terraform/&&make deploy

.PHONY: destroy
destroy:
	@echo 💥💥💥💥🧨💣Destroying...
	cd terraform/&&make destroy