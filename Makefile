CC		:= gcc
CFLAGS	:= -std=c99 -Wall -Wextra -g
RANDFLAGS := -std=gnu99 -Wall -Wextra -g
OMPFLAG := -fopenmp
CUDAFLAG := 

BIN		:= ./bin
SRC		:= ./src
OUTPUT	:= ./output
TEST	:= ./test/
TESTOUTPUT := ./test/testOutput

all: mandelbrot mandel-openmp mandel-cuda

mandelbrot: $(SRC)/mandelbrot.c Makefile
	$(CC) $(CFLAGS) $(SRC)/mandelbrot.c -o $(BIN)/mandelbrot

mandel-openmp: $(SRC)/mandel-openmp.c Makefile
	$(CC) $(CFLAGS) $(OMPFLAG) $(SRC)/mandel-openmp.c -o $(BIN)/mandel-openmp

mandel-cuda: $(SRC)/mandel-cuda.cu
	$(CC) $(CFLAGS) $(CUDAFLAG) $(SRC)/mandel-openmp.c -o $(BIN)/mandel-openmp

tests:
	-$(TEST)/unit_tests.sh test_logs.txt

clean: 
	-rm -f $(BIN)/*
	-rm -f $(OUTPUT)/*

cleanTests:
	-rm -f $(TESTOUTPUT)/*
	-rm -f diff.out
	-rm -f test_logs.txt
	-rm -f log_slurm.*