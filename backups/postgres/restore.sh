#!/bin/bash
set -e

DUMP_FILE=$1
DB_NAME=${2:-postgres}

if [[ ! -f "$DUMP_FILE" ]]; then
  echo "❌ Fichier $DUMP_FILE introuvable"
  exit 1
fi

cat "$DUMP_FILE" | docker exec -i -e PGPASSWORD=root postgres psql -U root -d $DB_NAME
echo "✅ Base PostgreSQL restaurée depuis $DUMP_FILE"