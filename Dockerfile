FROM flyway/flyway:11.3.3

# Set working directory
WORKDIR /flyway

# Copy migrations
COPY ./migrations /flyway/sql/
COPY flyway.conf /flyway/conf/flyway.conf

# Set default Flyway command
ENTRYPOINT ["flyway"]
