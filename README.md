# What is a Lexical Analyzer
A Lexical Analyzer is the first step in the compilation process of the code. It converts the input code into a tokenized sequence upon which further operations take place. The tokens are also put in their categories, which in the case of C++ are keywords, identifiers, operators and so on.

## A sample input and output
### C++ input code
```cpp
int main(void) {
    int number = 0;
    if (number == 1) {
        return 1;
    }
    return 0;
}
```
### Lexyarg's tokenized output
```text
KEYWORD         int                 Line 1
IDENTIFIER      main                Line 1
PUNCTUATOR      (                   Line 1
KEYWORD         void                Line 1
PUNCTUATOR      )                   Line 1
PUNCTUATOR      {                   Line 1
NEW LINE
… and so on
```

## How to compile?
### Dependencies
- Flex, install using `sudo apt install flex`
- GCC

```bash
flex lexyarg.l
gcc lex.yy.c -lfl -o output
./output {input file} {output file}
```

## Credits and Info
Built as a mini project for my Formal Languages and Automata Theory course under the guidance of Dr. Muhammad Sajid Ali