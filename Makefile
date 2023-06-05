DIRS := $(wildcard */)
DIRS := $(patsubst %/,%,$(DIRS))

.PHONY: $(DIRS)
$(DIRS):
	@echo "Running docker-compose up in $@"
	@cd $@ && docker-compose up
