
ifndef HUGO_DOMAIN
$(error HUGO_DOMAIN is required, and should be a schemaless domain name such as example.com)
endif

HUGO_BUILD_DIR ?= build
HUGO_PROTOCOL ?= https
HUGO_BASE_URL = $(HUGO_PROTOCOL)://$(HUGO_DOMAIN)
HUGO_PORT ?= 3000

# Start hugo server.
hugo.start:
	@hugo serve -v -w --quiet --forceSyncStatic -p $(HUGO_PORT)
.PHONY: start

# Build hugo site.
hugo.build:
	@echo "==> building"
	@hugo --quiet --baseURL $(HUGO_BASE_URL) -d $(HUGO_BUILD_DIR)
.PHONY: build

# Clean hugo build artifacts.
hugo.clean:
	rm -fr $(HUGO_BUILD_DIR)
.PHONY: clean
