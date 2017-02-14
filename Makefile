######################################################################
# FreeBSD Makefile.
######################################################################

TARGET ?= ./_build
SQLITE_DB := $(TARGET)/db.sqlite
JSON_DB := $(TARGET)/db.json
CSV_DB := $(TARGET)/db.csv

all: sqlite json csv

console: $(SQLITE_DB)
	sqlite3 $(SQLITE_DB)

$(TARGET):
	mkdir -p $(TARGET)

$(SQLITE_DB): $(TARGET)
	@echo debug: generate sqlite database $@
	sqlite3 $@ < database.sql

$(JSON_DB): $(TARGET) 
	@echo debug: generate json $@
	@echo "work in progress"

$(CSV_DB): $(TARGET) 
	@echo debug: generate csv $@
	@echo "work in progress"

sqlite: $(SQLITE_DB)

json: $(JSON_DB)

csv: $(CSV_DB)

clean:
	-rm $(TARGET)/*

help:
	@echo "usage: make [sqlite|json|csv|all|console|clean|help]"
