# Docker Dbs

Un environnement Docker unifié pour utiliser plusieurs bases de données localement, à la manière de Devilbox.

## Table des matières

- [Docker Dbs](#docker-dbs)
  - [Table des matières](#table-des-matières)
  - [Services inclus](#services-inclus)
  - [Interfaces Web](#interfaces-web)
  - [Compatibilité des bases de données entre MySQL et Mariadb](#compatibilité-des-bases-de-données-entre-mysql-et-mariadb)
  - [Thèmes personnalisées de PhpMyAdmin](#thèmes-personnalisées-de-phpmyadmin)
  - [Pour la sauvegarde des configs de PhpMyAdmin.](#pour-la-sauvegarde-des-configs-de-phpmyadmin)
  - [Connection à PostgreSQL avec PgAdmin](#connection-à-postgresql-avec-pgadmin)
  - [Redis et Redis-commander](#redis-et-redis-commander)
    - [Multiple bases de données](#multiple-bases-de-données)
    - [Ajouter des connexions de bases de données à Redis-commander](#ajouter-des-connexions-de-bases-de-données-à-redis-commander)
  - [UI pour gérer les données MongoDB](#ui-pour-gérer-les-données-mongodb)
  - [Backup MariaDB](#backup-mariadb)
    - [Backup](#backup)
    - [Restore](#restore)
  - [Backup MySQL](#backup-mysql)
    - [Backup](#backup-1)
    - [Restore](#restore-1)
  - [Backup PostgreSql](#backup-postgresql)
    - [Backup](#backup-2)
    - [Restore](#restore-2)
  - [Commandes](#commandes)
    - [Démarrer](#démarrer)
    - [Arrêter](#arrêter)
    - [Supprimer](#supprimer)
  - [Données persistantes](#données-persistantes)

## Services inclus

| Service    | Version | Port  | Utilisateur  | Mot de passe |
| ---------- | ------- | ----- | ------------ | ------------ |
| MariaDB    | 11.8.2  | 3306  | root / mysql | root / mysql |
| PostgreSQL | 17.5    | 5432  | root         | root         |
| Redis      | 8.0     | 6379  | —            | —            |
| MongoDB    | 8.0     | 27018 | root         | root         |
| MySQL      | 8.0     | 3307  | root / mysql | root / mysql |

> MongoDB est sur le port 27018 au lieu de 27017, car j'ai de mon bord l'installation complète de MongoDB Compass qui m'a aussi installé mongosh qui contient un serveur MongoDB.

## Interfaces Web

| Interface       | Version      |                       | URL             | User         | Password |
| --------------- | ------------ | --------------------- | --------------- | ------------ | -------- |
| Adminer         | 4.8.1        | http://localhost:8080 | root / mysql    | root / mysql |
| Redis Commander | Latest       | http://localhost:8081 |
| PhpMyAdmin      | 5.2.2 Apache | http://localhost:8082 | root / mysql    | root /mysql  |
| PgAdmin         | 4.9.4        | http://localhost:8083 | admin@admin.com | root         |

## Compatibilité des bases de données entre MySQL et Mariadb

1.  Aller sur PhpMyAdmin avec MariaDb
2.  Aller dans variables.
3.  Filtrer par collation
4.  character set collations = utf8mb4=utf8mb4_unicode_ci
5.  collation connection = utf8mb4_unicode_ci
6.  collation database = utf8mb4_unicode_ci
7.  collation server = utf8mb4_unicode_ci

Faire pareil avec la connection MySQL par PhpMyAdmin.

## Thèmes personnalisées de PhpMyAdmin

Ce repo a déjà plusieurs thèmes pré installés.

- BooDark
- BooDark-Nord
- BooDark-Orange
- BooDark-Teal
- Bootstrap
- Darkwolf
- Metro
- Original
- PmaHomme

Pour ajouter de nouveaux thèmes c'est dans **phpmyadmin/themes**.

## Pour la sauvegarde des configs de PhpMyAdmin.

Il se peut que tout en bas lorsque vous êtes connectés par PhpMyAdmin qu'il y a un message d'erreur. Cliquer dessus et accepter la création de la base de données pour ces configurations. Il faudra sûrement le faire pour l'autre serveur de base de données.

## Connection à PostgreSQL avec PgAdmin

1. Nouveau serveur.
2. Dans **Connexion** mettre la config suivante:
   1. Hôte: **postgres**
   2. Port: **5432**
   3. Base de données de maintenance: **postgres**
   4. Identifiant: **root**
   5. Mot de passe: **root**

## Redis et Redis-commander

### Multiple bases de données

Pour réduire ou augmenter le nombre de bases de donneés Redis il faut changer le nombre après la variable databases dans le fichier **redis/redis.conf**.

### Ajouter des connexions de bases de données à Redis-commander

1. Cliquer sur **More**.
2. Ensuite **Add Server**.
3. Hostname: **redis**.
4. Port: **6379**.
5. Database index: La base de données à se connecter.

## UI pour gérer les données MongoDB

Je suggère d'installer sur votre machine le logiciel graphique officiel de MongoDB qui est MongoDB Compass.

Lien du logiciel: [https://www.mongodb.com/products/tools/compass](https://www.mongodb.com/products/tools/compass)

Le lien de connexion au serveur MongoDB est le suivant: **mongodb://root:root@127.0.0.1:27018/**

## Backup MariaDB

Je suggère d'utiliser Git Bash pour ceux sur Windows pour exécuter les script sh. Aussi faite le dans le dossier **backup/mariadb** l'exécution des commandes, c'est plus simple.

### Backup

```bash
sh backup.sh [nom_bd]
```

### Restore

```bash
sh backup.sh [nom_script.sql]
```

## Backup MySQL

Je suggère d'utiliser Git Bash pour ceux sur Windows pour exécuter les script sh. Aussi faite le dans le dossier **backup/mysql** l'exécution des commandes, c'est plus simple.

### Backup

```bash
sh backup.sh [nom_bd]
```

### Restore

```bash
sh backup.sh [nom_script.sql]
```

## Backup PostgreSql

Je suggère d'utiliser Git Bash pour ceux sur Windows pour exécuter les script sh. Aussi faite le dans le dossier **backup/postgres** l'exécution des commandes, c'est plus simple.

### Backup

```bash
sh backup.sh [nom_bd]
```

### Restore

```bash
sh backup.sh [nom_script.sql]
```

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
