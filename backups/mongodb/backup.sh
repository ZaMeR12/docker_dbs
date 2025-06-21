#!/bin/bash
set -e

DB_NAME=$1

if [[ -z "$DB_NAME" ]]; then
  echo "❌ Usage: $0 <nom_de_la_base>"
  exit 1
fi

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="${DB_NAME}_${TIMESTAMP}.tar.gz"

# Dump + compression dans le conteneur
docker exec mongo-tools sh -c "
  mkdir -p /backups/tmp/$DB_NAME &&
  mongodump \
    --host=mongodb \
    --username=root \
    --password=root \
    --authenticationDatabase=admin \
    --db=$DB_NAME \
    --out=/backups/tmp/$DB_NAME &&
  tar -czf /backups/$ARCHIVE_NAME -C /backups/tmp $DB_NAME &&
  rm -rf /backups/tmp/$DB_NAME
"

echo "✅ Dump compressé de '$DB_NAME' créé dans ./backups/mongodb/$ARCHIVE_NAME"
