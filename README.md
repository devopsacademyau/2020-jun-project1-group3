![GitHub repo size](https://img.shields.io/github/repo-size/devopsacademyau/2020-jun-project1-group3?label=GitHub%20Repo%20Size&logo=GitHub&style=plastic) ![GitHub contributors](https://img.shields.io/github/contributors/devopsacademyau/2020-jun-project1-group3?label=Contributors)  ![GitHub last commit](https://img.shields.io/github/last-commit/devopsacademyau/2020-jun-project1-group3?color=BROWN&style=plastic) ![GitHub issues](https://img.shields.io/github/issues/devopsacademyau/2020-jun-project1-group3?color=PURPLE&style=plastic) ![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/devopsacademyau/2020-jun-project1-group3?color=Yellow&style=plastic)

## __PROJECT TITLE:__ 

    MIGRATION OF ON-PREMISES WEB APP TO CLOUD

## __PROJECT GROUP__
    
    DEVOPSACADEMY - PROJECT - GROUP3

## __TEAM MEMBERS:__

Team "Devopsacademy Project Group3" consists of 4 tech nerds for the delivery of the Pilot project.

     -  Daniel Andrade
     -  Fernando Rolnik
     -  Jay Amaranayake
     -  Vanitha Kaliyaperumal

Table of Contents
=================

   * [Current Business Status](#current-business-status)
      * [Business Requirement](#business-requirement)
         * [Deliverables](#deliverables)
         * [Assumptions](#assumptions)
   * [Technology Solution - Getting Started](#technology-solution---getting-started)
      * [Technology Products / Services](#technology-products--services)
      * [Pre-Requisites](#pre-requisites)
      * [Installation Steps](#installation-steps)
         * [I. Infrastructure Readiness](#i-infrastructure-readiness)
         * [II. Database Installation and Setup](#ii-database-installation-and-setup)
         * [III. Application Installation](#iii-application-installation)
         * [IV. Securing Application](#iv-securing-application)
         * [V. Logging and Alarming](#v-logging-and-alarming)
      * [Deployment Automation](#deployment-automation)
      * [Application Automation](#application-automation)
      * [Recommendations](#recommendations)
      * [Resources](#resources)
      * [License](#license)
      * [Business Sign-OFF](#business-sign-off)


# Current Business Status
A company in Australia currently have a web application running on-premisis in a Linux virtual machine. The application is being used by hundreds of customers every day and it is based on Wordpress which uses LAMP stack (Linux, Apache, MySQL and PHP) to offer great products.

Currently the solution is hosted in a single server (application and database) and deployments are made through FTP transfers to the server.

 ![CURRENT WORKFLOW](./images/Current_State.jpg)

__Business Problem Statement__

The CEO is worried that a traffic peak may bring down the website whih is a great loss to the business as a whole.

## Business Requirement
The CEO wanted to migarte the On-premesis Web Application to AWS cloud and below are the requirements for the pilot migration project. 

*  Containeraize the application using Docker.
*  The application needs to be secure (all data encrypted at rest and in transit).
*  The application needs to be Highly Available.
* The application needs to support peaks of up to 10 times the average load (scalability).
* The infrastructure needs to be reproducible and version controlled in case the CEO decides to expand the business to other parts of the world (consider infra as code).
* There must be an easy and secure way of developing, with fast feedback (consider CI/CD practices or at least automation scripts).

__Project Timeline__

The pilot project is expected to be completed and reviewed by mid August 2020, and ready for demostration on **17th August 2020**

### Deliverables
* A solution diagram containing all the components of the solution and explaining the data flow.
    ![Solution Diagram](./images/da-project-group3.png)
* Automatic Deployemnt strategy.
* Strategy for Logging and Alarming the health of the system.
* Strategy for handling application component failure.
* List Improvements or Features not delivered in this phase

### Assumptions

1. Data Migration is out of scope as it is a pilot migration.
2. Consider to include the Unit/Integration/service test in the CI pipeline or automation scripts.
3. Single GitHib repo will be delivered.
4. This pilot migration will be delivered using Terraform code.

# Technology Solution - Getting Started

## Technology Products / Services
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


## Pre-Requisites
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

## Installation Steps

Installation of Wordpress Application requires the Infrastructure to be available to deploy the application. Terraform is used for the creation of Infrastructure and related Networks.  

Below are the different stages of Application Installation and readiness.
   1. Infrasture Readiness
   2. Application Installation
   3. Securing Application
   4. Logging and Alarming

### I. Infrastructure Readiness

A Well architected Infrastructure needs to have High Availability, Reliability. The AWS cloud is built in Sydney region, considering the users are specific to Australia. 
Also, the infrastructure is built across 3 availability zones (ap-southeast-2) to achieve High Availabiity in case of diaster.
  
__1. Network Configuration__

__1.1 VPC Creation__
Virtual Private Cloud

__1.2 Subnet Creation__
In progress - to be updated

__1.3 Security Group Creation__
In progress - to be updated

__1.4 Internet Gateway Creation__
In progress - to be updated

__1.5 NAT Gateway Creation__
In progress - to be updated

__1.6 Route Table Setup__
In progress - to be updated

__1.7 Network Access Control List (NACL) setup__
In progress - to be updated

__2. Load Balancer Setup__
In progress - to be updated

__3. Shared Storage Setup__
In progress - to be updated

### II. Database Installation and Setup
In progress - to be updated


### III. Application Installation

__1. Image Creation__


__2. Registry Upload__
In progress - to be updated

__3. ECS FARGATE Setup__
In progress - to be updated

### IV. Securing Application
In progress - to be updated

### V. Logging and Alarming
In progress - to be updated


## Deployment Automation

DockerFile

MakeFile

Automatic Deployment Steps

## Application Automation

Below are the steps to be followed to run automatic deployment of application cluster.

##  Recommendations

- Improvements


-  Features not delivered in this Phase


## Resources

[WORDPRESS BEST PRACTISE](https://aws.amazon.com/blogs/architecture/wordpress-best-practices-on-aws/)

[AUTOMATING WORDPRESS](https://medium.com/@beBrllnt/from-30-minutes-to-10-seconds-automating-wordpress-setup-5ff7526942c0)

## License

[LICENSE](./LICENSE)


## Business Sign-OFF

>| __DENIS SILVA__     |     __CAIO TREVISAN__      |      __KIKO COLLET__     |
>|---------------------|:---------------------------|:-------------------------|
>|              <br>   |                      <br>  |                    <br>  |
>|                     |                            |                          |

