include ../_shared/checks.mk
include ../_shared/targets/*.mk

# Upstream Debian GNU/Linux OCI image
DEBIAN_OCI_TAG     ?= trixie-20261027
# Valid Formats: yyyymmddThhmmssZ, yyyymmdd
SNAPSHOT_TIMESTAMP ?= 20261027

MAYFLIES_OCI_NAME     := mayflies
# Repository image tag immutability is enabled
MAYFLIES_OCI_TAG      ?= $(DEBIAN_OCI_TAG)
MAYFLIES_OCI_IMAGE    := docker.io/penguinspiral/$(MAYFLIES_OCI_NAME):$(MAYFLIES_OCI_TAG)

# Supported Open Container Initiative (OCI) image builder & publisher binaries
OCI_SUPPORTED_BINARIES := buildah docker

# Open Container Initiative (OCI) binary autodetect
ifneq (,$(shell command -v buildah 2>/dev/null))
    OCI_BINARY ?= buildah
endif
ifneq (,$(shell command -v docker 2>/dev/null))
    OCI_BINARY ?= docker
endif

# Basic error checks: Variable definitions & supported OCI binary specified
ifneq ($(MAKECMDGOALS),help)
    $(foreach var,DEBIAN_OCI_TAG SNAPSHOT_TIMESTAMP MAYFLIES_OCI_TAG OCI_BINARY,\
        $(call check_defined, $(var), "Error: $(var) explicitly unset! Exiting.")\
    )
    ifeq ($(filter $(OCI_BINARY),$(OCI_SUPPORTED_BINARIES)),)
        $(error "Error: Supported open container initiative binaries 'buildah', 'docker' not chosen. Exiting.")
    endif
endif

OCI_OPTS := --build-arg DEBIAN_OCI_TAG=$(DEBIAN_OCI_TAG) \
            --build-arg SNAPSHOT_TIMESTAMP=$(SNAPSHOT_TIMESTAMP) \
            --tag "$(MAYFLIES_OCI_IMAGE)" \
            --file Containerfile \
            .

.PHONY: build-deps publish-deps build publish help

.DEFAULT_GOAL := help



build: build-deps     ## Build the mayflies OCI image
	$(OCI_BUILD_BINARY) $(OCI_BUILD_CMD) $(OCI_BUILD_OPTS)

publish: publish-deps ## Publish the mayflies OCI image
	$(OCI_PUBLISH_BINARY) $(OCI_PUBLISH_CMD) $(OCI_PUBLISH_OPTS)
