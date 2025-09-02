# Builder stage
FROM golang:1.24.4-alpine AS builder

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum
COPY go.mod ./
COPY go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the app with CGO disabled for a static binary
RUN CGO_ENABLED=0 GOOS=linux go build -o rest-api ./cmd/main.go

# ======================================================================================
# Development stage
FROM builder AS development

# Set working directory
WORKDIR /app

# Download and install air
RUN go install github.com/air-verse/air@latest

# Copy go.mod and go.sum
COPY go.mod ./
COPY go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the app with air
CMD ["air"]

# ======================================================================================
# Production stage
FROM alpine:3.19 AS production


# Set working directory
WORKDIR /app

# Copy the binary
COPY --from=builder /app/rest-api ./

# Expose port
EXPOSE 8080

# RUN apk --no-cache add ca-certificates

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/ping || exit 1

# Run the binary
CMD ["./rest-api"]