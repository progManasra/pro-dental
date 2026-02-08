This database dump is for DEMO / educational purposes only.
No real or sensitive data is included.

Restore:
docker compose up -d
docker exec -i pro-dental-mysql-1 mysql -uroot -proot_pw prodental < backups/prodental.sql
---------------------

git clone https://github.com/progManasra/pro-dental.git
cd pro-dental
docker compose up -d
docker exec -i pro-dental-mysql-1 mysql -uroot -proot_pw prodental < backups/prodental.sql


------------------------
✔️ Backend
✔️ Frontend
✔️ DB
✔️ Demo users
