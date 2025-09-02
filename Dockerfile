# Builder stage
FROM golang:1.24.4-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o rest-api ./cmd/main.go

# Development stage
FROM golang:1.24.4-alpine AS development

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

# Run the app directly from source (no pre-built binary needed)
CMD ["go", "run", "cmd/main.go"]

# Production stage
FROM alpine:3.19 AS production

WORKDIR /app

RUN apk --no-cache add curl

COPY --from=builder /app/rest-api ./

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/ping || exit 1

CMD ["./rest-api"]