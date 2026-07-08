.PHONY: deps lint test run docker_build docker_push
deps:
	pip install -r requirements.txt; pip install -r test_requirements.txt
lint:
	flake8 hello_world test || true
test:
	pytest
run:
	python main.py
docker_build:
	docker build -t hello-world-printer .
docker_push: docker_build
	@docker login --username $(USERNAME) --password $(DOCKER_PASSWORD);
docker tag hello-world-printer $(USERNAME)/hello-world-printer-k7-2026:latest;
docker push $(USERNAME)/hello-world-printer-k7-2026:latest; docker logout