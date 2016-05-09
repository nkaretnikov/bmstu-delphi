targets=ex3a

.PHONY: all clean
all:
	for target in $(targets); do \
		fpc -Mdelphi $$target; \
	done

clean:
	for target in $(targets); do \
		rm $$target $${target}.o; \
	done
