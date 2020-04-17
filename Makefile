.DEFAULT_GOAL=help
GEM_VERSION=204

help:
	@printf "\
		build-latest\t Build current images as latest. Suitable while developing \n\
		lint\t\t prebuild validations \n\
		release\t\t Use \`make GEM_VERSION=123 release\` to release. \n\
		test\t\t build & test images. Use \`make GEM_VERSION=123 test\` to test GEM_VERSION \n\
		update\t\t update Dockerfile GEM_VERSIONs to GEM_VERSION. Use \`make GEM_VERSION=123 update\` to update Dockerfiles \n\
	"

lint: lint-dockerfile
lint-dockerfile:
	docker run --rm -tv $(PWD):/app hadolint/hadolint:v1.8.0 \
		hadolint \
		/app/alpine/Dockerfile \
		/app/debian/Dockerfile

release:
	git tag $(GEM_VERSION) && git push --follow-tags --tags

test: lint
	docker-compose -f alpine/docker-compose.test.yml build --build-arg GEM_VERSION=$(GEM_VERSION) && \
	docker-compose -f alpine/docker-compose.test.yml run --rm sut && \
	docker-compose -f debian/docker-compose.test.yml build --build-arg GEM_VERSION=$(GEM_VERSION) && \
	docker-compose -f debian/docker-compose.test.yml run --rm sut

update: test
	docker run --rm -it -v $(PWD):/app -w /app busybox sed \
        -i"" "s/^ARG\ GEM_VERSION=.*/ARG\ GEM_VERSION=$(GEM_VERSION)/" \
        */Dockerfile && \
    docker run --rm -it -v $(PWD):/app -w /app busybox sed \
    	-i"" "s/^GEM_VERSION=.*/GEM_VERSION=$(GEM_VERSION)/" Makefile
