# TPTP to KeY Parser

This repository contains a parser for translating TPTP first-order set theory problems into a format suitable for the KeY theorem prover.
The parser does not cover the whole TPTP-Syntax, it is taylored towards the first order set theoretic part of the TPTP language.

## Files and Directories

- **tptp.y**: Bison file that defines the grammar for the TPTP parser.
- **tptp.l**: Flex file that defines the lexical analyzer for the TPTP parser.
- **Makefile**: Makefile for compiling the parser into an executable named `TPTP_to_KeY`.
- **fof**: Directory containing 170 TPTP first-order set theory problem files.
- **compile.py**: Python script that executes the parser on each problem file in `fof` and writes the parsed files to the `compiled` directory if parsing is successful.

## Prerequisites

To compile and run the parser, you will need the following software installed on your system:

- **Bison**
- **Flex**
- **GCC**
- **Python 3**

## Setup and Compilation

1. **Install prerequisites:**
   Ensure that Bison, Flex, GCC, and Python 3 are installed on your system. 

   ```sh
   sudo apt-get update
   sudo apt-get install bison flex gcc python3
   ```

2. **Compile the parser:**
   Navigate to the repository directory and run the following command to compile the parser:

   ```sh
   make
   ```

   This will generate an executable named `TPTP_to_KeY`.

## Usage

1. **Parse TPTP files:**
   Use the `compile.py` script to run the parser on each problem file in the `fof` directory. The parsed files will be written to the `compiled` directory.

   ```sh
   python3 compile.py fof compiled
   ```

   This command will execute `TPTP_to_KeY` on each file in `fof` and save the successfully parsed files to the `compiled` directory.
   The folders for the input and output are specified when calling the script.

## Directory Structure

```
├── tptp.y
├── tptp.l
├── Makefile
├── fof
│   ├── problem1.tptp
│   ├── problem2.tptp
│   └── ...
├── compile.py
└── compiled (generated during execution)
```
