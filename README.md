# Terraform AWS Multi-Environment Infrastructure Automation

A hands-on AWS Infrastructure as Code (IaC) project demonstrating how to provision and manage AWS infrastructure using **Terraform reusable modules** across multiple environments such as **Development, Staging, and Production**.

The project demonstrates reusable Terraform modules for provisioning **Amazon EC2, Amazon S3, and Amazon DynamoDB**, with environment-specific configuration for compute resources and infrastructure naming.

---

## Technologies

- Terraform
- AWS
- Amazon EC2
- Amazon S3
- Amazon DynamoDB
- AWS Security Groups
- AWS CLI
- HCL
- Git
- GitHub

---

# Project Overview

This project demonstrates how to automate AWS infrastructure provisioning using Terraform instead of manually creating resources through the AWS Management Console.

The project focuses on:

- Infrastructure as Code (IaC)
- Terraform reusable modules
- Multi-environment infrastructure
- Environment-specific configuration
- AWS EC2 provisioning
- AWS S3 bucket provisioning
- AWS DynamoDB table provisioning
- Security Group configuration
- Terraform variables
- Terraform resource dependencies
- Terraform execution workflow

The same reusable Terraform module is used for different environments with different infrastructure configurations.

---

# Architecture

The project uses a reusable Terraform module to provision infrastructure for:

```text
                    Terraform
                        |
                        |
                Reusable Module
                  ./infra-app
                        |
          +-------------+-------------+
          |             |             |
          v             v             v
        EC2            S3          DynamoDB
          |
      Security
       Group
