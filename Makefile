SRC_DIR := src
BUILD_DIR := build
SOURCES := $(wildcard $(SRC_DIR)/*.ml)
INTERFACES := $(patsubst %.ml, %.cmi, $(SOURCES))
OBJECTS := $(patsubst %.ml, %.cmo, $(SOURCES))

BUILD_TARGETS := $(patsubst $(SRC_DIR)/%.ml, build/%, $(SOURCES))
RUN_TARGETS := $(patsubst $(SRC_DIR)/%.ml, run/%, $(SOURCES))

all: pre-build build

pre-build:
	mkdir -p build

build: $(BUILD_TARGETS)

build/%: $(SRC_DIR)/%.ml
	ocamlc $< -o $@

run/%: $(SRC_DIR)/%.ml
	ocaml $<

ls:
	@echo $(BUILD_TARGETS)
	@echo $(RUN_TARGETS)

clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(INTERFACES) $(OBJECTS)
