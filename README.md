# __PROJECT - DEVOPSACADEMY - PROJECT - GROUP3__

## __MIGRATION OF ON-PREMISES WEB APP TO CLOUD__

### __TEAM MEMBERS:__
Team "Devopsacademy Project Group3" has below tech nerds contribution.

          * DANIEL ANDRADE
          * FERNANDO ROLNIK
          * JAY AMARANAYAKE
          * VANITHA KALIYAPERUMAL


### CURRENT BUSINESS STATUS:__
A company in Australia currently have a web application running on-premisis in a Linux virtual machine. The application is being used by hundreds of customers every day and it is based on Wordpress which uses LAMP stack (Linux, Apache, MySQL and PHP) to offer great products.

Currently the solution is hosted in a single server (application and database) and deployments are made through FTP transfers to the server.

 ![CURRENT WORKFLOW](./images/Current_State.jpg)

### __BUSINESS PROBLEM STATEMEMT:__
The CEO is worried that a traffic peak may bring down the website whih is a great loss to the business as a whole.

### __BUSINESS REQUIREMENTS:__
The CEO wanted to migarte the On-premesis Web Application to AWS cloud and below are the requirements for the pilot migration project. 

*  Containeraize the application using Docker.
*  The application needs to be secure (all data encrypted at rest and in transit).
*  The application needs to be Highly Available.
* The application needs to support peaks of up to 10 times the average load (scalability).
* The infrastructure needs to be reproducible and version controlled in case the CEO decides to expand the business to other parts of the world (consider infra as code).
* There must be an easy and secure way of developing, with fast feedback (consider CI/CD practices or at least automation scripts).

#### __PROJECT TIMELINE__
The pilot project is expected to be completed and reviewed by mid August 2020, and ready for demostration on **17th August 2020**

### __DELIVERABLES:__
* A solution diagram containing all the components of the solution and explaining the data flow.
    ![Solution Diagram](./images/da-project-group3.png)
* Automatic Deployemnt strategy.
* Strategy for Logging and Alarming the health of the system.
* Strategy for handling application component failure.
* List Improvements or Features not delivered in this phase

### __ASSUMPTIONS__

1. Data Migration is out of scope as it is a pilot migration.
2. Consider to include the Unit/Integration/service test in the CI pipeline or automation scripts.
3. Single GitHib repo will be delivered.
4. This pilot migration will be delivered using Terraform code.

### __TECHNOLOGY SUGGESTION__

| REQUIREMENT                  |  TECHNOLOGY                  |
|------------------------------|:-----------------------------|
|  Version Control System(VCS) |  GITHUB                      |
|  Infra as Code               |  TERRAFORM                   |
|  PipeLine Tools              |  GITHUB ACTIONS              |
|  Containerization            |  DOCKER / DOCKER - COMPOSE   |
|  Relational Database         |  RDS MySQL AURORA            |
|  Container orchestrator      |  ECS                         |
|  Container Registry          |  ECR                         |


### __PRE-REQUISITES__
Below are the pre-requisite that needs to be done before proceeing with the Cloud Infrastructure installation.

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


##### __1.2 SUBNET CREATION__
In progress - to be updated

##### __1.3 SECURITY GROUP CREATION__
In progress - to be updated

##### __1.4 INTERNET GATEWAY CREATION__
In progress - to be updated

##### __1.5 NAT GATEWAY CREATION__
In progress - to be updated

##### __1.6 ROUTE TABLE AND ASSOCIATIONS CREATION__
In progress - to be updated

##### __1.7 NETWORK ACCESS CONTROL LIST CREATION__
In progress - to be updated

#### __2. APPLICATION LOAD BALANCER CREATION__
In progress - to be updated


#### __3. WORDPRESS IMAGE CREATION AND UPLOAD TO REGISTRY__
In progress - to be updated

#### __4. ELASTIC FILE SYSTEM (EFS) CREATION__
In progress - to be updated

#### __5. ECS CLUSTER CREATION__
In progress - to be updated

#### __6. RDS CLUSTER CREATION__
In progress - to be updated

### __TERRAFORM AUTOMATIC DEPLOYMENT__

##### DockerFile

##### MakeFile

##### Automatic Deployment Steps
Below are the steps to be followed to run automatic deployment of application cluster.

### __IMPROVEMENTS RECOMMENDED__
 to be updated


### __FEATURES NOT DELIVERED IN THIS PHASE__


### __RESOURCES__

[WORDPRESS BEST PRACTISE] (https://aws.amazon.com/blogs/architecture/wordpress-best-practices-on-aws/)
[AUTOMATING WORDPRESS] (https://medium.com/@beBrllnt/from-30-minutes-to-10-seconds-automating-wordpress-setup-5ff7526942c0)

### ___LICENSE___

[LICENSE](./LICENSE)


### __CONCLUSION__
to be updated


### __BUSINESS SIGN-OFF__

| DENIS SILVA       |       CAIO TREVISAN      |        KIKO COLLET     |
|-------------------|:-------------------------|:-----------------------|
|              <br> |                      <br>|                    <br>|
|                   |                          |                        |

