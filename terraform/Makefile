TAG ?= $(shell git rev-parse --short HEAD)
REPO_URL ?= $(shell terraform output -json ecr_module | jq .ecr | jq -r .repository_url)
CONTAINER_NAME ?= webapp

.PHONY: init
init:
	@echo "🏁🚥 Initializing...."
	terraform init -backend-config="bucket=${tf_backend_bucket}"

.PHONY: plan
plan:
	@echo "🌏🚜Planning...."
	terraform plan -out tf.plan -var 'app_image=${REPO_URL}' -var 'image_tag=${TAG}' -var 'hosted_zone_id=${hosted_zone_id}' -var 'domain_name=${domain_name}' -var 'acm_cert_arn=${acm_cert_arn}' -var 'ssh_allowed_cidr=${ssh_allowed_cidr}'
	aws s3 cp tf.plan s3://${tf_backend_bucket}/

.PHONY: apply
apply:
	@echo "⛅🌏🏗️Applying...."
	aws s3 cp s3://${tf_backend_bucket}/tf.plan .
	terraform apply -auto-approve "tf.plan"

.PHONY: deploy-wp
deploy-wp:
	@echo "📦🏗️⛅Deploying Wordpress customized image..."
	terraform apply -auto-approve -var 'app_image=${REPO_URL}' -var 'image_tag=${TAG}' -var 'hosted_zone_id=${hosted_zone_id}' -var 'domain_name=${domain_name}' -var 'acm_cert_arn=${acm_cert_arn}' -var 'ssh_allowed_cidr=${ssh_allowed_cidr}'

.PHONY: destroy
destroy:
	@echo "💥💥💥💥💥💥🧨💣Destroying...."
	make init
	terraform destroy -auto-approve -var 'app_image=${REPO_URL}' -var 'image_tag=${TAG}' -var 'hosted_zone_id=${hosted_zone_id}' -var 'domain_name=${domain_name}' -var 'acm_cert_arn=${acm_cert_arn}' -var 'ssh_allowed_cidr=${ssh_allowed_cidr}'

.PHONY: deploy
deploy:
	@echo 🔨🧟🛠️Deploying all in one...
	make init
	make plan
	make apply
	cd ../docker/&&make login
	cd ../docker/&&make build
	cd ../docker/&&make publish
	make deploy-wp
	@echo 🙌🙃🙌Deployment finished!