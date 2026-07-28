# How to run the LEXER

first install antler4 extension and config it with :
``` json
"antlr4.generation.outputDir": "build"
```
it's make we skip the first command of bellow.

``` bash

java -jar utils/antlr-4.13.1-complete.jar -o .antlr vrlexer.g4
javac -d .antlr -cp ".:utils/antlr-4.13.1-complete.jar" lex.java .antlr/vrlexer.java
java -cp ".antlr:utils/antlr-4.13.1-complete.jar" lex

```