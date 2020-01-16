# compiler options
LD=ld
CC=gcc
CFLAGS=-nostdlib -fno-exceptions -S -masm=intel
LDFLAGS=-nostdlib

# directories
OBJ_DIR=./obj
INC_DIR=./libc/v1.0/include
SRC_DIR=./libc/v1.0/src

# all target
all: compile
	echo "All done!"

# compile target
compile: $(OBJ_DIR)
	$(CC) $(CFLAGS) $(SRC_DIR)/assert.c   -o $(OBJ_DIR)/assert.S
	$(CC) $(CFLAGS) $(SRC_DIR)/ctype.c    -o $(OBJ_DIR)/ctype.S
	$(CC) $(CFLAGS) $(SRC_DIR)/errno.c    -o $(OBJ_DIR)/errno.S
	$(CC) $(CFLAGS) $(SRC_DIR)/fenv.c     -o $(OBJ_DIR)/fenv.S
	$(CC) $(CFLAGS) $(SRC_DIR)/float.c    -o $(OBJ_DIR)/float.S
	$(CC) $(CFLAGS) $(SRC_DIR)/inttypes.c -o $(OBJ_DIR)/inttypes.S
	$(CC) $(CFLAGS) $(SRC_DIR)/iso646.c   -o $(OBJ_DIR)/iso646.S
	$(CC) $(CFLAGS) $(SRC_DIR)/limits.c   -o $(OBJ_DIR)/limits.S
	$(CC) $(CFLAGS) $(SRC_DIR)/locale.c   -o $(OBJ_DIR)/locale.S
	$(CC) $(CFLAGS) $(SRC_DIR)/math.c     -o $(OBJ_DIR)/math.S
	$(CC) $(CFLAGS) $(SRC_DIR)/setjmp.c   -o $(OBJ_DIR)/setjmp.S
	$(CC) $(CFLAGS) $(SRC_DIR)/signal.c   -o $(OBJ_DIR)/signal.S
	$(CC) $(CFLAGS) $(SRC_DIR)/stdarg.c   -o $(OBJ_DIR)/stdarg.S
	$(CC) $(CFLAGS) $(SRC_DIR)/stdbool.c  -o $(OBJ_DIR)/stdbool.S
	$(CC) $(CFLAGS) $(SRC_DIR)/stddef.c   -o $(OBJ_DIR)/stddef.S
	$(CC) $(CFLAGS) $(SRC_DIR)/stdint.c   -o $(OBJ_DIR)/stdint.S
	$(CC) $(CFLAGS) $(SRC_DIR)/stdio.c    -o $(OBJ_DIR)/stdio.S
	$(CC) $(CFLAGS) $(SRC_DIR)/stdlib.c   -o $(OBJ_DIR)/stdlib.S
	$(CC) $(CFLAGS) $(SRC_DIR)/string.c   -o $(OBJ_DIR)/string.S
	$(CC) $(CFLAGS) $(SRC_DIR)/tgmath.c   -o $(OBJ_DIR)/tgmath.S
	$(CC) $(CFLAGS) $(SRC_DIR)/time.c     -o $(OBJ_DIR)/time.S
	$(CC) $(CFLAGS) $(SRC_DIR)/uchar.c    -o $(OBJ_DIR)/uchar.S
	$(CC) $(CFLAGS) $(SRC_DIR)/wchar.c    -o $(OBJ_DIR)/wchar.S
	$(CC) $(CFLAGS) $(SRC_DIR)/wctype.c   -o $(OBJ_DIR)/wctype.S

# create folder
$(OBJ_DIR): clean
	mkdir -p $(OBJ_DIR)

# clean target
clean:
	@echo "\e[92mClean up...\e[39m"
	rm -rf $(BIN_DIR)
	rm -rf $(OBJ_DIR)