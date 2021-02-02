start:
	@make start_docker

stop:
	@make export_db
	@make stop_docker

start_docker:
	@docker-compose up

stop_docker:
	@docker-compose down

DATA_DIR = data

export_db:
ifneq ($(wildcard $(DATA_DIR)),)
	@./bin/export-db.sh
else
	@mkdir $(DATA_DIR)
	@./bin/export-db.sh
endif
