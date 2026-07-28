# How to run the LEXER

``` bash

mkdir -p .antlr
java -jar utils/antlr-4.13.1-complete.jar -o .antlr vrlexer.g4
javac -d .antlr -cp ".:utils/antlr-4.13.1-complete.jar" lex.java .antlr/vrlexer.java
java -cp ".antlr:utils/antlr-4.13.1-complete.jar" lex

```

for cleaning just do this:

```bash

rm -rf .antlr && mkdir -p .antlr

```