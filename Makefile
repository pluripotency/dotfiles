DOT_FILES = nvimrc vimrc gvimrc tmux.conf 

all: nvim vim tmux

nvim: $(foreach f, $(filter nvimrc, $(DOT_FILES)), link-dot-file-$(f))
	bash ${PWD}/nvim.sh

vim: $(foreach f, $(filter vimrc gvimrc, $(DOT_FILES)), link-dot-file-$(f))

tmux: $(foreach f, $(filter tmux%, $(DOT_FILES)), link-dot-file-$(f))

.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))
  

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/.$<"
	@$(RM) $(HOME)/.$<
