# Use the official Postgres image from Docker Hub
FROM postgres:latest

# Set environment variables for Postgres
#ENV POSTGRES_DB=widgetario
#ENV POSTGRES_USER=widget_user
#ENV POSTGRES_PASSWORD=widget_password

# Copy the initialization script to the Docker image
COPY init-products-db.sh /docker-entrypoint-initdb.d/

# Ensure the script is executable
#RUN chmod +x /docker-entrypoint-initdb.d/init-products-db.sh

# Set the default environment variable for the Postgres password
ENV POSTGRES_PASSWORD=widgetario

# Expose the default Postgres port
EXPOSE 5432
