
test: build
	cd build && sampctl package run

build: ensure
	cd build && sampctl package build

ensure:
	cd build && sampctl package ensure
	