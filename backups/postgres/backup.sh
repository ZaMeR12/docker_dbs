#!/bin/bash
set -e

DB_NAME=${1:-postgres}
FILE="/backups/${DB_NAME}_$(date +%Y%m%d_%H%M%S).sql"

docker exec -e PGPASSWORD=root postgres sh -c "exec pg_dump -U root $DB_NAME" > "./${FILE##*/}"

echo "✅ Dump PostgreSQL sauvegardé dans ${FILE##*/}"