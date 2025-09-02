FROM golang:1.24.4-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum to cache dependencies
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go app
RUN go build -o rest-api ./cmd/main.go

# Expose port 8080
EXPOSE 8080

# Run the binary
CMD ["./rest-api"]