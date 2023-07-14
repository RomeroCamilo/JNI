# TODO ADD DEPENDECY FOR C FILE WHERE IT RECOMPILES LIBRARY IF CHANGE OCCURRED. #
JC = javac
J = java # UPDATE MRX TOP
CC = gcc # GNU C Compiler used to compile the C code #
CFLAGS = -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/darwin # This line sets the variable CFLAGS to the compiler flags that will be used during compilation. #
DYLIB = libsum.dylib # name of dynamic library #
LIBS = -shared -o $(DYLIB) # specifies that the resulting object file should be shared (-shared) and the output should be named libsum.dylib (-o libsum.dylib). # 
C_FILE = csum.c # name of C file containing defined JNI C function #
JAVA_FILE = Main.java # name of java file testing the C function #

all: libsum.dylib Main.h # default all target # 

# Targets
libsum.dylib: csum.o # Fix: rename target to actual file name. Handles C side of the JNI program. update libsum is csum.o update. #
	$(CC) $(CFLAGS) $(LIBS) $(C_FILE)

csum.o: csum.c # generates csum.o 
	$(CC) -c -fPIC $(CFLAGS) $(C_FILE) 

#-I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/darwin
# Java modification handling

# Main.h generated/updated after target below. #
Main.h: Main.java 
	$(JC) -h . $(JAVA_FILE)

# Targets below handle compiling and running the code. #

compile: # cSum.o contains compiled code for the shared library to use. compile human readable java code into bytecode. #
	$(JC) $(JAVA_FILE) 

run: # launches java virtual machine and executes the bytecode. #
	$(J) $(JAVA_FILE)

.PHONY: clean # PHONY: define target that does not involve physical file. #

# removes the shared library when 'make clean' is input #
clean:
	rm -f $(DYLIB)