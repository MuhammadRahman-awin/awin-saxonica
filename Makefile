# Docker host Detection from http://go/docker-switcher
ifndef server
  ifdef DH
    server = $(DH)
    $(info Detected '$(DH)' from Docker Environment Switcher. Go you!)
  endif
endif
server ?= docker
version ?= latest
port_mapping ?= -p 80:80
targetEnvironment ?= dev
jenkinsUser ?= unknownUser
jenkinsApiKey ?= unknownApiKey
dockerImage ?= LATEST

build:
	docker build -t saxonica -f docker/dockerfile .

start:
	docker run --name saxonica -d saxonica

exec:
	docker exec -it saxonica bash