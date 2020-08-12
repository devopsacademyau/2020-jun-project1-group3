TAG ?= $(shell git rev-parse --short HEAD)
REPO_URL ?= $(shell terraform output -json ecr_module | jq .ecr | jq -r .repository_url)
CONTAINER_NAME ?= webapp

.PHONY: login
login:
	@echo "Retrieving an authentication token and authenticate your Docker client to your registry"
	aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin ${REPO_URL}

.PHONY: build
build:
	@echo "🏷️📦🏗️Building and tagging container..."
	docker build --tag ${REPO_URL}:${TAG} .

.PHONY: push
push:
	@echo "📦🚀⛅Pushing container..."
	docker push ${REPO_URL}:${TAG}

.PHONY: publish
publish:
	@echo "🚀📦⛅Pushing container..."
	docker push ${REPO_URL}:${TAG}

.PHONY: deploy-wp
deploy-wp:
	@echo "📦🏗️⛅Deploying Wordpress customized image..."
	terraform apply -var 'app_image=${REPO_URL}' -var='image_tag=${TAG}' 

.PHONY: plan
plan:
	@echo "🌏🚜Planning...."
	terraform plan -out tf.plan -var='image_tag=${TAG}'

.PHONY: apply
apply:
	@echo "⛅🌏🏗️Applying...."
	terraform apply "tf.plan"

.PHONY: destroy
destroy:
	@echo "💥💥💥💥🧨💣Destroying...."
	terraform destroy

.PHONY: deploy
deploy:
	@echo "Deploying all in one...."
	make plan
	make apply
	make login
	make build
	make publish
	make deploy-wp
	
