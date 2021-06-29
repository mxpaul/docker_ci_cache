BUILD_FLAGS := -mod=vendor -ldflags="-w -s"
CGO_ENABLED := 0
GOOS := linux
ARCH := amd64
EXECUTABLE := /tmp/checkpg
SOURCES := cmd/app_healthcheck/main.go

BUILD_ENV = CGO_ENABLED=$(CGO_ENABLED) GOOS=$(GOOS) GOARCH=$(ARCH)

UPX_STRIP := no
UPX_PROGRAM := /usr/local/bin/upx
UPX_ARGS := --brute

all: build strip

.PHONY: build

build:
	$(BUILD_ENV) go build $(BUILD_FLAGS) -o $(EXECUTABLE) $(SOURCES)

strip: build
ifeq ($(UPX_STRIP),yes)
	$(UPX_PROGRAM) --brute $(EXECUTABLE)
endif
