Day 63 — IAM Users & Roles Practice


⸻

1. IAM Overview

IAM stands for Identity and Access Management.

AWS IAM is used to control:

* Who can access AWS
* What AWS resources they can access
* What actions they can perform
* Under what conditions they can access resources

The main IAM concepts are:

* Users
* Groups
* Policies
* Roles

⸻

2. IAM Users

An IAM user is an identity in an AWS account.

A user can represent:

* A person
* An application
* A workload that requires long-term credentials

Example user created during practice:

devops-practice-user

An IAM user starts with no permissions by default.

Permissions must be granted through:

* Policies attached directly to the user
* Policies attached to a group that the user belongs to

AWS recommends using groups to simplify permission management for multiple users.

⸻

3. IAM Groups

An IAM group is a collection of IAM users.

Groups are useful because permissions can be assigned to the group instead of individually assigning the same permissions to every user.

Example:

DevOps-Practice-Group

User added to the group:

devops-practice-user

Permission flow:

IAM User
    ↓
IAM Group
    ↓
IAM Policy
    ↓
AWS Resource Permissions

Example:

devops-practice-user
        ↓
DevOps-Practice-Group
        ↓
ReadOnlyAccess

The user inherits the permissions attached to the group.

⸻

4. IAM Policies

An IAM policy is a document that defines permissions.

A policy specifies things such as:

* Effect
* Action
* Resource
* Conditions

A policy can allow or deny actions.

Basic structure:

Effect
    ↓
Allow / Deny
Action
    ↓
What operation can be performed
Resource
    ↓
Which resource the action applies to

AWS evaluates the policies that apply to a request to determine whether the request is allowed or denied.

⸻

5. AWS Managed Policies

AWS managed policies are policies created and maintained by AWS.

They are designed for common use cases.

Examples:

ReadOnlyAccess
IAMReadOnlyAccess
AmazonEC2ReadOnlyAccess

AWS can update AWS managed policies when AWS services and APIs change.

Therefore, the permissions in an AWS managed policy can change over time.

⸻

6. ReadOnlyAccess Policy

During the practice, we searched for:

ReadOnlyAccess

The correct policy was:

ReadOnlyAccess

It appeared as:

AWS managed - job function

This policy provides read-only access to AWS services and resources.

It allows actions such as:

List
Get
Describe
View

It does not provide normal mutating permissions such as:

Create
Delete
Modify

Important:

ReadOnlyAccess is broader than a service-specific read-only policy.

For example:

ReadOnlyAccess

provides read-only access across AWS services and resources, while:

AmazonEC2ReadOnlyAccess

is specifically for Amazon EC2.

⸻

7. Creating the IAM Group

Created group:

DevOps-Practice-Group

Attached policy:

ReadOnlyAccess

Then added:

devops-practice-user

to the group.

Final structure:

DevOps-Practice-Group
        │
        ├── ReadOnlyAccess
        │
        └── devops-practice-user

⸻

8. IAM User Console Access

Created IAM user:

devops-practice-user

Console access was enabled for the user.

The user can sign in to the AWS Management Console using:

AWS Account ID / Account Alias
IAM Username
Password

The user was then used to test the read-only permissions.

⸻

9. Testing ReadOnlyAccess

Logged in as:

devops-practice-user

Opened:

EC2
    ↓
Instances

The user was able to view EC2 resources.

We also opened:

EC2
    ↓
Launch an instance

Important lesson:

Being able to open an AWS console page does not necessarily mean the user has permission to successfully perform the action.

The actual AWS API action must be authorized.

For example, launching an EC2 instance requires permissions such as:

ec2:RunInstances

Since our user has read-only permissions, we did not launch an instance.

This also avoided creating an unnecessary billable resource.

⸻

10. Customer Managed Policies

After practicing with an AWS managed policy, we created our own policy.

A customer managed policy is a standalone policy that we create and manage in our own AWS account.

Policy name:

EC2-Describe-Only

Customer managed policies are useful when we need permissions specifically designed for our own use case.

Example:

AWS Managed Policy
        ↓
Created and maintained by AWS
Customer Managed Policy
        ↓
Created and maintained by us

⸻

11. Creating EC2-Describe-Only Policy

Created the policy using the JSON policy editor.

Policy:

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances"
            ],
            "Resource": "*"
        }
    ]
}

Policy name:

EC2-Describe-Only

Description:

Allows read-only access to describe EC2 instances.

⸻

12. Understanding the Policy JSON

Version

"Version": "2012-10-17"

Specifies the version of the IAM policy language being used.

⸻

Statement

"Statement": [
]

Contains the permission statements.

A policy can contain one or more statements.

⸻

Effect

"Effect": "Allow"

Specifies whether the statement allows or denies the action.

Possible values:

Allow
Deny

⸻

Action

"Action": [
    "ec2:DescribeInstances"
]

