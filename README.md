# Docker Dbs

Un environnement Docker unifié pour utiliser plusieurs bases de données localement, à la manière de Devilbox.

## Services inclus

| Service    | Port  | Utilisateur | Mot de passe |
| ---------- | ----- | ----------- | ------------ |
| MariaDB    | 3306  | root        | root         |
| PostgreSQL | 5432  | root        | root         |
| Redis      | 6379  | —           | —            |
| MongoDB    | 27017 | —           | —            |

## Interfaces Web

| Interface       | URL                   | User            | Password |
| --------------- | --------------------- | --------------- | -------- |
| Adminer         | http://localhost:8080 | root            | root     |
| Mongo Express   | http://localhost:8081 |
| Redis Commander | http://localhost:8082 |
| PhpMyAdmin      | http://localhost:8083 | root            | root     |
| PgAdmin         | http://localhost:8083 | admin@admin.com | root     |

## Compatibilité entre MySQL et Mariadb

1.  Aller sur PhpMyAdmin
2.  Aller dans variables.
3.  Filtrer par collation
4.  character set collations = utf8mb4=utf8mb4_unicode_ci
5.  collation connection = utf8mb4_unicode_ci
6.  collation database = utf8mb4_unicode_ci
7.  collation server = utf8mb4_unicode_ci

## Commandes

### Démarrer

```bash
docker-compose up -d
```

### Arrêter

```bash
docker-compose down
```

### Supprimer

```bash
docker-compose down -v
```

## Données persistantes

Les données sont stockées dans des volumes Docker (`*_data`), donc elles sont conservées après arrêt/redémarrage.
