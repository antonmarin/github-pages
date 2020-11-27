.DEFAULT_GOAL=help
GEM_VERSION=209

lint: lint-dockerfile lint-shell #? prebuild validations
lint-dockerfile:
	docker run --rm -tv "$(PWD):/app" hadolint/hadolint:v1.8.0 \
		hadolint \
		/app/alpine/Dockerfile \
		/app/debian/Dockerfile
lint-shell:
	docker run --rm -tv "$(PWD):/mnt" koalaman/shellcheck:v0.5.0 \
		--color=always --shell=sh --exclude=SC2181 ./*.sh

release: #? Use `make GEM_VERSION=123 release` to release
	git tag $(GEM_VERSION) && git push --follow-tags --tags

test: #? build & test images. Use `make GEM_VERSION=123 test` to test GEM_VERSION
	docker-compose -f alpine/docker-compose.test.yml build --build-arg GEM_VERSION=$(GEM_VERSION) && \
	docker-compose -f alpine/docker-compose.test.yml run --rm sut && \
	docker-compose -f debian/docker-compose.test.yml build --build-arg GEM_VERSION=$(GEM_VERSION) && \
	docker-compose -f debian/docker-compose.test.yml run --rm sut

update: test #? update Dockerfile GEM_VERSIONs to GEM_VERSION. Use `make GEM_VERSION=123 update` to update Dockerfiles
	docker run --rm -it -v $(PWD):/app -w /app busybox sed \
        -i"" "s/^ARG\ GEM_VERSION=.*/ARG\ GEM_VERSION=$(GEM_VERSION)/" \
        */Dockerfile && \
    docker run --rm -it -v $(PWD):/app -w /app busybox sed \
    	-i"" "s/^GEM_VERSION=.*/GEM_VERSION=$(GEM_VERSION)/" Makefile

help: #? help me
	@printf "\e[34;01mAvailable targets\033[0m\n"
	@awk '/^@?[a-zA-Z\-_0-9]+:/ { \
		nb = sub( /^#\? /, "", helpMsg ); \
		if(nb == 0) { \
			helpMsg = $$0; \
			nb = sub( /^[^:]*:.* #\? /, "", helpMsg ); \
		} \
		if (nb) \
			printf "\033[1;31m%-" width "s\033[0m %s\n", $$1, helpMsg; \
	} \
	{ helpMsg = $$0 }' \
	$(MAKEFILE_LIST) | column -ts:
