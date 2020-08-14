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
	terraform apply -auto-approve -var 'app_image=${REPO_URL}' -var 'image_tag=${TAG}' -var 'hosted_zone_id=${hosted_zone_id}' -var 'domain_name=${domain_name}' -var 'acm_cert_arn=${acm_cert_arn}' -var 'ssh_allowed_cidr=${ssh_allowed_cidr}'

.PHONY: init
init:
	@echo "🏁🚥 Initializing...."
	terraform init -backend-config="bucket=${tf_backend_bucket}"

.PHONY: plan
plan:
	@echo "🌏🚜Planning...."
	terraform plan -out tf.plan -var 'app_image=${REPO_URL}' -var 'image_tag=${TAG}' -var 'hosted_zone_id=${hosted_zone_id}' -var 'domain_name=${domain_name}' -var 'acm_cert_arn=${acm_cert_arn}' -var 'ssh_allowed_cidr=${ssh_allowed_cidr}'

.PHONY: apply
apply:
	@echo "⛅🌏🏗️Applying...."
	terraform apply -auto-approve "tf.plan"

.PHONY: destroy
destroy:
	@echo "💥💥💥💥🧨💣Destroying...."
	terraform destroy -auto-approve -var 'app_image=${REPO_URL}' -var 'image_tag=${TAG}' -var 'hosted_zone_id=${hosted_zone_id}' -var 'domain_name=${domain_name}' -var 'acm_cert_arn=${acm_cert_arn}' -var 'ssh_allowed_cidr=${ssh_allowed_cidr}'

.PHONY: deploy
deploy:
	@echo "Deploying all in one...."
	make init
	make plan
	make apply
	make login
	make build
	make publish
	make deploy-wp
	
