#!/bin/bash
set -e

DB_NAME=${1:-mydb}
FILE="/backups/${DB_NAME}_$(date +%Y%m%d_%H%M%S).sql"

docker exec mariadb sh -c "exec mysqldump -uroot -proot $DB_NAME" > "./${FILE##*/}"

echo "✅ Dump MariaDB sauvegardé dans ${FILE##*/}"