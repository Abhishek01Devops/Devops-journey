DevOps Learning – Day 62 Notes

☁️ AWS Overview

Month 4 — Cloud (AWS Fundamentals)

⸻

1️⃣ What is AWS?

AWS stands for Amazon Web Services.

AWS is a cloud computing platform provided by Amazon that provides on-demand IT resources over the internet.

AWS provides services such as:

* Compute
* Storage
* Networking
* Databases
* Security
* Monitoring
* Containers
* Serverless computing

Instead of purchasing and maintaining physical servers, organizations can use AWS resources when required.

⸻

2️⃣ Why Do We Use AWS?

Traditional infrastructure requires organizations to:

* Purchase physical servers
* Build or maintain data centers
* Manage hardware
* Manage networking equipment
* Manage power and cooling
* Plan server capacity
* Replace faulty hardware

With AWS, many infrastructure resources can be provisioned through cloud services.

- Traditional:

- Physical Server
-      ↓
- Install Operating System
-      ↓
- Configure Network
-      ↓
- Install Application
-      ↓
- Maintain Hardware

AWS:

- AWS
-  ↓
- Choose Service
-  ↓
- Configure
-  ↓
- Deploy
-  ↓
- Run Application

⸻

3️⃣ Benefits of AWS

Important benefits of cloud computing include:

* On-demand resources
* Scalability
* Elasticity
* High availability
* Global infrastructure
* Faster deployment
* Pay-as-you-go pricing
* Reduced hardware management

⸻

4️⃣ AWS Global Infrastructure

AWS infrastructure is organized into different geographical and physical locations.

The important concepts are:

AWS Global Infrastructure
        │
        ├── Regions
        │
        ├── Availability Zones
        │
        ├── Local Zones
        │
        └── Edge Locations

For our current learning, the most important concepts are:

Region → Availability Zone → Data Center

⸻

5️⃣ What is an AWS Region?

An AWS Region is a geographical location where AWS has infrastructure consisting of multiple Availability Zones.

Example:

US East (N. Virginia)
        ↓
Region
        ↓
us-east-1

Other examples include:

Mumbai
→ ap-south-1
Stockholm
→ eu-north-1
N. Virginia
→ us-east-1

Important:

A Region contains multiple Availability Zones.

⸻

6️⃣ What is an Availability Zone?

An Availability Zone is one or more physical data centers within an AWS Region.

Example:

AWS Region
us-east-1
     │
     ├── us-east-1a
     ├── us-east-1b
     ├── us-east-1c
     └── us-east-1d

Availability Zones are designed to be isolated from failures affecting other Availability Zones.

⸻

7️⃣ Region vs Availability Zone

Region

A geographical location containing multiple Availability Zones.

Availability Zone

One or more physical data centers within a Region.

Easy way to remember:

- Region
-   ↓
- Multiple Availability Zones
-   ↓
- One or more Physical Data Centers
-   ↓
- AWS Infrastructure

⸻

8️⃣ Why Multiple Availability Zones?

Multiple Availability Zones help improve application availability and fault tolerance.

Example:

-              AWS Region
-                  │
-          ┌───────┴───────┐
-          ↓               ↓
-        AZ-A             AZ-B
-          ↓               ↓
-        EC2              EC2

If AZ-A experiences a failure:

AZ-A ❌
AZ-B ✅

The application can continue operating from another Availability Zone if it has been designed appropriately.

Important Concept:

Multiple AZs
      ↓
Fault Isolation
      ↓
High Availability

⸻

9️⃣ AWS Region Practice

During today’s practice we identified:

Region:
US East (N. Virginia)
Region Code:
us-east-1

We also observed multiple Availability Zones inside the Region.

Example:

us-east-1a
us-east-1b
us-east-1c
us-east-1d

⸻

🔟 AWS Services

AWS provides many cloud services.

For our DevOps learning, we need to understand the purpose of the major services.

⸻

1️⃣1️⃣ Amazon EC2

EC2 stands for:

Elastic Compute Cloud

EC2 provides virtual servers in AWS.

Simple understanding:

- EC2
- ↓
- Virtual Server
- ↓
- Operating System
- ↓
- Application

Example:

- AWS EC2
-   ↓
- Ubuntu Linux
-   ↓
- Nginx
-   ↓
- Website

This will be especially important for our Linux and DevOps learning.

Day 64:

We will practice launching an EC2 instance.

⸻

1️⃣2️⃣ Amazon S3

S3 stands for:

Simple Storage Service

S3 is an object storage service.

It can be used to store:

* Files
* Images
* Backups
* Logs
* Static website files
* Application data

Simple understanding:

S3
 ↓
Object Storage
 ↓
Files / Objects

⸻

1️⃣3️⃣ Amazon VPC

VPC stands for:

Virtual Private Cloud

VPC allows us to create a logically isolated virtual network in AWS.

It can contain:

* Subnets
* Route tables
* Internet gateways
* Security groups
* Network connections

Simple understanding:

VPC
 │
 ├── Public Subnet
 │
 └── Private Subnet

VPC will become very important when we learn AWS networking.

⸻

1️⃣4️⃣ Amazon RDS

RDS stands for:

Relational Database Service

RDS is a managed relational database service.

It supports database engines such as:

* MySQL
* PostgreSQL
* MariaDB
* Oracle
* SQL Server

Simple understanding:

RDS
 ↓
Managed Database

⸻

