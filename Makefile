.PHONY: build
build:
	@git submodule foreach git pull origin master
	@middleman build
