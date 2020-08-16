## Deploy from your computer

:warning: **This will deploy resources that are not entitled for AWS Free Tier and will incure a cost**:

### Pre-requisites
- Route 53 hosted zone configured with a domain
- Certificated configured for this domain
- S3 bucket on Australian to TF and tf.plan
- AWS ACESS KEY and SECRETE KEY
- Optional: Create Alarms on AWS

### Deployment steps

- ```git clone git@github.com:devopsacademyau/2020-jun-project1-group3.git```
- paste the variables block with your values
    - ```export acm_cert_arn=```
    - ```export AWS_ACCESS_KEY_ID=```
    - ```export AWS_SECRET_ACCESS_KEY=```
    - ```export domain_name=```
    - ```export hosted_zone_id=```
    - ```export ssh_allowed_cidr=```
    - ```export tf_backend_bucket=```

- From the root of the repository: ```make deploy```
- Wait for about 10 minutes and you can check the progress from AWS console
- Access the domain and enjoy your new blog

### Destroy your deployment
- From the root of the repository: ```make destroy```


## Test with Github Actions

How to test running on Git Hub Actions

We will deploy triggering GH Actions. At the end we will destroy from a local computer.

Grab the variables below (TIP fill it, you will need to paste it on your terminal to destroy)

- export acm_cert_arn=
- export AWS_ACCESS_KEY_ID=
- export AWS_SECRET_ACCESS_KEY=
- export domain_name=
- export hosted_zone_id=
- export ssh_allowed_cidr=
- export tf_backend_bucket=

Go to GH Settings > Secrets and fill up these variables.

(Keep this export to copy and paste on you terminal later to destroy)

Trigger the Actions

1. Change any file on terraform folder and push, open a PR - It will trigger Make Plan
2. Approve the PR it will trigger Make Apply
3. Change any file on docker folder and push - It will trigger Make publish
4. PR the published file and approve PT-  It will trigger Make deploy-wp

Wait a few minuites to see the container running on your domain.

### How to destroy:

You should have terrafrom and on you local computer

git clone git@github.com:devopsacademyau/2020-jun-project1-group3.git
paste the variables block
make destroy

REMEMBER TO OVERWRITE YOUR AWS_SECRET_ACCESS_KEY ON GIT HUB ACTIONS AFTER THE END AND DELETE THIS ACCESS KEYS ON AWS

### Extra make targets
- In Terraform folder
    - ```make init```
    - ```make plan```
    - ```make apply```
    - ```make deploy-wp```

- In Docker folder
    - ```make login```
    - ```make build```
    - ```make publish```

