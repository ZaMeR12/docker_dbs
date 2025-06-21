#!/bin/bash
set -e

DB_NAME=$1
ARCHIVE_NAME=$2

if [[ -z "$DB_NAME" || -z "$ARCHIVE_NAME" ]]; then
  echo "❌ Usage: $0 <nom_de_la_base> <archive.tar.gz>"
  echo "   Exemple: $0 mydb mydb_20250621_170000.tar.gz"
  exit 1
fi

# Décompression + restauration dans le conteneur
docker exec mongo-tools sh -c "
  mkdir -p /backups/tmp &&
  tar -xzf /backups/$ARCHIVE_NAME -C /backups/tmp &&
  mongorestore \
    --host=mongodb \
    --username=root \
    --password=root \
    --authenticationDatabase=admin \
    --db=$DB_NAME \
    --drop \
    /backups/tmp/$DB_NAME &&
  rm -rf /backups/tmp/$DB_NAME
"

echo "✅ Base '$DB_NAME' restaurée depuis ./backups/mongodb/$ARCHIVE_NAME"
