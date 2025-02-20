FROM postgres:16.7-alpine3.21

#Copy SQL script into container
COPY init.sql /docker-entrypoint-initdb.d/

#Setup ENV configuration
ENV POSTGRES_DB user
ENV POSTGRES_USER anhtt
ENV POSTGRES_PASSWORD test