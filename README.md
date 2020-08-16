![GitHub repo size](https://img.shields.io/github/repo-size/devopsacademyau/2020-jun-project1-group3?label=GitHub%20Repo%20Size&logo=GitHub&style=plastic) ![GitHub contributors](https://img.shields.io/github/contributors/devopsacademyau/2020-jun-project1-group3?label=Contributors)  ![GitHub last commit](https://img.shields.io/github/last-commit/devopsacademyau/2020-jun-project1-group3?color=BROWN&style=plastic) ![GitHub issues](https://img.shields.io/github/issues/devopsacademyau/2020-jun-project1-group3?color=PURPLE&style=plastic) ![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/devopsacademyau/2020-jun-project1-group3?color=Yellow&style=plastic)

### __PROJECT TITLE:__

    MIGRATION OF ON-PREMISES WEB APP TO CLOUD

### __PROJECT GROUP__

    DEVOPSACADEMY - PROJECT - GROUP3

### __TEAM MEMBERS:__

     -  Daniel Andrade
     -  Fernando Rolnik
     -  Jay Amaranayake
     -  Vanitha Kaliyaperumal

### __MENTORS__

      - Caio Trevisan
      - Denis Silva
      - Kiko Collet


Table of Contents
=================

   * [Current Business Status](#current-business-status)
      * [Business Requirement](#business-requirement)
      * [Assumptions](#assumptions)
   * [Proposed Solution](#proposed-solution)
      * [High level design](#high-level-design)
      * [Pre-Requisites](#pre-requisites)
      * [Deploy from your computer](#deploy-from-your-computer)
         * [Deployment steps](#deployment-steps)
         * [Destroy your deployment](#destroy-your-deployment)
      * [Test the CI/CD setup](#test-the-cicd-setup)
      * [Tech Debt/ Things to improve](#tech-debt-things-to-improve)
      * [More info](#more-info)
      * [Installation Steps](#installation-steps)
   * [Deployment / Usage](#deployment--usage)
   * [Application CICD / Automation](#application-cicd--automation)
   * [Recommendations](#recommendations)
   * [Resources](#resources)

# Current Business Status
A company in Australia currently have a web application running on-premisis in a Linux virtual machine. The application is being used by hundreds of customers every day and it is based on Wordpress which uses LAMP stack (Linux, Apache, MySQL and PHP) to offer great products.

Currently the solution is hosted in a single server (application and database) and deployments are made through FTP transfers to the server.

 ![CURRENT WORKFLOW](./images/Current_State.jpg)

## Business Requirement
The CEO is worried that a traffic peak may bring down the website whih is a great loss to the business as a whole.
The CEO wanted to migarte the On-premesis Web Application to AWS cloud and below are the requirements for the pilot migration project.

* Containeraize the application using Docker.
* The application needs to be secure (all data encrypted at rest and in transit).
* The application needs to be Highly Available.
* The application needs to support peaks of up to 10 times the average load (scalability).
* The infrastructure needs to be reproducible and version controlled in case the CEO decides to expand the business to other parts of the world (consider infra as code).
* There must be an easy and secure way of developing, with fast feedback (consider CI/CD practices or at least automation scripts).
* Strategy for Logging and Alarming the health of the system.
* Strategy for handling application component failure.

## Assumptions

- Data Migration is out of scope as it is a pilot migration.
- Consider to include the Unit/Integration/service test in the CI pipeline or automation scripts.
- Single GitHib repo will be delivered.
- This pilot migration will be delivered using Terraform code.

# Proposed Solution

__Technology Products / Services__

Below are the Technology Products chosen to deliver this pilot Migration solution.

| REQUIREMENT                  |  TECHNOLOGY                  |
|------------------------------|:-----------------------------|
|  Version Control System(VCS) |  GitHub                      |
|  Infra as Code               |  Terraform                   |
|  PipeLine Tools              |  GitHub Actions              |
|  Containerization            |  Docker / Docker - Compose   |
|  Relational Database         |  AURORA RDS MySQL Serverles  |
|  Container orchestrator      |  ECS FARGATE                 |
|  Container Registry          |  ECR                         |


## High level design


 ![Solution Diagram](./images/da-project-group3.png)


## Pre-Requisites

|  Installations                                      | Reference                                                                                              |
|:----------------------------------------------------|:-------------------------------------------------------------------------------------------------------|
| Terraform                                           | [Terraform Download](https://www.terraform.io/downloads.html)                                          |
| Git                                                 | [Git Install](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)                           |
| AWS CLI                                             | [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)                         |
| Docker                                              | [Docker Install](https://www.docker.com/get-started)                                                   |
| JQ                                                  | [Jq Install](https://github.com/stedolan/jq/wiki/Installation)                                         |
| Make                                                | [GNU Make](https://www.gnu.org/software/make/)                                                         |

---
|  Configurations / Other                             | Reference                                                                                              |
|:----------------------------------------------------|:-------------------------------------------------------------------------------------------------------|
| AWS Account                                         | [AWS Console](https://aws.amazon.com/console/)                                                         |
| Registration Domain name                            | [Free Domain](http://www.dot.tk/en/index.html?lang=en)                                                 |
| Configure Nameservers in the Domain                 | [Add Nameserver](./docs/NewDomain.md)                                                                  |
| Create TLS/SSL Certificates                         | [AWS Certificate Manager](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html) |
|                                                     | [SSL Creation](./docs/SSL-TLS.md)
| Create SNS Topic and Subscription Confirmation      | [Alarming](./docs/LoggingandAlarming.md)                                                               |
| Create CloudWatch Rules                             | [Alarming](./docs/LoggingandAlarming.md)                                                               |



## Deploy from your computer

:warning: **This will deploy resources that are not entitled for AWS Free Tier and will incure a cost**

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

## Test the CI/CD setup


## Tech Debt/ Things to improve

## More info

<details>

## Installation Steps

Below are the different stages of Application Installation and readiness.

   1. [Network Setup](terraform/modules/networking/README.md)
   2. [Database Installation](terraform/modules/rds-aurora/README.md)
   3. [Shared Storage Setup](terraform/modules/efs/README.md)
   4. [Application Installation](terraform/modules/ecs/README.md)
   5. [Securing Application](./docs/SSL-TLS.md)
   6. [Logging and Alarming](./docs/LoggingandAlarming.md)


# Deployment / Usage

Requirements:

* [Dockerfile](./terraform/docker/Makefile)

* [Makefile](./terrform/Makefile)

**Deployment Steps:**
Execute the below steps to deploy the Application using Terraform Automation.

1. Plan terraform deploy with container tag
>       make plan

2. Apply Terraform to deploy the application.
>       make apply

3. Login to the Elastic Container Registry.
>       make login

4. Build Wordpress Container Image
>       make build

5. Publish the docker image to ECS Registry - ECR
>       make publish

6. Redeploy with Updated Image.
>       make deploy-wp


To do the deployment in one go, just execute the below command and the above 6 steps will be automatically run to deploy the application.
>      make all

To destroy all the AWS resources deployed as part of Terraform, execute below command.
>       make destroy

# Application CICD / Automation

Below are the steps to be followed to run automatic deployment of application cluster.

# Resources

[WORDPRESS BEST PRACTISE](https://aws.amazon.com/blogs/architecture/wordpress-best-practices-on-aws/)

[AUTOMATING WORDPRESS](https://medium.com/@beBrllnt/from-30-minutes-to-10-seconds-automating-wordpress-setup-5ff7526942c0)

<details>
# License

[LICENSE](./LICENSE)

