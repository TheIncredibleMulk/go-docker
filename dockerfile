# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:latest

# Add Maintainer Info
LABEL Maintainer="TheIncredibleMulk <andrew.mulkey@gmail.com"

# Set the current Working Directory in the Container
WORKDIR /app

# Copy go mod and sum files to the working directory
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current direcotry to the Working Directory inside the container
COPY . .

# Build the Go App
RUN go build -o main .

# Expose port 8080 to the outside of the container
EXPOSE 8080

# Command to run on start up
CMD ["./main"]