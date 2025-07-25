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

keys: ## CRIA AS CHAVES DA APLICAÇÃO
	docker exec -it myEnterprise-nginx php artisan key:generate

config: ## RESETA AS CONFIGURAÇÕES
	docker exec -it myEnterprise-nginx php artisan config:clear

route: ## LISTA AS ROTAS
	docker exec -it myEnterprise-nginx php artisan route:list

routeClear: ## LIMPA AS ROTAS
	docker exec -it myEnterprise-nginx php artisan route:clear

view: ## LIMPA AS VIEWS
	docker exec -it myEnterprise-nginx php artisan view:clear

install: ## INSTALA AS DEPENDÊNCIAS
	docker exec -it myEnterprise-nginx composer i
