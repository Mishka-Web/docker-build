up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

logs:
	docker-compose logs -f

install-wp:
	./scripts/install-wordpress.sh

install-bitrix:
	./scripts/install-bitrix.sh