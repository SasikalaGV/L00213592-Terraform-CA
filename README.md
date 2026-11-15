# Terraform and Sentinel Policy-as-Code Assignment

## Student Information

**Student Name:** Sasikala Varatharajan  
**Assignment:** Terraform Sentinel Policy-as-Code Implementation  
**Platform:** AWS Free Tier, Terraform, HashiCorp Sentinel  
**Version Control:** GitHub

---

# 1. Introduction

Based on the given assignment, I have to create Sentinel policies to prevent the infrastructure team from deploying cloud infrastructure that breaks the sovereignty or security rules. 

Using Policy-as-Code as a solution, I tried using Terraform and HashiCorp Sentinel.The infrastructure is written in Terraform, and HashiCorp Sentinel policies check every Terraform plan in HCP Terraform before apply.  

 
The solution addresses three key governance domains:

- Digital Sovereignty
- Supply Chain Security
- Infrastructure Security

Terraform is used to define infrastructure while Sentinel is used to evaluate the Terraform configuration and enforce organization policies.

---


# 2. Solution Architecture

The solution consists of:

- Terraform Infrastructure as Code (IaC)
- Sentinel Policy-as-Code controls
- AWS deployment target
- PASS and FAIL test scenarios
- Terraform execution plans
- Policy validation evidence

The implementation enforces governance controls before infrastructure deployment by evaluating Terraform configurations against Sentinel policies.

# 3. Project Structure
![alt text](images/structure.png)


# 4.  Terraform Configuration

Terraform was used to define AWS infrastructure resources and generate execution plans.

## Terraform Features Implemented

- AWS Provider Configuration
- Version Pinning
- EC2 Deployments
- Security Groups
- Encryption Controls
- VPC Module Usage
- Terraform Lock File Management

Provider version pinning was implemented to support secure and repeatable deployments.

Example:

```hcl
terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.95.0"
    }
  }
}
```

---

# 5. Sentinel Policies Implemented

Eight Sentinel policies were implemented.

| Policy | Security Domain |
|----------|----------|
| approved_region | Digital Sovereignty |
| data_residency | Digital Sovereignty |
| approved_providers | Supply Chain Security |
| provider_versions | Supply Chain Security |
| trusted_modules | Supply Chain Security |
| approved_instance_types | Infrastructure Security |
| encrypted_ebs | Infrastructure Security |
| network_security | Infrastructure Security |

---
By using HCP Terraform free version, I have created an organisation "ATU-DevOps-L00213592" for the project and created a workspace called "L00213592-Terraform-CA2". While creating the Policy set, I found that the Policy set has no option to connect to the GitHub repository. Then found that the free edition is limited to one policy set. So, I manually created one policy file and combined all the sentinel policies in one file "combined_policy.sentinel". 

By using terraform login from local command prompt I have connected to the HCP terraform and invoked the run to get test the policies.

# 6. Policy Descriptions

## approved_region

Ensures Terraform deployments are restricted to approved AWS regions.

Approved Regions:

- eu-west-1
- eu-west-2
- eu-central-1

---
![Approved Region-Pass](images/Terraform_Approved_region_Testcase.png)
![tfplan](images/Terraform_Approved_region_tfpan_create.png)

![Approved Region-Fail](images/terraform_fail_approved_region_init.png)
![tfplan](images/terraform_fail_approved_region_create_tfplan.png)

## data_residency

Ensures sensitive storage resources contain approved residency tags.

Required Tag:

```text
data_residency = ireland
```
![data_residency_pass](images/Terraform_data_residency_init.png)
![tfplan](images/Terraform_data_residency_create_tfplan.png)

![data_residency_fail](images/Terraform_fail_data_residency_init.png)
![tfplan](images/Terraform_fail_data_residency_create_tfplan.png)
---

## approved_providers

Restricts Terraform provider usage to approved provider sources.

Approved Sources:

- hashicorp/aws
- hashicorp/random
- hashicorp/null
---
![Approved_provider_pass](images/Terraform_Approved_provider_init.png)
![tfplan](images/Terraform_Approved_provider_create_testfile.png)

![approved_provider_fail](images/terraform_fail_approved_providers_init.png)
![tfplan](images/terraform_fail_approved_providers_create_tfplan.png)

## provider_versions

Enforces provider version pinning to approved versions.

Approved Version:

```text
5.95.0
```
![provider version - pass](images/Terraform_provider_version_init.png)
![tfplan](images/Terraform_provider_version_create_tfplan.png)

![provider version -fail](images/terraform_fail_provider_validate_init.png)
![tfplan](images/terraform_fail_provider_validate_create_tfplan.png)

---

## trusted_modules

Requires Terraform modules to originate from trusted sources and use explicit version pinning.
![trusted modules -pass](images/Terraform_trusted_modules_init.png)
![tfplan](images/Terraform_trusted_modules_create_tfplan.png)

![trusted modules-fail](images/terraform_fail_trusted_modules_init.png)
![tfplan](images/terraform_fail_trusted_modules_create_tfplan.png)
---

## approved_instance_types

Restricts EC2 deployments to approved instance types.

