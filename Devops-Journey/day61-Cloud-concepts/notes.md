DevOps Learning – Day 61 Notes

☁️ Day 61 — Cloud Concepts

Month 4 — Cloud (AWS Fundamentals)

⸻

1️⃣ What is Cloud Computing?

Cloud Computing means using computing resources over the Internet instead of purchasing and maintaining all the physical infrastructure ourselves.

These resources can include:

* Servers
* Storage
* Databases
* Networking
* Applications
* Computing power

Instead of buying a physical server, we can rent computing resources from a cloud provider and pay based on usage.

Simple Example:

Traditional approach:

Company
   ↓
Buy Physical Server
   ↓
Install OS
   ↓
Configure Network
   ↓
Maintain Hardware
   ↓
Run Application

Cloud approach:

Company
   ↓
Cloud Provider
   ↓
Create Cloud Resources
   ↓
Configure
   ↓
Run Application

Important Concept:

Cloud = On-demand IT resources over the Internet

⸻

2️⃣ Why Do We Need Cloud?

Before cloud computing, companies normally had to:

* Purchase physical servers
* Purchase storage
* Build data centers
* Maintain networking equipment
* Maintain cooling systems
* Replace faulty hardware
* Plan server capacity
* Pay for infrastructure even when it was not fully used

Cloud providers handle much of the underlying physical infrastructure.

This allows organizations to focus more on their applications and business requirements.

⸻

3️⃣ Traditional Data Center vs Cloud

Traditional Data Center

Company
   ↓
Physical Data Center
   ↓
Physical Servers
   ↓
Operating System
   ↓
Application

The company is responsible for infrastructure such as:

* Hardware
* Power
* Cooling
* Networking
* Physical maintenance
* Capacity planning

⸻

Cloud

Cloud Provider
       ↓
Data Centers
       ↓
Virtualized Infrastructure
       ↓
Cloud Services
       ↓
Application

The cloud provider manages the underlying physical infrastructure while customers consume cloud services.

⸻

4️⃣ What is a Cloud Provider?

A Cloud Provider is a company that provides computing resources and services through the Internet.

Major cloud providers include:

* AWS — Amazon Web Services
* Microsoft Azure
* Google Cloud Platform (GCP)

For our learning journey, we will focus on:

AWS
Amazon Web Services

⸻

5️⃣ Major Cloud Providers

AWS

Amazon Web Services

Provides services such as:

* Compute
* Storage
* Networking
* Databases
* Security
* Monitoring
* Containers
* Serverless computing

⸻

Microsoft Azure

Microsoft’s cloud platform.

⸻

Google Cloud

Google’s cloud computing platform.

⸻

6️⃣ Important Cloud Benefits

Cloud computing provides several important benefits.

1. Scalability

Scalability means increasing or decreasing resources according to workload requirements.

Example:

Normal traffic
      ↓
2 Servers
High traffic
      ↓
10 Servers

Resources can be increased when demand increases.

⸻

2. Elasticity

Elasticity means resources can automatically increase or decrease based on demand.

Example:

Low traffic
    ↓
2 Servers
High traffic
    ↓
10 Servers
Traffic decreases
    ↓
2 Servers

Difference:

Scalability
→ Ability to increase/decrease capacity
Elasticity
→ Ability to automatically adjust capacity according to demand

⸻

3. Pay-as-you-go

Instead of purchasing infrastructure upfront, cloud services can be consumed based on usage.

Example:

Use resources
      ↓
Pay for usage

This is one of the important characteristics of cloud computing.

⸻

4. High Availability

Cloud architectures can be designed to keep applications available even when individual resources fail.

Example:

Server 1
   ↓
Application
Server 2
   ↓
Backup / Alternative

If one resource fails, another resource can continue serving the application depending on the architecture.

⸻

5. Global Reach

Cloud providers operate infrastructure across multiple geographic locations.

This allows applications to be deployed closer to users.

Example:

India Users
     ↓
AWS Region
US Users
     ↓
AWS Region
Europe Users
     ↓
AWS Region

⸻

6. Faster Deployment

In traditional infrastructure:

Purchase Hardware
      ↓
Wait for Delivery
      ↓
Install
      ↓
Configure
      ↓
Deploy

In cloud:

Choose Service
      ↓
Configure
      ↓
Deploy

Cloud allows infrastructure to be provisioned much faster.

