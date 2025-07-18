#INIT
init:
	$(MAKE) install
	$(MAKE) keys
	$(MAKE) config
	$(MAKE) migrate

# EXECUTA AS MIGRAÇÕES
migrate:
	docker exec -it myEnterprise-nginx php artisan migrate
# DERRUBA E LEVANTA TODAS AS TABELAS DO BANCO
fresh:
	docker exec -it myEnterprise-nginx php artisan migrate:fresh
# EXECUTA ROLLBACK DAS AÇÕES DO BANCO
rollback:
	docker exec -it myEnterprise-nginx php artisan migrate:rollback

keys:
	docker exec -it myEnterprise-nginx php artisan key:generate

config:
	docker exec -it myEnterprise-nginx php artisan config:clear

route:
	docker exec -it myEnterprise-nginx php artisan route:list

routeClear:
	docker exec -it myEnterprise-nginx php artisan route:clear

view:
	docker exec -it myEnterprise-nginx php artisan view:clear

install:
	docker exec -it myEnterprise-nginx composer i
