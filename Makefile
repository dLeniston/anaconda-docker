deploy:
	cd ./build && docker-compose build && \
	docker-compose run -d data-mining-env && \
	docker-compose up -d --force-recreate

cleanup:
	cd ./build && docker-compose down --rmi all -v;
