lexer grammar vrlexer;

// ============================================ 

// write your rule in order

// ============================================

// R1 : (a* b* c*)* abc = (a+b+c)* abc
R1: [abc]* 'abc';

// R2:  ( (a+b)* (cbb)^+)^+
R2: ([ab]* 'cbb'+)+;

// R3:  (a+bc)(a + ba*c)*
R3: ('a' | ('b' 'a'* 'c') ) ('a' | ('b' 'a'* 'c') )*;

// R4:  (b+c)* a (b+c)* a (b+c)* (a (b+c)* a (b+c)*)*
R4: [bc]* 'a' [bc]* 'a' [bc]* ('a' [bc]* 'a' [bc]*)*;

// ============================================ 

// for silent skip uncomment it

// ============================================

//  UNKNOWN : . -> skip ;
// UNKNOWN : . { System.out.println("Warning: Skipping invalid character '" + getText() + "'"); } -> skip ;

UNKNOWN : . ;