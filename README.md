# sqlBackup

## Prerequisite

Mariadb or Postgresql docker container

Nano, vim, vi or any text editor


## How to

1. Create file `nano sqlBackup.sh` and paste the script
2. `chmod +x sqlBackup.sh`
3. Create `backups` folder `mkdir -p backups/mariadb` OR `mkdir -p backups/pgsql` OR `mkdir -p backups/mariadb backups/pgsql` 4. Run with `./sqlBackup.sh my_database database_type` (database\_type: mariadb OR pgsql)

## Changelog

1.0 - Initial version
