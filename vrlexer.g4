lexer grammar vrlexer;

// ============================================ 

// write your rule in order

// ============================================


// R1:  (b+c)* a (b+c)* a (b+c)* (a (b+c)* a (b+c)*)*
R1: [bc]* 'a' [bc]* 'a' [bc]* ('a' [bc]* 'a' [bc]*)*;

// R2:  (a+bc)(a + ba*c)*
R2: ('a' | ('b' 'a'* 'c') ) ('a' | ('b' 'a'* 'c') )*;

// R3:  ((a+b)*(cbb)+)+
R3: ( [ab]* ('cbb')+ )+;

// R4 : (a+b+c)* abc
R4: [abc]* 'abc';

// ============================================ 

// for silent skip uncomment it

// ============================================

//  UNKNOWN : . -> skip ;
// UNKNOWN : . { System.out.println("Warning: Skipping invalid character '" + getText() + "'"); } -> skip ;

UNKNOWN : . ;