⸻

7️⃣ Cloud Deployment Models

There are different ways organizations can deploy cloud infrastructure.

The important models for today’s learning are:

* Public Cloud
* Private Cloud
* Hybrid Cloud

⸻

8️⃣ Public Cloud

Public cloud infrastructure is provided by a third-party cloud provider.

Examples:

* AWS
* Microsoft Azure
* Google Cloud

Example:

User
 ↓
Internet
 ↓
AWS
 ↓
Cloud Resources

The underlying infrastructure belongs to and is managed by the cloud provider.

Example:

Using an AWS EC2 instance instead of purchasing a physical server.

⸻

9️⃣ Private Cloud

A private cloud is infrastructure dedicated to a single organization.

Example:

Company
   ↓
Private Infrastructure
   ↓
Private Cloud
   ↓
Applications

The organization has greater control over the infrastructure, but it also has more responsibility for managing it.

Private cloud can be useful when organizations have strict requirements around security, compliance, control, or data location.

⸻

🔟 Hybrid Cloud

Hybrid cloud combines cloud infrastructure with private/on-premises infrastructure.

Example:

             Company
                |
       -------------------
       |                 |
 On-Premises           AWS
 Infrastructure        Cloud
       |                 |
 Internal Apps       Cloud Apps

Example:

A company may keep sensitive internal systems on-premises while running a public-facing application in AWS.

⸻

1️⃣1️⃣ Public vs Private vs Hybrid

Model	Basic Idea	Example
Public Cloud	Cloud provider infrastructure	AWS
Private Cloud	Dedicated to one organization	Company’s private cloud
Hybrid Cloud	Combination of private/on-premises and public cloud	On-premises + AWS

AWS also describes hybrid cloud as combining cloud resources with existing infrastructure. (AWS Documentation)

⸻

1️⃣2️⃣ Cloud Service Models

One of the most important concepts in cloud computing is:

IaaS
PaaS
SaaS

These describe different levels of responsibility and management.

⸻

1️⃣3️⃣ IaaS — Infrastructure as a Service

IaaS provides the basic building blocks of cloud infrastructure.

Examples include:

* Virtual machines
* Networking
* Storage
* Operating systems

Example:

AWS EC2

With IaaS, the customer has more control over the infrastructure.

Simple Understanding:

Cloud Provider
→ Physical Hardware
You
→ VM
→ OS
→ Application

IaaS provides a high level of flexibility and control. (Amazon Web Services, Inc.)

⸻

1️⃣4️⃣ PaaS — Platform as a Service

PaaS provides a platform for developers to build and deploy applications without managing the underlying infrastructure.

Example concept:

Developer
    ↓
Application
    ↓
PaaS
    ↓
Infrastructure

The cloud provider manages much of the underlying infrastructure.

The developer can focus more on the application.

⸻

1️⃣5️⃣ SaaS — Software as a Service

SaaS provides a complete software application to the user.

The provider manages:

* Infrastructure
* Operating system
* Application
* Maintenance

The user mainly uses the application.

Examples:

* Web-based email
* Online collaboration software
* Cloud-based business applications

Simple example:

User
 ↓
Browser
 ↓
Software Application
 ↓
Cloud Provider

AWS describes SaaS as software that is run and managed by the service provider. (Amazon Web Services, Inc.)

⸻

1️⃣6️⃣ IaaS vs PaaS vs SaaS

Model	You Mainly Manage	Provider Manages
IaaS	OS, applications, configuration	Physical infrastructure
PaaS	Application/code	Infrastructure and platform
SaaS	How you use the application	Almost everything

Easy way to remember:

IaaS
→ Infrastructure
PaaS
→ Platform
SaaS
→ Software

⸻

1️⃣7️⃣ Cloud Responsibility Concept

Think about it like this:

IaaS

You
├── Application
├── Runtime
├── OS
└── Configuration
Cloud Provider
├── Hardware
├── Networking
└── Physical infrastructure

PaaS

You
└── Application
Cloud Provider
├── Platform
├── OS
├── Hardware
└── Infrastructure

SaaS

You
└── Use the application
Cloud Provider
├── Application
├── Platform
├── OS
└── Infrastructure

⸻

1️⃣8️⃣ Cloud and DevOps

Cloud is very important for DevOps.

Traditional DevOps environment:

Developer
    ↓
