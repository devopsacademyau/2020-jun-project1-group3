
# __PROJECT TITLE:__
## __MIGRATION OF ON-PREMISES WEB APP TO CLOUD__


### __CURRENT STATUS:__
A company in Australia currently have a web application running on-premisis in a Linux virtual machine. The application is being used by hundreds of customers every day and it is based on Wordpress which uses LAMP stack (Linux, Apache, MySQL and PHP) to offer great products.

Currently the solution is hosted in a single server (application and database) and deployments are made through FTP transfers to the server.

### __PROBLEM STATEMEMT:__
The CEO is worried that a traffic peak may bring down the website whih is a great loss to the business as a whole.

[CURRENT WORKFLOW] https://camo.githubusercontent.com/fbbfdb8c55681f6e0e9f16d33b8efb2c55aae236/68747470733a2f2f7777772e7468656d656c792e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031382f31322f4d7953514c2d5765625365727665722d312e6a7067

### __BUSINESS REQUIREMENTS:__
The CEO wanted to migarte the On-premesis Web Application to AWS cloud and below are the requirements for the pilot migration project. 

*  Containeraize the application using Docker.
*  The application needs to be secure (all data encrypted at rest and in transit).
*  The application needs to be Highly Available.
* The application needs to support peaks of up to 10 times the average load (scalability).
* The infrastructure needs to be reproducible and version controlled in case the CEO decides to expand the business to other parts of the world (consider infra as code).
* There must be an easy and secure way of developing, with fast feedback (consider CI/CD practices or at least automation scripts).

### __PROJECT TIMELINE__
The pilot project is expected to be completed and reviewed by mid August 2020, and ready for demostration on **17th August 2020**

### __DELIVERABLES:__
* A solution diagram containing all the components of the solution and explaining the data flow.
    ![Solution Diagram](./images/da-project1.png)
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

| REQUIREMENT                  |  TECHNOLOGY                |
|------------------------------|:---------------------------|
|  Version Control System(VCS) |  GITHUB                  |
|  Infra as Code               |  TERRAFORM                 |
|  PipeLine Tools              |  GITHUB ACTIONS            |
|  Containerization            |  DOCKER / DOCKER - COMPOSE  |
|  Relational Database         |  RDS MySQL AURORA           |
|  Container orchestrator      |  ECS                        |

### __PRE-REQUISITES__
As a pre-requisite below are the staps captured with staus.

| No  |  PRE-REQUISITE                            | STATUS          |
|-----|:------------------------------------------|:----------------|
| 1   | AWS Account Creation                      | Completed       |
| 2   | Terraform Install - Teams member's laptop | Completed       |
| 3   | GitHub Repository Creation                | Completed       |
| 4   | GitHub Template Configuration             |                 |
| 5   | Solution Diagram Review and Acceptance    |                 |
| 6   |                                           |                 |
| 7   |                                           |                 |



### __INSTALLATION STEPS__

#### __1. VPC CREATION__
In progress - to be updated

#### __2. SUBNET CREATION__
In progress - to be updated

#### __3. SECURITY GROUP CREATION__
In progress - to be updated

#### __4. INTERNET GATEWAY CREATION__
In progress - to be updated

#### __5. NAT GATEWAY CREATION__
In progress - to be updated

#### __6.ROUTE TABLE AND ASSOCIATIONS CREATION__
In progress - to be updated

#### __7. APPLICATION LOAD BALANCER CREATION__
In progress - to be updated

#### __8. DOCKER IMAGE CREATION AND DOCKER COMPOSE__
In progress - to be updated

#### __9. ECS REGISTRY CREATION__
In progress - to be updated

#### __10. RDS AURORA MYSQL DB CREATION__
In progress - to be updated

#### __11. ECS CLUSTER CREATION__
In progress - to be updated

#### __12. EFS CREATION__

...


### __IMPROVEMENTS RECOMMENDED__
 to be updated


### __FEATURES NOT DELIVERED IN THIS PHASE__


### __RESOURCES__

[WORDPRESS BEST PRACTISE] (https://aws.amazon.com/blogs/architecture/wordpress-best-practices-on-aws/)
[AUTOMATING WORDPRESS] (https://medium.com/@beBrllnt/from-30-minutes-to-10-seconds-automating-wordpress-setup-5ff7526942c0)


### __TEAM MEMBERS:__
Team Project Group3 has below geeks.

          * DANIEL ANDRADE
          * FERNANDO ROLNIK
          * JAY AMARANAYAKE
          * VANITHA KALIYAPERUMAL

### ___LICENSE___

[LICENSE](./LICENSE)

### __CONCLUSION__
to be updated


### __BUSINESS SIGN-OFF__

| DENIS SILVA       |       CAIO TREVISAN      |        KIKO COLLET     |
|-------------------|:-------------------------|:-----------------------|
|              <br> |                      <br>|                    <br>|
|                   |                          |                        |

