DATA_DIR = data
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

start:
	@make start_docker

stop:
	@make export_db
	@make stop_docker

start_docker:
	docker-compose up

stop_docker:
	docker-compose down

export_db:
ifneq ($(wildcard $(DATA_DIR)),)
	@./bin/export-db.sh
else
	@mkdir $(DATA_DIR)
	@./bin/export-db.sh
endif

push:
ifeq ($(BRANCH),master)
	$(info ******** Already On Master ********)
	@echo "Checkout a branch to push"
else
	$(info ******** Rebase & Push Branch ********)
	@make export_db
	git checkout master
	git pull
	git checkout $(BRANCH)
	git rebase master
	git push origin $(BRANCH)
endif
