include ../_shared/checks.mk
include ../_shared/targets/*.mk

# Upstream Debian GNU/Linux OCI image
DEBIAN_OCI_TAG     ?= trixie-20250721
# Valid Formats: yyyymmddThhmmssZ, yyyymmdd
SNAPSHOT_TIMESTAMP ?= 20250721

MAYFLIES_OCI_NAME := mayflies
MAYFLIES_OCI_TAG  ?= $(DEBIAN_OCI_TAG)

# Open Container Initiative (OCI) image *builder* binary autodetect
ifneq (,$(shell command -v buildah 2>/dev/null))
    OCI_BUILD_BINARY ?= buildah
endif
ifneq (,$(shell command -v docker 2>/dev/null))
    OCI_BUILD_BINARY ?= docker
endif

# Open Container Initiative (OCI) image *publisher* binary autodetect
ifneq (,$(shell command -v skopeo 2>/dev/null))
    OCI_PUBLISH_BINARY ?= skopeo
endif
ifeq ($(OCI_PUBLISH_BINARY),skopeo)
    OCI_PUBLISH_CMD    ?= copy
    OCI_PUBLISH_OPTS   ?= containers-storage:localhost/penguinspiral/$(MAYFLIES_OCI_NAME):$(MAYFLIES_OCI_TAG) \
                          docker://docker.io/penguinspiral/$(MAYFLIES_OCI_NAME):$(MAYFLIES_OCI_TAG)
endif

ifneq (,$(shell command -v docker 2>/dev/null))
    OCI_PUBLISH_BINARY ?= docker
endif
ifeq ($(OCI_PUBLISH_BINARY),docker)
    OCI_PUBLISH_CMD    ?= push
    OCI_PUBLISH_OPTS   ?= docker.io/penguinspiral/$(MAYFLIES_OCI_NAME):$(MAYFLIES_OCI_TAG)
endif

OCI_BUILD_CMD  := build
OCI_BUILD_OPTS := --build-arg DEBIAN_OCI_TAG=$(DEBIAN_OCI_TAG) \
                  --build-arg SNAPSHOT_TIMESTAMP=$(SNAPSHOT_TIMESTAMP) \
                  --tag penguinspiral/"$(MAYFLIES_OCI_NAME):$(MAYFLIES_OCI_TAG)" \
                  --file Containerfile \
                  .

.PHONY: build-deps publish-deps build publish help

.DEFAULT_GOAL := help

build-deps:           ## Dependencies for building the mayflies OCI image
	@:$(call check_defined, OCI_BUILD_BINARY, "Missing supported OCI image builder binaries 'buildah', 'docker'. Exiting.")
	@:$(call check_defined, DEBIAN_OCI_TAG, "Missing upstream Debian GNU/Linux OCI image tag")
	@:$(call check_defined, SNAPSHOT_TIMESTAMP, "Missing APT snapshot timestamp value")

publish-deps:         ## Dependencies for publishing the mayflies OCI image
	@:$(call check_defined, OCI_PUBLISH_BINARY, "Missing supported OCI image publisher binaries 'skopeo','docker'. Exiting.")
	@:$(call check_defined, DEBIAN_OCI_TAG, "Missing upstream Debian GNU/Linux OCI image tag")

build: build-deps     ## Build the mayflies OCI image
	sudo $(SUDO_OPTS) -- $(OCI_BUILD_BINARY) $(OCI_BUILD_CMD) $(OCI_BUILD_OPTS)

publish: publish-deps ## Publish the mayflies OCI image
	sudo $(SUDO_OPTS) -- $(OCI_PUBLISH_BINARY) $(OCI_PUBLISH_CMD) $(OCI_PUBLISH_OPTS)
