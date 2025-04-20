# 프로젝트 개요

Terraform을 사용한 Azure 클라우드 인프라 구성 프로젝트입니다.  
개발, 스테이징, 운영 환경을 위한 모듈 기반의 IaC(Infrastructure as Code)를 제공합니다.


# Terraform 구조

```
terraform-root/
│
├── environments/
│   ├── dev/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── terraform.tfvars
|   |   └── variables.tf
│   ├── stage/
│   └── prod/
│
├── modules/
│   ├── container-registry/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── network-security-group
│   ├── postgresql-flexible
│   ├── private-dns-zone
│   ├── resource-group/
│   ├── storage-account/
│   └── virtual-network/
│
├── .gitignore
└── README.md
```