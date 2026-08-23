# checkpoint-terraform-iac
Managing Checkpoint firewall policy using Infrastructure as Code (Terraform), with automated validation via CI
# Checkpoint Firewall Policy as Code (Terraform)

## Overview
This repo demonstrates managing Checkpoint firewall policy using Infrastructure as Code (Terraform), applying IaC discipline to network security operations that are traditionally managed manually via SmartConsole.

## Why this project
As a network security engineer working operationally with Checkpoint firewalls, I built this to demonstrate how firewall policy — network objects, segmentation, and rules — can be version-controlled, peer-reviewed, and validated automatically, the same way application infrastructure is.

## Architecture
A synthetic company, **SK Corp**, with three-zone network segmentation:
- **DMZ** (`10.10.10.0/24`) — internet-facing hosts only
- **Internal** (`10.10.20.0/24`) — internal workstations/servers, no direct internet exposure
- **Management** (`10.10.99.0/28`) — restricted to security/infra admin access only

## Design decisions
- Least-privilege, deny-by-default segmentation across all three zones
- Small `/28` management subnet to intentionally limit blast radius
- Every object carries a `comments` field — undocumented firewall objects are a common audit finding in real operations, so this is enforced here as a habit, not an afterthought

## Scope and limitations
This repo is validated via `terraform validate` and static security scanning (`tfsec`) in CI. It is **not applied against a live Checkpoint server** — it's a portfolio demonstration of policy structure, review discipline, and IaC best practices, not a production deployment. All company names, IPs, and hosts are fictional (SK Corp).

## Structure
modules/network-objects/ → network and host object definitions
modules/firewall-rules/ → rulebase (deny-by-default, least privilege)
modules/nat-rules/ → NAT policy
environments/ → per-environment variables


## Tech
Terraform, Checkpoint Terraform Provider, GitHub Actions, tfsec

## Author
Network Security Analyst (8 years) specializing in Checkpoint firewall operations, currently applying Infrastructure as Code practices to security policy management.