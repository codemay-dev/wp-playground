start:
	@make start_docker

stop:
	@make export_db
	@make stop_docker

start_docker:
	@docker-compose up

stop_docker:
	@docker-compose down

export_db:
	@./bin/export-db.sh
