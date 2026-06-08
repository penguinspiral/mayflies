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
