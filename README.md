# REST API Template with Gin-Gonic

This repository provides a template for building robust and scalable APIs using the Gin framework in Go. It includes a pre-configured project structure, Docker support, and best practices for development and deployment.

# 📁 Project structure:
```bash
rest-api-template/
├── cmd/                 # Application entry points
│   └── main.go         # Main server initialization
├── internal/           # Private application code
│   ├── handlers/       # HTTP request handlers (business logic)
│   ├── models/         # Data structures and domain models
│   └── routes/         # Route definitions and groupings
├── pkg/                # Public library code (optional, for shared packages)
├── go.mod              # Go module dependencies
├── go.sum              # Dependency checksums
├── Dockerfile          # Multi-stage Docker configuration
├── .dockerignore       # Files to exclude from Docker builds
├── .gitignore          # Git ignore rules
├── .env                # Environment variables
└── README.md           # Project documentation
```
# ✨ Features

- Pre-built structure for a Gin-based API
- Multi-stage Docker setup for lightweight production images
- Example /ping endpoint to verify setup
- Live reloading during development with air
- Production-ready configuration

# 🛠 Prerequisites

- Go 1.24.4 or higher
- Docker for containerization
- Git for version control

# 🚀 Setup

1. Clone the Repository
```bash
git clone https://github.com/yourusername/rest-api-template.git
cd rest-api-template
```

2. Initialize Go Module
Ensure the go.mod is set to your module path:
```bash
# Update module path if needed
go mod edit -module github.com/yourusername/rest-api-template

# Sync dependencies
go mod tidy
```

3. Run Locally
Build and run the Go application:
```bash
go run cmd/main.go
```
Tet the `/ping` endpoint:
```bash
curl http://localhost:8080/ping
```

4. Run with Docker

Using docker-compose.yml:
```bash
docker-compose up --build
```
```
Test the running container:
```bash
curl http://localhost:8080/ping
```

# 📋 Usage

1. Add new endpoints in internal/handlers/
2. Define routes in internal/routes/
3. Configure Gin engine in cmd/main.go
4. Rebuild Docker image after changes for production:
```bash
docker build -t rest-api-template:prod --target production .
```

# 🤝 Contributing

1. Fork the repository
2. Create a feature branch: git checkout -b feature-name
3. Commit changes: git commit -m "Add feature-name"
4. Push to branch: git push origin feature-name
5. Open a Pull Request with clear description

# 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

# ⚠️ Work in progress ⚠️