Specifies the AWS API action that the policy controls.

In this case:

ec2:DescribeInstances

allows the identity to describe EC2 instances.

⸻

Resource

"Resource": "*"

Specifies the resources to which the permission applies.

* means all applicable resources.

⸻

13. Attaching the Custom Policy

The custom policy:

EC2-Describe-Only

was attached to:

DevOps-Practice-Group

The group now had two policies:

1. ReadOnlyAccess
2. EC2-Describe-Only

Final structure:

DevOps-Practice-Group
        │
        ├── ReadOnlyAccess
        │
        └── EC2-Describe-Only
                 │
                 ▼
        devops-practice-user

Because the user belongs to the group, the user receives the permissions from the group’s policies.

⸻

14. Multiple Policies

An IAM identity can receive permissions from multiple applicable policies.

In our example:

devops-practice-user
        ↓
DevOps-Practice-Group
        ↓
 ┌──────────────────────┐
 │ ReadOnlyAccess       │
 │ EC2-Describe-Only    │
 └──────────────────────┘

The effective permissions are evaluated from the policies that apply to the request.

Important:

An Allow does not override an applicable explicit Deny.

AWS evaluates all relevant policies when deciding whether a request is authorized.

⸻

15. IAM Policy Simulator

We used the IAM Policy Simulator to test permissions.

Identity tested:

devops-practice-user

Action tested:

ec2:DescribeInstances

Result:

Allowed

The simulator showed that the action was allowed.

This demonstrated that the user was receiving the permissions through the attached policies.

⸻

16. Important IAM Lesson From Policy Simulator

The simulator helped us understand:

User
  ↓
Group membership
  ↓
Group policies
  ↓
Effective permissions

We attempted to find actions such as:

TerminateInstances
StopInstances
RunInstances

in the current simulator interface, but they were not available in the action list we were using.

We therefore did not perform any destructive EC2 operation.

Important concept:

DescribeInstances
        ↓
Read / view information
RunInstances
        ↓
Create / launch EC2 instance
StopInstances
        ↓
Stop an EC2 instance
TerminateInstances
        ↓
Delete an EC2 instance

⸻

17. IAM Roles

An IAM role is different from an IAM user.

A role is an identity that has permissions but is not permanently associated with a specific person.

A role can be assumed by trusted entities such as:

* AWS services
* IAM users
* Applications
* Workloads
* Users from another AWS account

Basic concept:

IAM User
    ↓
Can assume
    ↓
IAM Role
    ↓
Permissions
    ↓
AWS Resources

Roles are especially important in DevOps because applications and AWS services commonly use roles instead of storing long-term access keys.

⸻

18. User vs Group vs Policy vs Role

User

Represents an AWS identity.

Example:

devops-practice-user

⸻

Group

A collection of IAM users.

Example:

DevOps-Practice-Group

⸻

Policy

Defines permissions.

Example:

EC2-Describe-Only

⸻

Role

An identity with permissions that can be assumed by a trusted principal.

Example:

EC2-Role

⸻

19. IAM Access Keys

We created an access key for:

devops-practice-user

The access key consists of:

Access Key ID
Secret Access Key

Access keys are used for programmatic access to AWS.

For our practice, the use case was:

Command Line Interface (CLI)

Description:

DevOps-Lab-CLI

⸻

20. Access Key Security

The secret access key is sensitive.

Never:

❌ Share the secret access key
❌ Upload it to GitHub
❌ Put it inside notes.md
❌ Put it inside source code
❌ Put it inside a public repository
❌ Send it in chat

If credentials are accidentally exposed, they should be treated as compromised and rotated/revoked immediately.

⸻

21. AWS CLI

AWS CLI stands for:

AWS Command Line Interface

It allows us to interact with AWS services from the terminal.

First check whether AWS CLI is installed:

aws --version

Example output:

aws-cli/2.x.x

⸻

22. Configuring AWS CLI

Configure AWS CLI using:

aws configure

It asks for:

AWS Access Key ID
AWS Secret Access Key
Default region name
Default output format

Example:

AWS Access Key ID [None]: YOUR_ACCESS_KEY
AWS Secret Access Key [None]: YOUR_SECRET_KEY
Default region name [None]: us-east-1
Default output format [None]: json

Never put real credentials into this notes file.

⸻

23. AWS CLI Credential Files

AWS CLI commonly stores configuration under:

~/.aws/

Important files include:

~/.aws/credentials
~/.aws/config

The credentials file can contain sensitive credentials.

Therefore:

DO NOT upload ~/.aws/credentials to GitHub.

⸻

24. Testing AWS CLI Authentication

After configuring AWS CLI, use:

aws sts get-caller-identity

This command shows the AWS identity currently being used by the CLI.

Example output:

{
    "UserId": "USER_ID",
    "Account": "ACCOUNT_ID",
    "Arn": "arn:aws:iam::ACCOUNT_ID:user/devops-practice-user"
}

