# rest-api-template
This project is a template API built with the GIN library.

# Project structure:

my-gin-api/
├── cmd/
│   └── main.go          # Entry point: initializes and runs the server
├── internal/
│   ├── handlers/        # Business logic for endpoints (e.g., handler functions)
│   │   └── user.go      # Example: handlers for a "user" resource
│   ├── models/          # Data structures (e.g., structs for requests/responses)
│   │   └── user.go      # Example: User struct
│   └── routes/          # Route definitions (grouping endpoints)
│       └── routes.go    # Sets up router groups and attaches handlers
├── go.mod               # Module dependencies
├── go.sum               # Dependency checksums
└── README.md            # Project overview, setup instructions