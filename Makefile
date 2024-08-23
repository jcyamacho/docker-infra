DIRS := $(wildcard */)
DIRS := $(patsubst %/,%,$(DIRS))

.PHONY: $(DIRS)
$(DIRS):
	@echo "running $@"
	@cd $@ && docker-compose up -d --build
