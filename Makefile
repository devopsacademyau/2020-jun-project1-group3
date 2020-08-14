TAG ?= $(shell git rev-parse --short HEAD)
REPO_URL ?= $(shell cd terraform/&&terraform output -json ecr_module | jq .ecr | jq -r .repository_url)
CONTAINER_NAME ?= webapp

.PHONY: deploy
deploy:
	@echo 🔨🧟🛠️Deploying all in one...
	cd terraform/&&make init
	cd terraform/&&make plan
	cd terraform/&&make apply
	cd docker/&&make login
	cd docker/&&make build
	cd docker/&&make publish
	cd terraform/&&make deploy-wp
	@echo 🙌🙃Deployment finished!

.PHONY: destroy
destroy:
	@echo 💥💥💥💥🧨💣Destroying...
	cd terraform/&&make init
	cd terraform/&&make destroy