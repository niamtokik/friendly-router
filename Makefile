.PHONY += all
all: bin
	go build

test:
	go test
