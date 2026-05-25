# Java WebApp CI/CD on AWS EKS

End-to-end DevOps project deploying a Java web application using Jenkins, Docker, and Kubernetes on AWS EKS.

**Business Impact**: Discovered and prevented $5,340/year in orphaned AWS LoadBalancer costs through CI/CD pipeline optimization.

---

### 📊 Live Demo
> **✅ Demo completed and decommissioned**  
> **Status**: De-provisioned on 2026-05-25 to prevent AWS charges. See screenshots below for proof.

---

### 🎯 Problem Solved: The $450/Month Zombie LoadBalancer

**Issue**: Each `kubectl apply` in CI/CD created a new AWS ELB. When pods were deleted, the ELBs stayed alive. Found 25 orphaned ELBs costing $18/month each.

**Fix**: Implemented Helm `hook-delete-policy` to ensure `helm uninstall` deletes the AWS resource.

**Result**: 98.9% cost reduction. Validated zero orphaned ELBs.

---

### 📸 Proof of Work

#### 1. EKS Deployment Verification
![EKS Pods](./screenshots/01-eks-pods-running.png)

#### 2. Cost Discovery: Orphaned Infrastructure 
![Zombie LB](./screenshots/02-zombie-loadbalancer-cost.png)

#### 3. Live Application on EKS
![Live App](./screenshots/03-live-app-running-on-elb.png)

#### 4. CI/CD Pipeline Remediation
![Jenkins Fix](./screenshots/04-jenkins-pipeline-fix-zombie-lb.png)

#### 5. Financial Impact Verified
![AWS Billing](./screenshots/05-aws-billing-verification.png)

#### 6. Infrastructure Teardown Verification
![ELB Deleted](./screenshots/06-elb-cleanup-verified.png)

---

### 🛠️ Tech Stack
- **CI/CD:** Jenkins, GitHub Webhooks
- **Containerization:** Docker, Amazon ECR
- **Orchestration:** Kubernetes, AWS EKS
- **Cloud:** AWS EC2, EKS, ELB, IAM
- **IaC:** Helm Charts, Kubernetes YAML

### 🧠 What I Learned
1. **K8s ≠ Cloud-agnostic**: `Service type: LoadBalancer` has real AWS costs
2. **FinOps is DevOps**: Found $5.3k/year waste using `kubectl` + Cost Explorer
3. **Always Teardown**: Demo environments need automated cleanup
