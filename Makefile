.PHONY: build unit-tests clean
build:
	docker compose up --build --no-start
unit-tests: build
	docker compose up --abort-on-container-exit --exit-code-from unit-tests unit-tests
clean:
	docker compose down