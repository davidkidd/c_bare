# Name of the final executable
TARGET = bin/bare

# Source and object folders
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

# Include directory
INCLUDE_DIR = include

# Compiler flags
CFLAGS = -I$(INCLUDE_DIR)

default: $(TARGET)

run: clean default
	./$(TARGET)

clean:
	rm -rf obj/*.o
	rm -rf bin/*

$(TARGET): $(OBJ)
	gcc -o $@ $^

obj/%.o: src/%.c | obj
	gcc $(CFLAGS) -c $< -o $@

# Create the obj directory if it doesn't exist
obj:
	mkdir -p obj