1️⃣5️⃣ AWS IAM

IAM stands for:

Identity and Access Management

IAM controls access to AWS resources.

It involves concepts such as:

* Users
* Groups
* Roles
* Policies
* Permissions

Simple understanding:

- IAM
- ↓
- Identity
- ↓
- Permissions
- ↓
- AWS Resources

Important:

We will learn IAM properly on:

Day 63 — IAM Users & Roles

Today we only need to know what IAM is used for.

⸻

1️⃣6️⃣ Amazon CloudWatch

CloudWatch is an AWS monitoring and observability service.

It can be used for:

* Metrics
* Logs
* Alarms
* Monitoring
* Events

Example:

- EC2
- ↓
- CloudWatch
- ↓
- Metrics / Logs / Alarms

For a DevOps Engineer, monitoring is an important concept.

⸻

1️⃣7️⃣ Amazon Route 53

Route 53 is an AWS DNS service.

DNS converts domain names into IP addresses or routes traffic according to configured rules.

Example:

- www.example.com
-        ↓
-     Route 53
-        ↓
- IP Address
-       ↓
- Application

Simple understanding:

Route 53
 ↓
DNS

⸻

1️⃣8️⃣ Elastic Load Balancing

Elastic Load Balancing distributes incoming traffic across multiple targets.

Example:

-              Users
-                ↓
-          Load Balancer
-          ↙           ↘
-        EC2           EC2
-        AZ-A          AZ-B

This can help applications handle traffic and improve availability.

Simple understanding:

ELB
 ↓
Distribute Traffic
 ↓
Multiple Servers

⸻

1️⃣9️⃣ AWS Lambda

Lambda is a serverless compute service.

It allows you to run code without managing servers directly.

Simple understanding:

Event
 ↓
Lambda
 ↓
Code Executes

We don’t need to go deep into Lambda today.

⸻

2️⃣0️⃣ Important AWS Services for DevOps

Category  AWS Service	Basic Purpose
Compute	EC2	Virtual servers
Storage	S3	Object storage
Networking	VPC	Virtual network
Database	RDS	Managed database
Identity	IAM	Access and permissions
Monitoring	CloudWatch	Monitoring and logs
DNS	Route 53	DNS
Load Balancing	ELB	Traffic distribution
Serverless	Lambda	Run code without managing servers

⸻

2️⃣1️⃣ AWS Management Console

The AWS Management Console is a web-based interface used to manage AWS services.

Example:

- Browser
-   ↓
- AWS Management Console
-   ↓
- AWS Services
-   ↓
- AWS Resources

We used the AWS Console today to:

* Access AWS
* Check the Region
* Check Availability Zones
* Explore AWS infrastructure

⸻

2️⃣2️⃣ AWS CLI

AWS CLI stands for:

AWS Command Line Interface

It allows us to interact with AWS services using commands.

Example:

aws --version

Later, AWS CLI will be useful for:

* Automation
* Scripting
* DevOps workflows
* CI/CD
* Infrastructure management

We will practice AWS CLI later in the roadmap.

⸻

2️⃣3️⃣ AWS and DevOps

AWS is widely used with DevOps practices.

A simplified DevOps workflow can look like:

- Developer
-   ↓
- Git / GitHub
-   ↓
- CI/CD
-   ↓
- AWS
-    ↓
- Infrastructure
-     ↓
- Application
-    ↓
- Monitoring

As a future DevOps Engineer, important AWS areas for us include:

* EC2
* VPC
* IAM
* S3
* CloudWatch
* Load Balancing
* Route 53
* Containers
* CI/CD
* Infrastructure as Code

⸻

🧠 2️⃣4️⃣ AWS Concepts Learned Today

Today we learned:

* What AWS is
* Why AWS is used
* Benefits of AWS
* AWS Global Infrastructure
* AWS Regions
* Availability Zones
* Region vs Availability Zone
* High Availability
* EC2
* S3
* VPC
* RDS
* IAM overview
* CloudWatch
* Route 53
* Elastic Load Balancing
* Lambda
* AWS Management Console
* AWS CLI
* AWS and DevOps

⸻

🎯 2️⃣5️⃣ Interview Questions

Q1. What is AWS?

AWS is Amazon’s cloud computing platform that provides on-demand IT resources and services over the internet.

Q2. What is an AWS Region?

An AWS Region is a geographical location containing multiple Availability Zones.

Q3. What is an Availability Zone?

An Availability Zone consists of one or more physical data centers within an AWS Region.

Q4. Why are multiple Availability Zones used?

Multiple Availability Zones help provide fault isolation, high availability, and fault tolerance.

Q5. What is EC2?

EC2 is an AWS service that provides virtual servers.

Q6. What is S3?

S3 is an AWS object storage service.

Q7. What is VPC?

VPC is a logically isolated virtual network in AWS.

Q8. What is RDS?

RDS is a managed relational database service provided by AWS.

Q9. What is IAM?

IAM is AWS Identity and Access Management, used to control access to AWS resources.

Q10. What is CloudWatch?

CloudWatch is an AWS monitoring and observability service used for metrics, logs, alarms, and events.

Q11. What is Route 53?

Route 53 is an AWS DNS service.

Q12. What is a Load Balancer?

A load balancer distributes incoming traffic across multiple servers or targets.

Q13. What is AWS Lambda?

Lambda is a serverless compute service that runs code without requiring you to manage servers directly.

⸻

