include _shared/checks.mk
include _shared/targets/*.mk

# Project specific build container, ref: oci/Containerfile
OCI_REGISTRY := docker.io/penguinspiral
OCI_IMG      := mayflies
OCI_SHA256   := 4d568d2c66af4ceac91d947f98040c8844cff8b8ec71a004d184888f631ee5ed # trixie-20260518
OCI_URI      := $(OCI_REGISTRY)/$(OCI_IMG)@sha256:$(OCI_SHA256)
