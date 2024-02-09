CC = gcc
CFLAGS = -Wall -Werror -Wextra -g
LDFLAGS = 

SRC_DIR = src
INCLUDE_DIR = include
OBJ_DIR = obj
BIN_DIR = .

TARGET = $(BIN_DIR)/lisod
SRCS = $(wildcard $(SRC_DIR)/*.c) $(wildcard $(INCLUDE_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf $(OBJ_DIR)/*.o $(TARGET)


runforfun:
	make all
	@echo "Starting lisod server"
	./lisod 8500 1 test.log . static_site . . .

submission:
	./submission.sh