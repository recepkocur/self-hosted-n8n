restart:
	docker compose down
	docker compose up -d --build
	docker logs app-n8n -f

down:
	docker compose down

clean:
	docker system prune -a

log:
	docker logs app-n8n -f

fix:
	sudo chown -R recep:www-data ./volumes
	sudo chown -R 1000:1000 ./volumes/node/.n8n

ps:
	docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" -a

# --no-cache
