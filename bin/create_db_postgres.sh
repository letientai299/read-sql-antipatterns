#!/bin/sh

docker exec antipatterns-pg psql -h localhost -U postgres -c "create database anti;"
