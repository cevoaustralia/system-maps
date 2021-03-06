SRCS=legend.dot
DOT=dot
TYPE ?= png
DESTS=legend.$(TYPE)

all: $(DESTS)

pdf:
	TYPE=pdf make all

%.$(TYPE) : %.dot
	$(DOT) -T$(TYPE) $< -o $@

examples:
	$(MAKE) -C examples all

.PHONY: examples
