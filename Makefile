DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitignore .config
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
CONFIGS    := $(wildcard .config/*)

# link <src> <dest>: シンボリックリンクでない実体が既にあれば上書きせずスキップ
link = if [ -e $(2) ] && [ ! -L $(2) ]; then echo "skip (exists): $(2)"; else ln -sfnv $(1) $(2); fi;

.DEFAULT_GOAL := help

all:

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES) $(CONFIGS), /bin/ls -dF $(val);)

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), $(call link,$(abspath $(val)),$(HOME)/$(val)))
	@mkdir -p $(HOME)/.config
	@$(foreach val, $(CONFIGS), $(call link,$(abspath $(val)),$(HOME)/$(val)))
