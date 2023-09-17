DIRS := $(wildcard */)
DIRS := $(patsubst %/,%,$(DIRS))

.PHONY: $(DIRS)
$(DIRS):
	@echo "Running docker-compose up -d in $@"
	@cd $@ && docker-compose up -d
