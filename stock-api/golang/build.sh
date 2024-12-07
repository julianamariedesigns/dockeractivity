#!/bin/sh

# Change to the src directory
cd src

# Build the Go application and output the binary to the parent directory
go build -o ../server .