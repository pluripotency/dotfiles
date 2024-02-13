DOT_FILES = vimrc gvimrc tmux.conf 

all: vim tmux

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
