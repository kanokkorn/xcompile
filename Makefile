BIN = xtarget
CC = clang
CFLAGS = -std=c99 -Wall -Wextra -pedantic

all: ${OBJ} ${EMIT} ${BIN}

.SUFFIXES: .c .o .ll
${OBJ}:
	${CC} ${CFLAGS} -c $<

${EMIT}:
	${CC} -S -emit-llvm $<

${BIN}: main.o
	${CC} ${LDFLAGS} -o $@ main.o ${LDLIBS}

clean:
	rm -rf *.o *.ll ${BIN}

.PHONY: clean
