# db-trace-processor
This repo caontains DB Migrations for `api-server` and `trace-processor` repos.

# Data Migrations
Migrations are managed using Flyway. The configuration is defined in flyway.conf.

migrations/api → Contains migrations for the API database.
migrations/trace → Contains migrations for the Trace database.

# Folder Structure
```
db-trace-processor/
│── migrations/
│   ├── api/                 # Database migrations for the API database
│   ├── trace/               # Database migrations for the Trace database
│── flyway.conf              # Flyway configuration file
│── package.json             # Dependencies and scripts for managing the project
│── releaserc.json           # Configuration for Semantic Versioning bot
│── Jenkinsfile              # Deployment pipeline configuration for Jenkins
│── Jenkinsfile.commitlint   # CI pipeline for conventional commits validation
│── Jenkinsfile.prcheck      # CI pipeline for build checks
│── Dockerfile               # Docker setup for running migrations
│── .github/                 # GitHub Actions workflows (if applicable)
│── scripts/                 # Helper scripts for migration automation
│── README.md                # Project documentation

```

# Releases
- When a pull request is successfully merged, a Docker image is built.
- The Semantic Versioning bot creates a release on GitHub with a tag.
- The tagged release is used for the Docker image, which is then pushed to Docker Hub.

# Required Environment Variables
```
DB_HOST=your-db-host
DB_PORT=your-db-port
DB_NAME=your-db-name
DB_USER=your-db-user
DB_PASSWORD=your-db-password
DB_SCHEMA=your-db-schema
```
