PATH  := node_modules/.bin:$(PATH)
SHELL := /bin/bash

# We pass the same args to browserify and watchify
build_args := src/muybridge.js -o dist/muybridge.js -s Muybridge

dist/muybridge.js: src/*.js
	mkdir -p dist
	browserify -t stripify $(build_args)

watch:
	mkdir -p dist
	watchify $(build_args) -v

js: npm dist/muybridge.js

clean:
	rm -r dist

all: js

.PHONY: all
