#!/bin/sh

echo "Run test: Wrong postgres address"
EXPECT_RESPONSE=FAIL POSTGRES_ADDR="127.0.0.1:5432" docker-compose up --abort-on-container-exit
echo "Run test: Wrong postgres password"
EXPECT_RESPONSE=FAIL POSTGRES_ADDR="pgsql:5432" docker-compose up --abort-on-container-exit
echo "Run test: Success case"
EXPECT_RESPONSE=OK POSTGRES_ADDR="pgsql:5432" POSTGRES_PASSWORD="1pgpassword1" docker-compose up --abort-on-container-exit
