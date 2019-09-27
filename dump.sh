GREEN='\033[0;32m'
Yellow='\033[1;33m'
NC='\033[0m'


echo "${GREEN}Delete database${NC}"
sudo rm -rf tools/dump/db.sql
echo "${GREEN}Еxport db${NC}"
echo "${Yellow}Введите пароль от локальной базы${NC}"
sudo pg_dump -h localhost -p 5432 -U postgres -d ican -f tools/dump/db.sql
echo "${GREEN}Create database${NC}"
echo "${Yellow}Введите пароль от локальной базы${NC}"
sudo createdb  -h localhost -p 5432 -U postgres -e ican
echo "${GREEN}Import db${NC}"
echo "${Yellow}Введите пароль от локальной базы${NC}"
sudo psql -h localhost -p 5432 -U postgres -d ican -f tools/dump/db.sql

echo "${GREEN}FINISH${NC}"