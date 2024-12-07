# Stage 1: Build the application
FROM golang:1.15.14-alpine3.14 AS builder

# Set environment variable to disable CGO
ENV CGO_ENABLED=0

# Set the working directory
WORKDIR /go/stock-api

# Copy the Go module files and download dependencies
COPY src/go.mod src/go.sum ./src/
WORKDIR /go/stock-api/src
RUN go mod download

# Go back to the main directory
WORKDIR /go/stock-api

# Copy the rest of the source code, including restore.sh and build.sh
COPY src/ ./src/
COPY restore.sh ./
COPY build.sh ./

# Make sure the restore and build scripts are executable and run them
RUN chmod +x restore.sh && ./restore.sh
RUN chmod +x build.sh && ./build.sh

# Stage 2: Create the final image
FROM alpine:3.14

# Set environment variables for the application
ENV POSTGRES_CONNECTION_STRING="host=products-db port=5432 user=postgres password=widgetario dbname=postgres sslmode=disable" \
    CACHE_EXPIRY_SECONDS="45" \
    GOLANG_VERSION="1.15.14" \
    APP_VERSION="0.4.0"

# Set the working directory for the final image
WORKDIR /app

# Copy the built binary from the builder stage
#COPY --from=builder /go/stock-api/src/server .
COPY --from=builder /go/stock-api/server .


# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["/app/server"]
