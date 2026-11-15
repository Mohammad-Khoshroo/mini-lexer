lexer grammar TemplateLexer;

// ============================================ 
// Lexer Rules (Tokens)
// ============================================

// Sample regular expression rules:
R1: [abc]* 'abc';
R2: ('a' | ('b' 'a'* 'c')) ('a' | ('b' 'a'* 'c'))*;
R3: ([ab]* ('cbb')+)+;
R4: [bc]* 'a' [bc]* 'a' [bc]* ('a' [bc]* 'a' [bc]*)*;

// Whitespace and unrecognized character handling
WS: [ \t\r\n]+ -> skip;
UNKNOWN: .;