Git
    ↓
Build
    ↓
Test
    ↓
Server
    ↓
Application

Cloud-based DevOps:

Developer
    ↓
Git
    ↓
CI/CD
    ↓
Cloud
    ↓
Infrastructure
    ↓
Application

DevOps engineers commonly work with:

* Cloud infrastructure
* Linux
* Networking
* Containers
* CI/CD
* Infrastructure as Code
* Monitoring
* Security
* Automation

⸻

1️⃣9️⃣ Connecting Today’s Learning With Previous Days

We previously learned:

Linux
 ↓
Server
 ↓
Nginx
 ↓
Networking
 ↓
Ports
 ↓
Virtual Hosts

Now we are moving to:

Cloud
 ↓
AWS
 ↓
EC2
 ↓
Networking
 ↓
Security
 ↓
Automation

The concepts we learned on Linux will continue to be useful in AWS.

For example:

Ubuntu Server
      ↓
Nginx
      ↓
Port 80

Later we can run similar infrastructure on:

AWS EC2
      ↓
Ubuntu
      ↓
Nginx
      ↓
Port 80

⸻

2️⃣0️⃣ Important Cloud Terms

Cloud Computing

Using computing resources through the Internet.

Cloud Provider

Company that provides cloud services.

Examples:

AWS
Azure
GCP

Scalability

Ability to increase or decrease capacity.

Elasticity

Ability to automatically adjust resources according to demand.

Availability

Ability of a system to remain accessible and operational.

Region

A geographic area where a cloud provider operates infrastructure.

Data Center

Physical facility containing computing infrastructure.

IaaS

Infrastructure as a Service.

PaaS

Platform as a Service.

SaaS

Software as a Service.

Public Cloud

Cloud infrastructure provided by a third-party provider.

Private Cloud

Cloud infrastructure dedicated to one organization.

Hybrid Cloud

Combination of public cloud and private/on-premises infrastructure.

⸻

🧠 2️⃣1️⃣ Key Concepts Learned Today

Today we learned:

* What cloud computing is
* Why cloud computing is used
* Traditional infrastructure vs cloud
* Cloud providers
* AWS
* Azure
* Google Cloud
* Scalability
* Elasticity
* Pay-as-you-go
* High availability
* Global reach
* Public cloud
* Private cloud
* Hybrid cloud
* IaaS
* PaaS
* SaaS
* Cloud and DevOps relationship
* Basic cloud terminology

⸻

🎯 2️⃣2️⃣ Interview Questions

Q1. What is cloud computing?

Cloud computing is the on-demand delivery of computing resources such as servers, storage, databases, and networking over the Internet.

⸻

Q2. What are the major cloud providers?

The major cloud providers are:

* AWS
* Microsoft Azure
* Google Cloud Platform

⸻

Q3. What is scalability?

Scalability is the ability to increase or decrease resources according to workload requirements.

⸻

Q4. What is elasticity?

Elasticity is the ability of a system to automatically increase or decrease resources according to demand.

⸻

Q5. What is IaaS?

IaaS stands for Infrastructure as a Service. It provides infrastructure resources such as virtual machines, storage, and networking.

⸻

Q6. What is PaaS?

PaaS stands for Platform as a Service. It provides a platform that allows developers to build and deploy applications without managing the underlying infrastructure.

⸻

Q7. What is SaaS?

SaaS stands for Software as a Service. It provides complete software applications that are managed by the service provider.

⸻

Q8. What is public cloud?

Public cloud provides cloud infrastructure through a third-party cloud provider such as AWS, Azure, or Google Cloud.

⸻

Q9. What is private cloud?

Private cloud is cloud infrastructure dedicated to a single organization.

⸻

Q10. What is hybrid cloud?

Hybrid cloud combines public cloud infrastructure with private or on-premises infrastructure.

⸻

🧪 2️⃣3️⃣ Day 61 Practice

Before moving to Day 62, make sure you can explain these without looking at the notes:

1. What is cloud computing?
2. Why do companies use cloud?
3. What is a cloud provider?
4. What is scalability?
5. What is elasticity?
6. What is public cloud?
7. What is private cloud?
8. What is hybrid cloud?
9. What is IaaS?
10. What is PaaS?
11. What is SaaS?
12. What is the difference between IaaS, PaaS and SaaS?
13. How is cloud related to DevOps?

⸻


