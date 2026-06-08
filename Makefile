include _shared/checks.mk
include _shared/targets/*.mk

# Project specific build container, ref: oci/Containerfile
OCI_REGISTRY := docker.io/penguinspiral
OCI_IMG      := mayflies
OCI_SHA256   := 4d568d2c66af4ceac91d947f98040c8844cff8b8ec71a004d184888f631ee5ed # trixie-20260518
OCI_URI      := $(OCI_REGISTRY)/$(OCI_IMG)@sha256:$(OCI_SHA256)

BUILD_HOSTNAME          ?=
BUILD_TARGET            ?=
BUILD_HOSTNAME_DIR      := $(CURDIR)/img/$(BUILD_HOSTNAME)
BUILD_HOSTNAME_ENV_FILE := $(BUILD_HOSTNAME_DIR)/host.env
BUILD_TARGET_DIR        := $(BUILD_HOSTNAME_DIR)/$(BUILD_TARGET)
BUILD_TARGET_ENV_FILE   := $(BUILD_TARGET_DIR)/target.env

# Handle case whereby host and/or target is not managed in Git currently
# Supports explicit override at build-time
BUILD_TARGET_COMMIT_SHA_CMD := $(shell git log --max-count=1 --pretty=format:"%h" -- $(BUILD_TARGET_DIR))
BUILD_TARGET_COMMIT_SHA     ?= $(if $(BUILD_TARGET_COMMIT_SHA_CMD),$(BUILD_TARGET_COMMIT_SHA_CMD),untracked)

# Container engine (CRI) autodetect
ifneq (,$(shell command -v podman 2>/dev/null))
    CRI_BINARY ?= podman
endif
ifneq (,$(shell command -v docker 2>/dev/null))
    CRI_BINARY ?= docker
endif
ifndef CRI_BINARY
    $(error "Error: Supported container engine binaries 'podman', 'docker' not found. Exiting.")
endif

# Container engine (CRI) agnostic defaults
CRI_CMD         := run
CRI_CWD_VOLUME  := $(BUILD_TARGET_DIR):/app/$(BUILD_TARGET):rw
CRI_CONF_VOLUME := $(BUILD_TARGET_DIR)/auto:/app/$(BUILD_TARGET)/auto:ro
CRI_OPTS := --rm \
            --privileged \
            --user root \
            --volume $(CRI_CWD_VOLUME) \
            --volume $(CRI_CONF_VOLUME) \
            --workdir /app/$(BUILD_TARGET) \
            --env MAYFLIES_HOSTNAME=$(BUILD_HOSTNAME) \
            --env MAYFLIES_TARGET=$(BUILD_TARGET) \
            --env MAYFLIES_TARGET_COMMIT_HASH=$(BUILD_TARGET_COMMIT_SHA)
ifneq (,$(wildcard $(BUILD_HOSTNAME_ENV_FILE)))
    CRI_OPTS += --env-file $(BUILD_HOSTNAME_ENV_FILE)
endif
ifneq (,$(wildcard $(BUILD_TARGET_ENV_FILE)))
    CRI_OPTS += --env-file $(BUILD_TARGET_ENV_FILE)
endif
ifeq ($(MAKECMDGOALS),enter)
    CRI_OPTS += --interactive --tty
endif

LB_BINARY := /usr/bin/lb

.PHONY: config build clean distclean enter help

.DEFAULT_GOAL := help
config:        ## Render build-time configurations
	sudo $(CRI_BINARY) $(CRI_CMD) $(CRI_OPTS) $(OCI_URI) $(LB_BINARY) $@

build: config  ## Build specified image target
	sudo $(CRI_BINARY) $(CRI_CMD) $(CRI_OPTS) $(OCI_URI) $(LB_BINARY) $@

clean:         ## Remove build artifacts for a target
	sudo $(CRI_BINARY) $(CRI_CMD) $(CRI_OPTS) $(OCI_URI) $(LB_BINARY) $@

distclean:     ## Remove build artifacts & cache for a target
	sudo $(CRI_BINARY) $(CRI_CMD) $(CRI_OPTS) $(OCI_URI) $(LB_BINARY) clean --purge

enter:         ## Enter an interactive session
	sudo $(CRI_BINARY) $(CRI_CMD) $(CRI_OPTS) $(OCI_URI) /bin/bash
