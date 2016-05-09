targets=

.PHONY: all clean
all:
	for target in $(targets); do \
		fpc $$target; \
	done

clean:
	for target in $(targets); do \
		rm $$target $${target}.o; \
	done
