SRCS=basic-system-with-humans.dot
DOT=dot
TYPE ?= png
DESTS=basic-system-with-humans.$(TYPE)

all: $(DESTS)

pdf:
	TYPE=pdf make all

%.$(TYPE) : %.dot
	$(DOT) -T$(TYPE) $< -o $@

