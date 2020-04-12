all: build

build:
	@rm -rf public docs
	@hugo
	@mv public docs

clean:
	@rm -rf public docs