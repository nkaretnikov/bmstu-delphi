targets=ex3a ex3b \
	ex4a-incorrect-task-interpretation \
	ex4a-repeat ex4a-while \
	ex5 \
	ex6b \
	ex7 \
	ex10b \
	ex12 \
	ex14 \
	ex15 \
	ex16

.PHONY: all clean
all:
	for target in $(targets); do \
		fpc -Mdelphi $$target; \
	done

clean:
	for target in $(targets); do \
		rm $$target $${target}.o; \
	done
