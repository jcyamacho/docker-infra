# Docker Infrastructure Makefile
# Automatically discovers services with compose.yml files

# Find all directories with compose.yml files
SERVICES := $(shell find . -maxdepth 2 -name "compose.yml" -exec dirname {} \; | sed 's|^\./||' | sort)

# Default target
.PHONY: help
help:
	@echo "🐳 Docker Infrastructure Services"
	@echo ""
	@echo "Available services:"
	@for service in $(SERVICES); do \
		echo "  $$service"; \
	done
	@echo ""
	@echo "Commands:"
	@echo "  make <service>         Start a service (e.g., make postgres)"
	@echo "  make stop-<service>    Stop a service (e.g., make stop-postgres)"
	@echo "  make logs-<service>    View service logs (e.g., make logs-postgres)"
	@echo "  make restart-<service> Restart a service (e.g., make restart-postgres)"
	@echo "  make clean            Stop all running services"
	@echo "  make help             Show this help message"
	@echo ""

# Service start targets
.PHONY: $(SERVICES)
$(SERVICES):
	@if [ ! -f "$@/compose.yml" ]; then \
		echo "❌ Error: $@/compose.yml not found"; \
		exit 1; \
	fi
	@echo "🚀 Starting $@..."
	@cd $@ && docker compose up -d --build
	@echo "✅ $@ started successfully"

# Service stop targets
.PHONY: $(addprefix stop-,$(SERVICES))
$(addprefix stop-,$(SERVICES)):
	$(eval SERVICE=$(patsubst stop-%,%,$@))
	@if [ ! -f "$(SERVICE)/compose.yml" ]; then \
		echo "❌ Error: $(SERVICE)/compose.yml not found"; \
		exit 1; \
	fi
	@echo "🛑 Stopping $(SERVICE)..."
	@cd $(SERVICE) && docker compose down
	@echo "✅ $(SERVICE) stopped successfully"

# Service logs targets
.PHONY: $(addprefix logs-,$(SERVICES))
$(addprefix logs-,$(SERVICES)):
	$(eval SERVICE=$(patsubst logs-%,%,$@))
	@if [ ! -f "$(SERVICE)/compose.yml" ]; then \
		echo "❌ Error: $(SERVICE)/compose.yml not found"; \
		exit 1; \
	fi
	@echo "📋 Showing logs for $(SERVICE)..."
	@cd $(SERVICE) && docker compose logs -f

# Service restart targets
.PHONY: $(addprefix restart-,$(SERVICES))
$(addprefix restart-,$(SERVICES)):
	$(eval SERVICE=$(patsubst restart-%,%,$@))
	@if [ ! -f "$(SERVICE)/compose.yml" ]; then \
		echo "❌ Error: $(SERVICE)/compose.yml not found"; \
		exit 1; \
	fi
	@echo "🔄 Restarting $(SERVICE)..."
	@cd $(SERVICE) && docker compose restart
	@echo "✅ $(SERVICE) restarted successfully"

# Stop all services
.PHONY: clean
clean:
	@echo "🧹 Stopping all services..."
	@for service in $(SERVICES); do \
		if [ -f "$$service/compose.yml" ]; then \
			echo "🛑 Stopping $$service..."; \
			cd $$service && docker compose down && cd ..; \
		fi; \
	done
	@echo "✅ All services stopped"

# Show running containers
.PHONY: status
status:
	@echo "📊 Docker containers status:"
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
