# define variable
SRC := ./src
PUBLIC := ./public
TEMP := ./tmp
DEVELOPMENT := development

.PHONY: help
help:
	@echo make install : npm install
	@echo make start : production

.PHONY: install
install:
	# install pug
	@npm i -D pug-cli
	# copy
	@npm i -D cpx
	# deploy
	@npm i -D gh-pages

.PHONY: start
start:
	@make pug & make copy & make server

.PHONY: pug
pug:
ifeq ($(env), $(DEVELOPMENT))
	@npx pug ${SRC}/pug -Pwo ${PUBLIC}
else
	@npx pug ${SRC}/pug -wo ${PUBLIC}
endif

.PHONY: server
server:
	@npx browser-sync start --server ${PUBLIC}

.PHONY: copy
copy:
	@npx cpx "${SRC}/assets/**/*" ${PUBLIC} -w

.PHONY: deploy
deploy:
	@npx gh-pages -b gh-pages -d public