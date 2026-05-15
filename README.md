# mcp-infra-demo

A minimal cloud infrastructure demo for deploying MCP (Model Context Protocol) servers using Cloudflare Workers + Google Cloud Platform, provisioned with Terraform and deployed via GitHub Actions CI/CD.

> Built to demonstrate cloud engineering skills relevant to Manufact's infrastructure stack.

## Architecture
## Stack

| Layer | Technology |
|-------|-----------|
| Edge compute | Cloudflare Workers |
| Cloud storage | Google Cloud Storage |
| Auth & IAM | GCP Service Accounts |
| Infrastructure as Code | Terraform |
| CI/CD | GitHub Actions |

## MCP Server Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Health check |
| `/tools` | GET | List available MCP tools |
| `/call` | POST | Execute an MCP tool |

## Project Structuremcp-infra-demo/
├── worker/
│   └── index.js          # Cloudflare Worker (MCP server)
├── terraform/
│   ├── main.tf           # GCP resources
│   ├── variables.tf      # Input variables
│   └── outputs.tf        # Output values
├── .github/
│   └── workflows/
│       └── deploy.yml    # CI/CD pipeline
└── README.md

## Setup & Deploy

### Prerequisites
- GCP account + project
- Cloudflare account
- GitHub account
- Terraform installed locally

### 1. Clone the repo
```bash
git clone https://github.com/yourusername/mcp-infra-demo
cd mcp-infra-demo
```

### 2. Add GitHub Secrets
Go to your repo → Settings → Secrets → Actions and add:

| Secret | Where to get it |
|--------|----------------|
| `GCP_CREDENTIALS` | GCP Console → IAM → Service Accounts → JSON key |
| `GCP_PROJECT_ID` | GCP Console → Project selector |
| `CLOUDFLARE_API_TOKEN` | Cloudflare → My Profile → API Tokens |
| `CLOUDFLARE_ACCOUNT_ID` | Cloudflare → Dashboard → right sidebar |

### 3. Push to main
```bash
git add .
git commit -m "initial infra setup"
git push origin main
```

GitHub Actions will automatically provision GCP and deploy the Cloudflare Worker.

## Why This Stack?

This mirrors Manufact's production architecture — Cloudflare Workers for edge MCP server deployment, GCP for cloud storage and IAM, Terraform for reproducible infrastructure, and GitHub Actions for automated deployments. The goal was to build a minimal but real version of "Vercel for MCP."