# compiler options
CC  = gcc
CPP = g++
LD  = ld

# compiler flags
CFLAGS     = -g -nostdlib -nostdinc -ffreestanding -Wall -Wextra -fno-exceptions -fno-rtti
CINCLUDE   = -I ./libc/v1.0/include
CPPFLAGS   = -g -nostdlib -nostdinc -ffreestanding -Wall -Wextra -fno-exceptions -fno-rtti
CPPINCLUDE = -I ./libc/v1.0/include -I ./libcxx/v1.0/include
LDFLAGS    = 

# directories
SRC_DIR_APP    = ./app
OBJ_DIR_APP   =  ./obj/app
OBJ_DIR_LIBC   = ./obj/v1.0/libc
OBJ_DIR_LIBCXX = ./obj/v1.0/libcxx
SRC_DIR_LIBC   = ./libc/v1.0/src
SRC_DIR_LIBCXX = ./libcxx/v1.0

# do all
all: link
	echo "Done!"

# link all
link: compile
	${LD} ${LDFLAGS}           \
		${OBJ_DIR_APP}/entry.o \
		${OBJ_DIR_APP}/start.o \
		-o ./app.exe

# compile all
compile: compile_libc compile_libcxx compile_app
	echo "Compiled!"

# compile test app
compile_app: prepare
	${CPP} ${CPPFLAGS} ${CPPINCLUDE} -c ${SRC_DIR_APP}/start.cpp -o ${OBJ_DIR_APP}/start.o
	${CPP} ${CPPFLAGS} ${CPPINCLUDE} -c ${SRC_DIR_APP}/entry.cpp -o ${OBJ_DIR_APP}/entry.o

# compile lib c++
compile_libcxx: prepare
	# ${CPP} ${CPPFLAGS} ${CPPINCLUDE} -c ${SRC_DIR_LIBCXX}/entry.cpp -o ${OBJ_DIR_LIBCXX}/entry.o

# compile lib c
compile_libc: prepare

# prepare
prepare: clean
	mkdir -p $(OBJ_DIR_APP)
	mkdir -p $(OBJ_DIR_LIBC)
	mkdir -p $(OBJ_DIR_LIBCXX)

# clean
clean:
	rm -rf ./*.exe
	rm -rf ./bin
	rm -rf ./obj
