#!/bin/bash
set -e

DUMP_FILE=$1

if [[ -z "$DUMP_FILE" ]]; then
  echo "❌ Usage: $0 chemin/vers/dump.sql"
  exit 1
fi

if [[ ! -f "$DUMP_FILE" ]]; then
  echo "❌ Fichier $DUMP_FILE introuvable"
  exit 1
fi

echo "🔄 Restauration en cours depuis $DUMP_FILE..."

docker exec -i mysql sh -c "exec mysql -uroot -proot" < "$DUMP_FILE"

echo "✅ Base MySQL restaurée depuis $DUMP_FILE"