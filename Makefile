# compiler options
CC  = gcc
AS  = as
CPP = g++
LD  = ld

# compiler flags
CFLAGS     = -g -nostdlib -nostdinc -ffreestanding -Wall -Wextra -fno-exceptions
CINCLUDE   = -I ./libc/v1.0/include
ASFLAGS    = 
ASINCLUDE  =
CPPFLAGS   = -g -nostdlib -nostdinc -ffreestanding -Wall -Wextra -fno-exceptions
CPPINCLUDE = -I ./libc/v1.0/include -I ./libcxx/v1.0/include
LDFLAGS    = 

# directories
OBJ_DIR_TEST   = ./obj/test
OBJ_DIR_LIBC   = ./obj/libc/v1.0
OBJ_DIR_LIBCXX = ./obj/libcxx/v1.0
SRC_DIR_TEST   = ./test
SRC_DIR_LIBC   = ./libc/v1.0/src
SRC_DIR_LIBCXX = ./libcxx/v1.0/include

# do all
all: link
	echo "Done!"

# link all
link: compile
	${LD} ${LDFLAGS}            \
		${OBJ_DIR_TEST}/entry.o \
		${OBJ_DIR_TEST}/start.o  \
		-o ./test.exe

# compile all
compile: compile_libc compile_libcxx compile_test
	echo "Compiled!"

# compile test app
compile_test: prepare
	${CPP} ${CPPFLAGS} ${CPPINCLUDE} -c ${SRC_DIR_TEST}/start.cpp -o ${OBJ_DIR_TEST}/start.o
	${CPP} ${CPPFLAGS} ${CPPINCLUDE} -c ${SRC_DIR_TEST}/entry.cpp -o ${OBJ_DIR_TEST}/entry.o

# compile lib c++
compile_libcxx: prepare
	# ${CPP} ${CPPFLAGS} ${CPPINCLUDE} -c ${SRC_DIR_LIBCXX}/entry.cpp -o ${OBJ_DIR_LIBCXX}/entry.o

# compile lib c
compile_libc: prepare

# prepare
prepare: clean
	mkdir -p $(OBJ_DIR_TEST)
	mkdir -p $(OBJ_DIR_LIBC)
	mkdir -p $(OBJ_DIR_LIBCXX)

# clean
clean:
	rm -rf ./*.exe
	rm -rf ./bin
	rm -rf ./obj
