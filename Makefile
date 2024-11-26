BRANCH := master
BUILD_DIR := ./build
ABS_BUILD_DIR := $(shell realpath $(BUILD_DIR))
SKIP_TESTS := 

ifdef TERM_PROGRAM
    ifeq ($(TERM_PROGRAM),vscode)
        IN_VSCODE := y
    endif
endif

.PHONY: all build install install-deps clean

all: install

install: build
	sudo $(MAKE) -C $(BUILD_DIR)/nvim install -j$(nproc);
	cp -r ./nvim ~/.config/nvim

build: install-deps
	@mkdir -p $(BUILD_DIR)

	@if [ ! -d "$(BUILD_DIR)/nvim" ]; then \
		git clone -b $(BRANCH) git@github.com:neovim/neovim.git $(BUILD_DIR)/nvim; \
	fi

	$(MAKE) -C $(BUILD_DIR)/nvim all -j$(nproc) CMAKE_BUILD_TYPE=RelWithDebInfo

install-deps:
	@sudo apt install -y libtool autoconf automake cmake libncurses5-dev g++ gettext libtool-bin
	
clean: 
	rm -rf $(BUILD_DIR)/nvim
	rm -rf ~/.config/nvim