Approved Types:

- t3.micro
- t3.small
- t3.medium
![approved_instance-pass](images/Terraform_approved_instance_types_init.png)
![tfplan](images/Terraform_approved_instance_types_create_tfplan.png)

![approved_instance-fail](images/terraform_fail_approved_instance_types_init.png)
![tfplan](images/terraform_fail_approved_instance_types_create_tfplan.png)
---

## encrypted_ebs

Ensures EBS root volumes are encrypted.
![ebs-pass](images/Terraform_encrypted_ebs_init.png)
![tfplan](images/Terraform_encrypted_ebs_create_tfplan.png)

![ebs-fail](images/Terraform_fail_encrypted_ebs_init.png)
![tfplan](images/Terraform_fail_encrypted_ebs_create_tfplan.png)
---

## network_security

Prevents insecure network configurations.

Controls:

- IMDSv2 required
- No public SSH access
- Secure ingress configuration
![network-pass](images/terraform_network_security_init.png)
![tfplan](images/terraform_network_security_create_tfplan.png)

![network - fail](images/terraform_fail_network_security_init.png)
![tfplan](images/terraform_fail_network_security_create_tfplan.png)
---

# 7. Testing Methodology

Both compliant and non-compliant Terraform configurations were created.

Each test case followed the same workflow:

```bash
terraform init
terraform validate
terraform plan -out=tfplan
terraform show -json tfplan > tfplan.json
```

The resulting Terraform plans were evaluated against Sentinel policies.

---

# 8. PASS Test Cases

The following compliant configurations were successfully validated:

| Test Case |
|------------|
| approved_region |
| data_residency |
| approved_providers |
| provider_versions |
| trusted_modules |
| approved_instance_types |
| encrypted_ebs |
| network_security |

Expected Policy Result:

```text
PASS
```

---

# 9. FAIL Test Cases

The following non-compliant configurations were intentionally created to demonstrate policy enforcement:

| Test Case | Violation |
|------------|------------|
| approved_region | Unapproved AWS Region |
| data_residency | Invalid Residency Tag |
| approved_providers | Unapproved Provider Source |
| provider_versions | Unapproved Provider Version |
| trusted_modules | Missing Module Version |
| approved_instance_types | Unapproved Instance Size |
| encrypted_ebs | Encryption Disabled |
| network_security | Public SSH Access |

Expected Policy Result:

```text
FAIL
```

---
# 10. Results from HCP Terraform
![alt text](images/HCP-terraform-Runupdate.png)
![alt text](<images/Result from HCP-TerraformRun.png>)

![Result](images/HCP-Terraform-FinalUpdate.png)


# 10. Supply Chain Security Risks

The Sentinel policies reduce supply-chain risk but cannot fully eliminate all threats.

Residual risks include:

- Compromised provider binaries
- Malicious Terraform modules
- Source repository compromise
- CI/CD pipeline compromise
- Credential theft
- Insider attacks
- Runtime configuration drift

Additional controls such as code review, signed commits, CI/CD security scanning, and least-privilege IAM permissions would be required.

---


---

# 12. Validation Checklist

| Requirement | Status |
|------------|------------|
| Terraform Configuration | Complete |
| Sentinel Policies | Complete |
| AWS Provider Configuration | Complete |
| Digital Sovereignty Controls | Complete |
| Supply Chain Controls | Complete |
| Infrastructure Security Controls | Complete |
| PASS Test Cases | Complete |
| FAIL Test Cases | Complete |
| Terraform Plans Generated | Complete |
| Evidence Captured | Complete |
| GitHub Repository Created | Complete |

---

# 13. AI usage

For this assignment I used Copilot with Agent GLP6.5. Since I am entirely new to this Infrastructure project, I requested the Agent to walkthrough the assignment step by step.

Prompts used:

To understand the assignment:

1. Explain the given assignment step by step 
2. What is hashicorp sentinel and how to use it with terraform files
3. I do have aws free account and please guide me to include my account to test the files

Prompt used while working with the files:
1. Explain the terraform files 
2. explain the sentinel files and the usage
3. how to create the tfplan files for pass and fail scenarios and stepts to safe the file
4. Since I had difficulties with checkingin the .terraform large files, I used, guide me to checkin the terraform files in git
5. what does digital sovereignty mean, why does it matter if data is in ireland
6. Sentinel cli in laptop couldn't test the sentinel file, what is the workaround to test it
7. what is hashicorp and how to create HCP terraform account
8. Guide me to create Organisation and workspace for the assignment
9. What is the workaround if there is no option to add policy in the policyset
10. difference between advisory, soft mandatory and hard mandatory in sentinel?
11. how to run the policies using the cli 
12. guide me to write read me file

# 14. Conclusion

This project demonstrates the practical implementation of Policy-as-Code using HashiCorp Terraform and Sentinel. The solution successfully enforces governance requirements related to digital sovereignty, supply chain security, and infrastructure security while providing both compliant and non-compliant test scenarios to validate policy effectiveness.

The implementation shows how Sentinel can be used to evaluate infrastructure before deployment, reducing operational risk and improving cloud governance across AWS environments.
