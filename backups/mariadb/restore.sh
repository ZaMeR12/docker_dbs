#!/bin/bash
set -e

DUMP_FILE=$1

if [[ ! -f "$DUMP_FILE" ]]; then
  echo "❌ Fichier $DUMP_FILE introuvable"
  exit 1
fi

docker exec -i mariadb sh -c "exec mysql -uroot -proot" < "$DUMP_FILE"
echo "✅ Base MariaDB restaurée depuis $DUMP_FILE"