Important fields:

UserId
Account
Arn

The Arn identifies the IAM principal being used.

⸻

25. AWS CLI Authentication Flow

The complete flow is:

IAM User
    ↓
Access Key ID
+
Secret Access Key
    ↓
aws configure
    ↓
AWS CLI
    ↓
AWS STS
    ↓
aws sts get-caller-identity
    ↓
Current AWS Identity

⸻

26. IAM Permission Flow

The complete IAM permission flow practiced today:

AWS Account
     │
     ▼
IAM
     │
     ▼
IAM User
devops-practice-user
     │
     ▼
IAM Group
DevOps-Practice-Group
     │
     ├─────────────────────┐
     ▼                     ▼
ReadOnlyAccess       EC2-Describe-Only
     │                     │
     └──────────┬──────────┘
                ▼
        Effective Permissions
                │
                ▼
          AWS Resources

⸻

27. Least Privilege

Least privilege means giving an identity only the permissions required to perform its job.

Example:

Instead of:

AdministratorAccess

for every user, give only the required permissions.

For an identity that only needs to view EC2 instances:

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances"
            ],
            "Resource": "*"
        }
    ]
}

This is much narrower than giving full EC2 access.

AWS recommends reducing permissions to those required for the specific use case when possible.

⸻

28. Important Security Concepts

Authentication

Authentication answers:

Who are you?

Examples:

Username + Password
Access Key + Secret Access Key

⸻

Authorization

Authorization answers:

What are you allowed to do?

Examples:

ec2:DescribeInstances
s3:ListBucket
ec2:RunInstances

IAM primarily controls authorization after the principal has been authenticated.

⸻

29. Common IAM Terms

Term	Meaning
User	An AWS identity
Group	Collection of IAM users
Policy	Defines permissions
Role	Identity that can be assumed
Allow	Grants permission
Deny	Blocks permission
Action	AWS operation/API action
Resource	AWS object the action applies to
ARN	Amazon Resource Name
Access Key ID	Public part of programmatic credentials
Secret Access Key	Sensitive credential used with the access key
Least Privilege	Give only required permissions

⸻

30. Commands Practiced

Check AWS CLI:

aws --version

Configure AWS CLI:

aws configure

Check current AWS identity:

aws sts get-caller-identity

⸻

31. What I Practiced Today

IAM Console

* Created IAM user
* Created IAM group
* Added user to group
* Enabled console access
* Attached AWS managed policy
* Tested read-only permissions

IAM Policies

* Learned AWS managed policies
* Learned customer managed policies
* Created a JSON policy
* Created EC2-Describe-Only
* Attached the policy to a group
* Tested permissions with Policy Simulator

AWS CLI

* Created an access key for CLI practice
* Learned aws configure
* Learned AWS CLI credential locations
* Learned aws sts get-caller-identity
* Learned access key security

⸻

32. Final Architecture

                         AWS ACCOUNT
                              │
                              ▼
                             IAM
                              │
             ┌────────────────┼────────────────┐
             │                │                │
             ▼                ▼                ▼
           User             Group            Role
             │                │
             │                ▼
             │       DevOps-Practice-Group
             │                │
             │        ┌───────┴────────┐
             │        ▼                ▼
             │  ReadOnlyAccess   EC2-Describe-Only
             │
             ▼
    devops-practice-user
             │
             ▼
       AWS Console / CLI
             │
             ▼
        AWS Resources

⸻

33. Key Things I Should Remember

1. IAM controls access to AWS resources.
2. IAM users represent identities.
3. IAM groups contain users.
4. Policies define permissions.
5. Users inherit group permissions.
6. Roles are different from users and can be assumed.
7. ReadOnlyAccess provides broad read-only access.
8. Customer managed policies can be customized for specific requirements.
9. IAM policies are commonly written in JSON.
10. Effect can be Allow or Deny.
11. Action specifies what operation is allowed.
12. Resource specifies what resource the permission applies to.
13. An explicit Deny overrides an Allow.
14. IAM users have no permissions by default.
15. Least privilege is an important security principle.
16. Access keys provide programmatic access.
17. Secret Access Keys must be protected.
18. Never commit AWS credentials to GitHub.
19. AWS CLI can interact with AWS from the terminal.
20. aws sts get-caller-identity can verify the identity being used by the CLI.

⸻

34. Day 63 Status

Day 63 — IAM Users & Roles Practice
Status: COMPLETED ✅

Topics completed:

✅ IAM Users
✅ IAM Groups
✅ IAM Policies
✅ AWS Managed Policies
✅ Customer Managed Policies
✅ ReadOnlyAccess
✅ Policy JSON
✅ Policy Simulator
✅ Console Access
✅ Access Keys
✅ AWS CLI Basics
✅ IAM Permission Flow
✅ Least Privilege

⸻

