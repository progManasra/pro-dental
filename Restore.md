This database dump is for DEMO / educational purposes only.
No real or sensitive data is included.

Restore:
docker compose up -d
docker exec -i pro-dental-mysql-1 mysql -uroot -proot_pw prodental < backups/prodental.sql
