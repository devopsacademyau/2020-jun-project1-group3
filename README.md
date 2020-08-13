
# __PROJECT TITLE:__ 
###       __MIGRATION OF ON-PREMISES WEB APP TO CLOUD__

## __PROJECT GROUP__
### __DEVOPSACADEMY - PROJECT - GROUP3__

## __TEAM MEMBERS:__

Team "Devopsacademy Project Group3" consists of 4 tech nerds for the delivery of the Pilot project.

          * Daniel Andrade
          * Fernando Rolnik
          * Jay Amaranayake
          * Vanitha Kaliyaperumal

Table of Contents
=================

   * [<strong>Current Business Status</strong>](#current-business-status)
      * [<strong>Business Problem Statement</strong>](#business-problem-statement)
      * [<strong>Business Requirement</strong>](#business-requirement)
         * [<strong>Project Timeline</strong>](#project-timeline)
      * [<strong>Deliverables</strong>](#deliverables)
      * [<strong>Assumptions</strong>](#assumptions)
   * [<strong>Technology Solution Walkthrough</strong>](#technology-solution-walkthrough)
      * [<strong>Technology Products / Services</strong>](#technology-products--services)
      * [<strong>Pre-Requisites</strong>](#pre-requisites)
      * [<strong>Installation Steps</strong>](#installation-steps)
         * [<strong>I. Infrastructure Readiness</strong>](#i-infrastructure-readiness)
            * [<strong>1. Network Configuration</strong>](#1-network-configuration)
               * [<strong>1.1 VPC Creation</strong>](#11-vpc-creation)
               * [<strong>1.2 Subnet Creation</strong>](#12-subnet-creation)
               * [<strong>1.3 Security Group Creation</strong>](#13-security-group-creation)
               * [<strong>1.4 Internet Gateway Creation</strong>](#14-internet-gateway-creation)
               * [<strong>1.5 NAT Gateway Creation</strong>](#15-nat-gateway-creation)
               * [<strong>1.6 Route Table Setup</strong>](#16-route-table-setup)
               * [<strong>1.7 Network Access Control List (NACL) setup</strong>](#17-network-access-control-list-nacl-setup)
            * [<strong>2. Load Balancer Setup</strong>](#2-load-balancer-setup)
            * [<strong>3. EFS Shared File System Creation</strong>](#3-efs-shared-file-system-creation)
         * [<strong>II. Database Installation and Setup</strong>](#ii-database-installation-and-setup)
         * [<strong>III. Application Installation</strong>](#iii-application-installation)
            * [<strong>1. Image Creation</strong>](#1-image-creation)
            * [<strong>2. Registry Upload</strong>](#2-registry-upload)
            * [<strong>3. ECS FARGATE Setup</strong>](#3-ecs-fargate-setup)
         * [<strong>IV. Securing Application</strong>](#iv-securing-application)
         * [<strong>V. Logging and Alarming</strong>](#v-logging-and-alarming)
      * [<strong>Deployment Automation</strong>](#deployment-automation)
      * [<strong>Application Automation</strong>](#application-automation)
      * [<strong>Recommendations</strong>](#recommendations)
         * [<strong>Improvements</strong>](#improvements)
         * [<strong>Features not delivered in this Phase</strong>](#features-not-delivered-in-this-phase)
      * [<strong>Resources</strong>](#resources)
      * [<em><strong>License</strong></em>](#license)
      * [<strong>Business Sign-OFF</strong>](#business-sign-off)

# __CURRENT BUSINESS STATUS__

A company in Australia currently have a web application running on-premisis in a Linux virtual machine. The application is being used by hundreds of customers every day and it is based on Wordpress which uses LAMP stack (Linux, Apache, MySQL and PHP) to offer great products.

Currently the solution is hosted in a single server (application and database) and deployments are made through FTP transfers to the server.

 ![CURRENT WORKFLOW](./images/Current_State.jpg)

## __Business Problem Statement__
The CEO is worried that a traffic peak may bring down the website whih is a great loss to the business as a whole.

## __Business Requirement__
The CEO wanted to migarte the On-premesis Web Application to AWS cloud and below are the requirements for the pilot migration project. 

*  Containeraize the application using Docker.
*  The application needs to be secure (all data encrypted at rest and in transit).
*  The application needs to be Highly Available.
* The application needs to support peaks of up to 10 times the average load (scalability).
* The infrastructure needs to be reproducible and version controlled in case the CEO decides to expand the business to other parts of the world (consider infra as code).
* There must be an easy and secure way of developing, with fast feedback (consider CI/CD practices or at least automation scripts).

### __Project Timeline__
The pilot project is expected to be completed and reviewed by mid August 2020, and ready for demostration on **17th August 2020**

## __Deliverables__
* A solution diagram containing all the components of the solution and explaining the data flow.
    ![Solution Diagram](./images/da-project-group3.png)
* Automatic Deployemnt strategy.
* Strategy for Logging and Alarming the health of the system.
* Strategy for handling application component failure.
* List Improvements or Features not delivered in this phase

## __Assumptions__

1. Data Migration is out of scope as it is a pilot migration.
2. Consider to include the Unit/Integration/service test in the CI pipeline or automation scripts.
3. Single GitHib repo will be delivered.
4. This pilot migration will be delivered using Terraform code.

# __Technology Solution Walkthrough__

## __Technology Products / Services__
 After detailed brainstroming discussion and also considering the timelines of delivery, it is best to go with serverless in every layer of architecture possible. 
This way the infrastructrue resources are managed by AWS and gives good High Availability and Reliability to AWS resources. 

Below are the Technology Products chosen to deliver the Migration solution.


| REQUIREMENT                  |  TECHNOLOGY                  |
|------------------------------|:-----------------------------|
|  Version Control System(VCS) |  GitHub                      |
|  Infra as Code               |  Terraform                   |
|  PipeLine Tools              |  GitHub Actions              |
|  Containerization            |  Docker / Docker - Compose   |
|  Relational Database         |  AURORA RDS MySQL Serverles  |
|  Container orchestrator      |  ECS FARGATE                 |
|  Container Registry          |  ECR                         |


## __Pre-Requisites__
Below are the pre-requisite that needs to be setup for the team to go ahead with the provisioning of Cloud Infrastructure and application build.

| No  |  PRE-REQUISITE                                | STATUS          |
|-----|:----------------------------------------------|:----------------|
|  1  | AWS Account Creation                          | Completed       |
|  2  | Terraform Install - Teams member's laptop     | Completed       |
|  3  | GitHub Install - Team member's laptop         | Completed       |
|  4  | AWS CLI Install - Team member's laptop        | Completed       |
|  5  | Docker Install - Team member's laptop         | Completed       |
|  6  | Solution Diagram Review and Acceptance        | Completed       |
|  7  | GitHub Repository Creation                    | Completed       |
|  8  | JQ Installation -Team member's laptop         | Completed       |
|  9  | Domain Name Registration                      | In Progress     |
| 10  |                                               |                 |
|     |                                               |                 |

### __INSTALLATION STEPS__

Installation of Wordpress Application requires the Infrastructure to be available to deploy the application. Terraform is used for the creation of Infrastructure and related Networks.  

Below are the steps followed for the setup of Infrastructure and related networks.

#### __1. NETWORK CONFIGURATION__

##### __1.1 VPC CREATION__
Virtual Private Cloud 


## __Installation Steps__

Installation of Wordpress Application requires the Infrastructure to be available to deploy the application. Terraform is used for the creation of Infrastructure and related Networks.  

Below are the different stages of Application Installation and readiness.
   1. Infrasture Readiness
   2. Application Installation
   3. Securing Application
   4. Logging and Alarming

### __I. Infrastructure Readiness__

A Well architected Infrastructure needs to have High Availability, Reliability. The AWS cloud is built in Sydney region, considering the users are specific to Australia. 
Also, the infrastructure is built across 3 availability zones (ap-southeast-2) to achieve High Availabiity in case of diaster.
  
#### __1. Network Configuration__

##### __1.1 VPC Creation__
Virtual Private Cloud

##### __1.2 Subnet Creation__
In progress - to be updated

##### __1.3 Security Group Creation__
In progress - to be updated

##### __1.4 Internet Gateway Creation__
In progress - to be updated

##### __1.5 NAT Gateway Creation__
In progress - to be updated

##### __1.6 Route Table Setup__
In progress - to be updated

##### __1.7 Network Access Control List (NACL) setup__
In progress - to be updated

#### __2. Load Balancer Setup__
In progress - to be updated

#### __3. EFS Shared File System Creation__
In progress - to be updated

### __II. Database Installation and Setup__
In progress - to be updated


### __III. Application Installation__

#### __1. Image Creation__


#### __2. Registry Upload__
In progress - to be updated

#### __3. ECS FARGATE Setup__
In progress - to be updated

### __IV. Securing Application__
In progress - to be updated

### __V. Logging and Alarming__
In progress - to be updated


##  __Deployment Automation__

DockerFile

MakeFile

Automatic Deployment Steps

## __Application Automation__

Below are the steps to be followed to run automatic deployment of application cluster.

## __Recommendations__

### __Improvements__


### __Features not delivered in this Phase__


## __Resources__

[WORDPRESS BEST PRACTISE] (https://aws.amazon.com/blogs/architecture/wordpress-best-practices-on-aws/)
[AUTOMATING WORDPRESS] (https://medium.com/@beBrllnt/from-30-minutes-to-10-seconds-automating-wordpress-setup-5ff7526942c0)

## ___License___

[LICENSE](./LICENSE)


## __Business Sign-OFF__

| DENIS SILVA       |       CAIO TREVISAN      |        KIKO COLLET     |
|-------------------|:-------------------------|:-----------------------|
|              <br> |                      <br>|                    <br>|
|                   |                          |                        |

