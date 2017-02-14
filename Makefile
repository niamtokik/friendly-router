######################################################################
# FreeBSD Makefile.
######################################################################

all: sqlite json csv

_build:
	mkdir _build

_build/db.sqlite: _build
	sqlite3 $@ < database.sql

_build/db.json: _build
	@echo "work in progress"

_build/db.csv: _build
	@echo "work in progress"

sqlite: _build/db.sqlite

json: _build/db.json

csv: _build/db.csv

clean:
	rm _build/*
