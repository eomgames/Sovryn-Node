build: ## Build the container
	docker build -t sovryn-node . 
run:
	docker run -it -p 9000:3000 --env-file .env sovryn-node
run-with-approve:
	docker run -d --rm -p 3000:3000 --name sovryn --env DO_APPROVE=true --env-file .env --hostname sovryn.localhost sovryn-node:latest
logs:
	docker logs -f sovryn-node
stop: 
	docker stop sovryn-node
exec:
	docker exec -it sovryn-node /bin/bash
docker-tag:
	docker tag sovryn-node:latest gambitcajun/sovryn-node:latest
docker-push:
	docker push gambitcajun/sovryn-node:latest
magic:
	make build
	make docker-tag
	make docker-push