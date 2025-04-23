# TRACE DB Migrations

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Flyway](https://img.shields.io/badge/Flyway-CC0200.svg?style=for-the-badge&logo=flyway&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED.svg?style=for-the-badge&logo=docker&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939.svg?style=for-the-badge&logo=jenkins&logoColor=white)
![Semantic Release](https://img.shields.io/badge/Semantic_Release-494949.svg?style=for-the-badge&logo=semantic-release&logoColor=white)

This repository contains database migration scripts for three services in the trace analysis ecosystem:
- [api-server](https://github.com/cyse7125-sp25-team03/api-server.git) - The main API service
- [trace-consumer](https://github.com/cyse7125-sp25-team03/trace-consumer.git) - For storing extracted data from traces
- [embedding-service](https://github.com/cyse7125-sp25-team03/embedding-service.git) - For converting extracted data into vector embeddings

## Overview

The DB Trace Processor repository manages schema evolution, database versioning, and ensures consistent database structures across all environments. It handles migrations for three distinct services within the trace analysis platform:

1. **API Server Database**: Schema and data migrations for the main API service
2. **Trace Consumer Database**: Schema for storing and tracking extracted trace data
3. **Embedding Service Database**: Schema for vector embeddings and related data

Migrations are managed using Flyway, a database version control tool that allows for reliable, repeatable database migrations across all environments.

## Migration Structure

### API Migrations
The API migrations (`migrations/api/`) handle the core application data model, including:
- User management
- Course data
- Instructor information
- Trace metadata
- Key files:
  - V1_Create_Table.sql - Initial schema creation
  - V2_Populate_Tables.sql - Seed data

### Trace Migrations
The Trace migrations (`migrations/trace/`) handle two related services:

1. **Trace Consumer**
   - Schema for storing extracted trace data
   - Tracking columns for processing status
   - Key files:
     - V1_Create_Table.sql - Initial schema creation
     - V2_Add_Tracking_Column.sql - Additional tracking metadata

2. **Embedding Service**
   - Vector embeddings schema for similarity searches
   - Tables for storing and indexing embeddings
   - Key files:
     - V3_Create_Vectors_Tables.sql - Vector storage tables

## Folder Structure

```
db-trace-processor/
│── migrations/
│   ├── api/                        # Database migrations for the API database
│   │   ├── V1_Create_Table.sql     # Initial schema creation
│   │   ├── V2_Populate_Tables.sql  # Seed data for API database
│   │
│   ├── trace/                         # Database migrations for trace processing
│       ├── V1_Create_Table.sql        # Initial schema for trace consumer
│       ├── V2_Add_Tracking_Column.sql # Tracking columns for processing
│       └── V3_Create_Vectors_Tables.sql # Vector embedding tables
│
│── flyway.conf              # Flyway configuration file
│── package.json             # Dependencies and scripts for managing the project
│── .releaserc.json          # Configuration for Semantic Versioning bot
│── Jenkinsfile              # Deployment pipeline configuration for Jenkins
│── Jenkinsfile.commitlint   # CI pipeline for conventional commits validation
│── Jenkinsfile.prcheck      # CI pipeline for build checks
│── Dockerfile               # Docker setup for running migrations
│── .github/                 # GitHub Actions workflows (if applicable)
│── scripts/                 # Helper scripts for migration automation
│── README.md                # Project documentation
```

## Vector Embeddings

The trace database includes specialized schema support for vector embeddings, which enables:

- Efficient storage of high-dimensional vectors
- Similarity searches
- AI-powered analytics on trace data
- Performance optimizations for vector operations

## Usage

### Prerequisites

- Docker (for containerized execution)
- PostgreSQL (for local testing)
- Java Runtime (for running Flyway directly)

### Running Migrations Locally

1. **Clone the repository**
   ```bash
   git clone https://github.com/cyse7125-sp25-team03/db-trace-processor.git
   cd db-trace-processor
   ```

2. **Configure environment variables**
   Create a `.env` file with the required database connection details:
   ```
   DB_HOST=your-db-host
   DB_PORT=your-db-port
   DB_NAME=your-db-name
   DB_USER=your-db-user
   DB_PASSWORD=your-db-password
   DB_SCHEMA=your-db-schema
   ```

3. **Run migrations using Docker**
   ```bash
   # For API database migrations
   docker run --env-file .env -v $(pwd)/migrations/api:/flyway/sql flyway/flyway migrate
   
   # For Trace database migrations (including both trace-consumer and embedding-service)
   docker run --env-file .env -v $(pwd)/migrations/trace:/flyway/sql flyway/flyway migrate
   ```

### Running Migrations in CI/CD

The repository includes Jenkins pipeline configurations for automating migrations:

- **Jenkinsfile**: Handles deployment of migrations
- **Jenkinsfile.commitlint**: Validates commit messages follow conventions
- **Jenkinsfile.prcheck**: Validates migrations during PRs

## Environment Variables

| Variable      | Description                                | Required |
|--------------|--------------------------------------------|----------|
| `DB_HOST`    | PostgreSQL database hostname               | Yes      |
| `DB_PORT`    | PostgreSQL database port (default: 5432)   | Yes      |
| `DB_NAME`    | PostgreSQL database name                   | Yes      |
| `DB_USER`    | PostgreSQL username with migration rights  | Yes      |
| `DB_PASSWORD`| PostgreSQL user password                   | Yes      |
| `DB_SCHEMA`  | PostgreSQL schema                          | Yes       |
| `FLYWAY_PLACEHOLDERS_APP_USER` | Application user placeholder | No    |
| `FLYWAY_CONNECT_RETRIES`   | Connection retry attempts     | No       |

## CI/CD and Releases

### CI/CD Process

This project uses Jenkins for continuous integration. The repository includes:

- `Jenkinsfile`: Main deployment pipeline
- `Jenkinsfile.commitlint`: Linting pipeline for commit messages
- `Jenkinsfile.prcheck`: Pipeline for PR validation

### Release Process

- When a pull request is successfully merged, a Docker image is built
- The Semantic Versioning bot creates a release on GitHub with a tag
- The tagged release is used for the Docker image, which is then pushed to Docker Hub
- The image tag follows semantic versioning (e.g., v1.2.3)

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-migration`)
3. Create your migration files following the naming convention `V{version}__{description}.sql`
4. Commit your changes (`git commit -m "feat: add customer table migration"`)
5. Push to the branch (`git push origin feature/amazing-migration`)
6. Open a Pull Request

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.